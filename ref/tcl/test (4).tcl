setLibraryUnit -time 1ps

setMultiCpuUsage -localCpu 11
source ./Default.globals
init_design

floorPlan -site coreSite -r 1 0.5 5 5 5 5

add_tracks -honor_pitch 

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

#sroute -connect { blockPin padPin padRing corePin floatingStripe } -nets {VDD VSS } -layerChangeRange { M1 M3 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 Pad } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 Pad }


#Special routing using M1
setAddStripeMode -stacked_via_bottom_layer M1 \
    -stacked_via_top_layer M2

sroute -connect { blockPin padPin padRing corePin floatingStripe } \
    -layerChangeRange { M1 Pad } \
    -blockPinTarget { nearestTarget } \
    -padPinPortConnect { allPort oneGeom } \
    -padPinTarget { nearestTarget } \
    -corePinTarget { firstAfterRowEnd } \
    -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M1 Pad } \
    -nets { VDD VSS } \
    -allowLayerChange 1 \
    -blockPin useLef \
    -targetViaLayerRange { M1 }

saveDesign conv_pool_specialRoute.enc

timeDesign -prePlace

createBasicPathGroups

setMaxRouteLayer 6
set_interactive_constraint_modes common
# SET TIMING FOR CLK
create_clock -name clk  -period 600 -waveform {0 300} [get_ports clk]


source pin.tcl

##################
#### Place Design
setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_reorder_scan false
setPlaceMode -place_global_cong_effort low
place_opt_design -prefix "place_opt_"


#CHECK TIMING!

# CTS

setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {f t t t t t t t t t} \
    -routeTopRoutingLayer 4 -routeBottomRoutingLayer 2 \
    -routeWithViaInPin true 


set_ccopt_property buffer_cells {BUFx10_ASAP7_75t_R BUFx12_ASAP7_75t_R BUFx12f_ASAP7_75t_R BUFx16f_ASAP7_75t_R BUFx24_ASAP7_75t_R BUFx2_ASAP7_75t_R BUFx3_ASAP7_75t_R BUFx4_ASAP7_75t_R BUFx5_ASAP7_75t_R BUFx4f_ASAP7_75t_R BUFx6f_ASAP7_75t_R BUFx8_ASAP7_75t_R HB1xp67_ASAP7_75t_R HB2xp67_ASAP7_75t_R}

#set_ccopt_property inverter_cells {INVx11_ASAP7_75t_R INVx13_ASAP7_75t_R INVx1_ASAP7_75t_R INVx2_ASAP7_75t_R INVx3_ASAP7_75t_R INVx4_ASAP7_75t_R INVx5_ASAP7_75t_R INVx6_ASAP7_75t_R INVx8_ASAP7_75t_R INVxp67_ASAP7_75t_R INVxp33_ASAP7_75t_R}

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
