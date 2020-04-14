setLibraryUnit -time 1ps

setMultiCpuUsage -localCpu 11
source ./Default.globals
init_design

floorPlan -site coreSite -r 1 0.5 5 5 5 5

add_tracks -honor_pitch 1

clearGlobalNets

globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}

#addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 7.6 -inRowOffset 2 -prefix WELLTAP
addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 150 -inRowOffset 10.564

#setViaGenMode -viarule_preference { M6_M5widePWR1p152 M5_M4widePWR0p864 M4_M3widePWR0p864 M3_M2widePWR0p936}

#####Power Planning 
#Note: You can add power rings: Commands to put power rings are given below in comments.

##Power rings
addRing -nets {VDD VSS } -around default_power_domain -center 1 -width 1.224 -spacing 0.5 -layer {left M3 right M3 bottom M2 top M2} -extend_corner {lb lt rb rt bl tl br tr}

sroute -connect { blockPin padPin padRing corePin floatingStripe } -nets {VDD VSS } -layerChangeRange { M1 M3 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 Pad } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 Pad }
saveDesign conv_pool_specialRoute.enc

#Special routing using M1
timeDesign -prePlace

createBasicPathGroups

setMaxRouteLayer 7
set_interactive_constraint_modes common
# SET TIMING FOR CLK
create_clock -name clk  -period 800 -waveform {0 400} [get_ports clk]

source pin.tcl

##################
#### Place Design

setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {f t t t t t t t t t} \
    -routeTopRoutingLayer 6 -routeBottomRoutingLayer 2 \
    -routeWithViaInPin true 

setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_reorder_scan false
setPlaceMode -place_global_cong_effort low
place_opt_design -prefix "place_opt_"


######################################### CTS

set_ccopt_property buffer_cells {BUFx10_ASAP7_75t_R BUFx12_ASAP7_75t_R BUFx12f_ASAP7_75t_R BUFx16f_ASAP7_75t_R BUFx24_ASAP7_75t_R BUFx2_ASAP7_75t_R BUFx3_ASAP7_75t_R BUFx4_ASAP7_75t_R BUFx5_ASAP7_75t_R BUFx4f_ASAP7_75t_R BUFx6f_ASAP7_75t_R BUFx8_ASAP7_75t_R HB1xp67_ASAP7_75t_R HB2xp67_ASAP7_75t_R}

set_ccopt_property inverter_cells {INVx11_ASAP7_75t_R INVx13_ASAP7_75t_R INVx1_ASAP7_75t_R INVx2_ASAP7_75t_R INVx3_ASAP7_75t_R INVx4_ASAP7_75t_R INVx5_ASAP7_75t_R INVx6_ASAP7_75t_R INVx8_ASAP7_75t_R INVxp67_ASAP7_75t_R INVxp33_ASAP7_75t_R}

set_ccopt_property cts_add_wire_delay_in_detailed_balancer true
set_ccopt_property cts_compute_fastest_drivers_and_slews_for_clustering multi_corner
set_ccopt_property cts_clustering_net_skew_limit_as_proportion_of_skew_target 0.5
set_ccopt_property routing_top_min_fanout 2000
set_ccopt_property cell_density 0.5
set_ccopt_property adjacent_rows_legal false
set_ccopt_property ccopt_auto_limit_insertion_delay_factor 1.0
set_ccopt_property skew_band_size 0.1
set_ccopt_property useful_skew_use_gigaopt_for_mfn_chain_speed true
set_ccopt_property useful_skew_implement_using_wns_windows false
set_ccopt_property target_max_trans  100ps

# Create CTS specification
create_ccopt_clock_tree_spec -filename ./ccopt.spec
source ./ccopt.spec

# Run CCopt
ccopt_design -outDir ./

# Report timing
timeDesign -postCTS -expandedViews -outDir ./timing/
    
# Report clock trees to check area and other statistics
report_ccopt_clock_trees -filename ./clock_trees.rpt
report_ccopt_skew_groups -filename ./skew_groups.rpt

#Post CTS
optDesign -postCTS
optDesign -postCTS -drv
saveDesign conv_pool.clock.enc

#Nano routing
setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {t t t t t t t t t t}
setNanoRouteMode -routeWithViaInPin true -routeDesignFixClockNets true -routeTopRoutingLayer 7
setNanoRouteMode -quiet -drouteFixAntenna 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

getFillerMode -quiet
addFiller -cell {TAPCELL_ASAP7_75t_R FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R} -prefix FILLER
ecoRoute -target

setAnalysisMode -analysisType onChipVariation -cppr both
setOptMode -allEndPoints true
setOptMode -fixFanoutLoad true
setOptMode -fixDrc true
optDesign -postRoute
optDesign -postRoute -drv
optDesign -postRoute -hold -setup

#verifyConnectivity -type all -noAntenna -error 1000000 -warning 50
verify_drc
#verifyGeometry  -error 1000000 -warning 50
#-eolMinOverlap 0.192
verifyConnectivity -type all -noAntenna -error 1000000 -warning 50



extractRC
rcOut -spf  conv_pool.spf
rcOut -spef conv_pool.spef


saveNetlist conv_pool.apr.v -excludeLeafCell -excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}
saveNetlist conv_pool.apr_pg.v -includePowerGround -excludeLeafCell -excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}


streamOut conv_pool.gds -mapFile /afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/cdslib/asap7_TechLib/asap7_fromAPR.layermap -libName conv_pool -units 4000 -mode ALL

saveDesign conv_pool.final.enc

#setAnalysisMode -analysisType onChipVariation -cppr both

summaryReport

