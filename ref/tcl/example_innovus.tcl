setLibraryUnit -time 1ps


setMultiCpuUsage -localCpu 8
source ./Default.globals
init_design

# this is example tcl to make a flexible floorplan size

#set cellheight [expr 0.270 * 4 ]
#set cellhgrid  0.216

#set fpxdim [expr $cellhgrid * 400 ]
#set fpydim [expr $cellheight * 74 ]

#floorPlan -site coreSite -s $fpxdim $fpydim 0 0 0 0
#You might want to change floorplan according to your design
floorPlan -site coreSite -d 500 500 5 5 5 5

puts "Floorplan is $fpxdim by $fpydim"
puts "Total area is [expr $fpxdim * $fpydim ] square um"
puts "[expr $fpydim / $cellheight] standard cell rows tall"

# Innovus is not putting tracks on the bottom cell row. That causes problems
# since it won't route to them on proper tracks.

# This moves the core up one.
# Weirdly, it moves it up 1.008, but that seems to fix the track issue.
#changeFloorplan -coreToBottom 1.08

add_tracks -honor_pitch 

clearGlobalNets
#global net names are case sensitive.

#globalNetConnect VDD -type pgpin -pin vdd -inst * -module {}
#globalNetConnect VSS -type pgpin -pin vss -inst * -module {}
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}

#addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 150 -inRowOffset 10.564
addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 7.6 -inRowOffset 2 -prefix WELLTAP


#####Power Planning 
#Note: You can add power rings: Commands to put power rings are given below in comments.

##Power rings
#addRing -nets {VDD VSS } -around default_power_domain -center 1 -width 1.224 -spacing 0.5 -layer {left M3 right M3 bottom M2 top M2} -extend_corner {lb lt rb rt bl tl br tr}
#saveDesign conv_pool.power.enc

#Sprecial routing using M1
#sroute -connect { blockPin padPin padRing corePin floatingStripe } -nets {VDD VSS } -layerChangeRange { M1 M3 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 Pad } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 Pad }
#saveDesign conv_pool_specialRoute.enc

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

### Intervene Here. Manually fix the Top M1 Follow Rail

# setViaGenMode -viarule_preference { M2_M1p }
source "m2followRail.tcl"

setViaGenMode -viarule_preference { M6_M5widePWR1p152 M5_M4widePWR0p864 M4_M3widePWR0p864 }

# ! VALUES BELOW MAY NEED TO BE ADJUSTED FOR HOW innovus INTERPRETS YOUR FLOORPLAN

# has to be 5, 9, 13, ... change the 8 to widen by 4 min widths

set m3pwrwidth [expr 0.072 * (5 + (4 * 2))]
set m3pwrset2settracks  220
set m3pwrset2setdist    [expr $m3pwrset2settracks * 0.144]
print "M3 PWR width, temp and set to set distance: $m3pwrwidth $m3pwrset2settracks $m3pwrset2setdist"

# must be odd multiple of width and space so we get an even number of intervening tracks and stay on grid

set m3pwrspacing [expr 0.072 * 21]

# the xoffset specifies the left edge of the 1st wire.
# since the 1st track is wire (not 1/2 space) now we need an even number (width + space) for xoffset

set m3pwrxoffset [expr (0.072 * 26) + 0.036]
print "M3 PWR spacing and offset: $m3pwrspacing $m3pwrxoffset"

addStripe -extend_to design_boundary \
    -skip_via_on_wire_shape Noshape \
    -max_same_layer_jog_length 0.32 \
    -set_to_set_distance $m3pwrset2setdist \
    -skip_via_on_pin Standardcell \
    -stacked_via_top_layer Pad \
    -spacing $m3pwrspacing \
    -xleft_offset $m3pwrxoffset \
    -merge_stripes_value 0.16 \
    -layer M3 \
    -width $m3pwrwidth \
    -nets {VDD VSS} \
    -stacked_via_bottom_layer M2

set m4pwrwidth [expr 0.096 * (5 + (4 * 1))]
set m4pwrset2settracks  320
set m4pwrset2setdist    [expr $m4pwrset2settracks * 0.192]
print "M4 PWR width, temp and set to set distance: $m4pwrwidth $m4pwrset2settracks $m4pwrset2setdist"

# must be odd multiple of width and space so we get an even number of intervening tracks and stay on grid

set m4pwrspacing [expr 0.096 * 21]

# the xoffset specifies the left edge of the 1st wire.
# since the 1st track is wire (not 1/2 space) now we need an even number (width + space) for xoffset

set m4pwrxoffset [expr (0.096 * 26) - 0.036]
print "M4 PWR spacing and offset: $m4pwrspacing $m4pwrxoffset"

setAddStripeMode \
    -max_via_size { Stripe 100 100 100 } \
    -via_using_exact_crossover_size true \
    -stacked_via_bottom_layer M3 \
    -stacked_via_top_layer M4

addStripe -extend_to design_boundary \
    -direction horizontal \
    -skip_via_on_wire_shape Noshape \
    -max_same_layer_jog_length 0.32 \
    -set_to_set_distance $m4pwrset2setdist \
    -skip_via_on_pin Standardcell \
    -spacing $m4pwrspacing \
    -start_offset $m4pwrxoffset \
    -merge_stripes_value 0.16 \
    -layer M4 \
    -width $m4pwrwidth \
    -nets {VDD VSS}

set m5pwrwidth [expr 0.096 * (5 + (4 * 1))]
set m5pwrset2settracks  320
set m5pwrset2setdist    [expr $m5pwrset2settracks * 0.192]
print "M5 PWR width, temp and set to set distance: $m5pwrwidth $m5pwrset2settracks $m5pwrset2setdist"

# must be odd multiple of width and space so we get an even number of intervening tracks and stay on grid

set m5pwrspacing [expr 0.096 * 21]

# the xoffset specifies the left edge of the 1st wire.
# since the 1st track is wire (not 1/2 space) now we need an even number (width + space) for xoffset

set m5pwrxoffset [expr (0.096 * 70) + 0.024 ]
print "M5 PWR spacing and offset: $m5pwrspacing $m5pwrxoffset"

setAddStripeMode -stacked_via_bottom_layer M4 \
    -stacked_via_top_layer M5

setViaGenMode -bar_cut_orientation horizontal

addStripe -extend_to design_boundary \
    -direction vertical \
    -skip_via_on_wire_shape Noshape \
    -max_same_layer_jog_length 0.32 \
    -set_to_set_distance $m5pwrset2setdist \
    -skip_via_on_pin Standardcell \
    -spacing $m5pwrspacing \
    -start_offset $m5pwrxoffset \
    -merge_stripes_value 0.16 \
    -layer M5 \
    -width $m5pwrwidth \
    -nets {VDD VSS}

set m6pwrwidth [expr 0.128 * (5 + (4 * 1))]
set m6pwrset2settracks  220
set m6pwrset2setdist    [expr $m6pwrset2settracks * 0.256]
print "M6 PWR width, temp and set to set distance: $m6pwrwidth $m6pwrset2settracks $m6pwrset2setdist"

# must be odd multiple of width and space so we get an even number of intervening tracks and stay on grid

set m6pwrspacing [expr 0.128 * 21]

# the xoffset specifies the left edge of the 1st wire.
# since the 1st track is wire (not 1/2 space) now we need an even number (width + space) for xoffset

set m6pwrxoffset [expr (0.128 * 50) + 0.008 ]
print "M6 PWR spacing and offset: $m6pwrspacing $m6pwrxoffset"

setAddStripeMode -stacked_via_bottom_layer M5 \
    -stacked_via_top_layer M6

setViaGenMode -bar_cut_orientation vertical

addStripe -extend_to design_boundary \
    -direction horizontal \
    -skip_via_on_wire_shape Noshape \
    -max_same_layer_jog_length 0.32 \
    -set_to_set_distance $m6pwrset2setdist \
    -skip_via_on_pin Standardcell \
    -spacing $m6pwrspacing \
    -start_offset $m6pwrxoffset \
    -merge_stripes_value 0.16 \
    -layer M6 \
    -width $m6pwrwidth \
    -nets {VDD VSS}

timeDesign -prePlace

createBasicPathGroups

setMaxRouteLayer 6
set_interactive_constraint_modes common
create_clock -name clk  -period 300 -waveform {0 150} [get_ports clk]
report_clocks
setOptMode -usefulSkew false \
    -allEndPoints true \
    -fixHoldAllowSetupTnsDegrade false 

#placement of pins

getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 6 -spreadType side -pin {clk {image_4x4_b[0]} {image_4x4_b[1]} {image_4x4_b[2]} {image_4x4_b[3]} {image_4x4_b[4]} {image_4x4_b[5]} {image_4x4_b[6]} {image_4x4_b[7]} {image_4x4_b[8]} {image_4x4_b[9]} {image_4x4_b[10]} {image_4x4_b[11]} {image_4x4_b[12]} {image_4x4_b[13]} {image_4x4_b[14]} {image_4x4_b[15]} {image_4x4_b[16]} {image_4x4_b[17]} {image_4x4_b[18]} {image_4x4_b[19]} {image_4x4_b[20]} {image_4x4_b[21]} {image_4x4_b[22]} {image_4x4_b[23]} {image_4x4_b[24]} {image_4x4_b[25]} {image_4x4_b[26]} {image_4x4_b[27]} {image_4x4_b[28]} {image_4x4_b[29]} {image_4x4_b[30]} {image_4x4_b[31]} {image_4x4_b[32]} {image_4x4_b[33]} {image_4x4_b[34]} {image_4x4_b[35]} {image_4x4_b[36]} {image_4x4_b[37]} {image_4x4_b[38]} {image_4x4_b[39]} {image_4x4_b[40]} {image_4x4_b[41]} {image_4x4_b[42]} {image_4x4_b[43]} {image_4x4_b[44]} {image_4x4_b[45]} {image_4x4_b[46]} {image_4x4_b[47]} {image_4x4_b[48]} {image_4x4_b[49]} {image_4x4_b[50]} {image_4x4_b[51]} {image_4x4_b[52]} {image_4x4_b[53]} {image_4x4_b[54]} {image_4x4_b[55]} {image_4x4_b[56]} {image_4x4_b[57]} {image_4x4_b[58]} {image_4x4_b[59]} {image_4x4_b[60]} {image_4x4_b[61]} {image_4x4_b[62]} {image_4x4_b[63]} {image_4x4_b[64]} {image_4x4_b[65]} {image_4x4_b[66]} {image_4x4_b[67]} {image_4x4_b[68]} {image_4x4_b[69]} {image_4x4_b[70]} {image_4x4_b[71]} {image_4x4_b[72]} {image_4x4_b[73]} {image_4x4_b[74]} {image_4x4_b[75]} {image_4x4_b[76]} {image_4x4_b[77]} {image_4x4_b[78]} {image_4x4_b[79]} {image_4x4_b[80]} {image_4x4_b[81]} {image_4x4_b[82]} {image_4x4_b[83]} {image_4x4_b[84]} {image_4x4_b[85]} {image_4x4_b[86]} {image_4x4_b[87]} {image_4x4_b[88]} {image_4x4_b[89]} {image_4x4_b[90]} {image_4x4_b[91]} {image_4x4_b[92]} {image_4x4_b[93]} {image_4x4_b[94]} {image_4x4_b[95]} {image_4x4_b[96]} {image_4x4_b[97]} {image_4x4_b[98]} {image_4x4_b[99]} {image_4x4_b[100]} {image_4x4_b[101]} {image_4x4_b[102]} {image_4x4_b[103]} {image_4x4_b[104]} {image_4x4_b[105]} {image_4x4_b[106]} {image_4x4_b[107]} {image_4x4_b[108]} {image_4x4_b[109]} {image_4x4_b[110]} {image_4x4_b[111]} {image_4x4_b[112]} {image_4x4_b[113]} {image_4x4_b[114]} {image_4x4_b[115]} {image_4x4_b[116]} {image_4x4_b[117]} {image_4x4_b[118]} {image_4x4_b[119]} {image_4x4_b[120]} {image_4x4_b[121]} {image_4x4_b[122]} {image_4x4_b[123]} {image_4x4_b[124]} {image_4x4_b[125]} {image_4x4_b[126]} {image_4x4_b[127]} {kernel_b[0]} {kernel_b[1]} {kernel_b[2]} {kernel_b[3]} {kernel_b[4]} {kernel_b[5]} {kernel_b[6]} {kernel_b[7]} {kernel_b[8]} {kernel_b[9]} {kernel_b[10]} {kernel_b[11]} {kernel_b[12]} {kernel_b[13]} {kernel_b[14]} {kernel_b[15]} {kernel_b[16]} {kernel_b[17]} {kernel_b[18]} {kernel_b[19]} {kernel_b[20]} {kernel_b[21]} {kernel_b[22]} {kernel_b[23]} {kernel_b[24]} {kernel_b[25]} {kernel_b[26]} {kernel_b[27]} {kernel_b[28]} {kernel_b[29]} {kernel_b[30]} {kernel_b[31]} {kernel_b[32]} {kernel_b[33]} {kernel_b[34]} {kernel_b[35]} {kernel_b[36]} {kernel_b[37]} {kernel_b[38]} {kernel_b[39]} {kernel_b[40]} {kernel_b[41]} {kernel_b[42]} {kernel_b[43]} {kernel_b[44]} {kernel_b[45]} {kernel_b[46]} {kernel_b[47]} {kernel_b[48]} {kernel_b[49]} {kernel_b[50]} {kernel_b[51]} {kernel_b[52]} {kernel_b[53]} {kernel_b[54]} {kernel_b[55]} {kernel_b[56]} {kernel_b[57]} {kernel_b[58]} {kernel_b[59]} {kernel_b[60]} {kernel_b[61]} {kernel_b[62]} {kernel_b[63]} {kernel_b[64]} {kernel_b[65]} {kernel_b[66]} {kernel_b[67]} {kernel_b[68]} {kernel_b[69]} {kernel_b[70]} {kernel_b[71]} rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 5 -spreadType side -pin {{image_4x4_g[0]} {image_4x4_g[1]} {image_4x4_g[2]} {image_4x4_g[3]} {image_4x4_g[4]} {image_4x4_g[5]} {image_4x4_g[6]} {image_4x4_g[7]} {image_4x4_g[8]} {image_4x4_g[9]} {image_4x4_g[10]} {image_4x4_g[11]} {image_4x4_g[12]} {image_4x4_g[13]} {image_4x4_g[14]} {image_4x4_g[15]} {image_4x4_g[16]} {image_4x4_g[17]} {image_4x4_g[18]} {image_4x4_g[19]} {image_4x4_g[20]} {image_4x4_g[21]} {image_4x4_g[22]} {image_4x4_g[23]} {image_4x4_g[24]} {image_4x4_g[25]} {image_4x4_g[26]} {image_4x4_g[27]} {image_4x4_g[28]} {image_4x4_g[29]} {image_4x4_g[30]} {image_4x4_g[31]} {image_4x4_g[32]} {image_4x4_g[33]} {image_4x4_g[34]} {image_4x4_g[35]} {image_4x4_g[36]} {image_4x4_g[37]} {image_4x4_g[38]} {image_4x4_g[39]} {image_4x4_g[40]} {image_4x4_g[41]} {image_4x4_g[42]} {image_4x4_g[43]} {image_4x4_g[44]} {image_4x4_g[45]} {image_4x4_g[46]} {image_4x4_g[47]} {image_4x4_g[48]} {image_4x4_g[49]} {image_4x4_g[50]} {image_4x4_g[51]} {image_4x4_g[52]} {image_4x4_g[53]} {image_4x4_g[54]} {image_4x4_g[55]} {image_4x4_g[56]} {image_4x4_g[57]} {image_4x4_g[58]} {image_4x4_g[59]} {image_4x4_g[60]} {image_4x4_g[61]} {image_4x4_g[62]} {image_4x4_g[63]} {image_4x4_g[64]} {image_4x4_g[65]} {image_4x4_g[66]} {image_4x4_g[67]} {image_4x4_g[68]} {image_4x4_g[69]} {image_4x4_g[70]} {image_4x4_g[71]} {image_4x4_g[72]} {image_4x4_g[73]} {image_4x4_g[74]} {image_4x4_g[75]} {image_4x4_g[76]} {image_4x4_g[77]} {image_4x4_g[78]} {image_4x4_g[79]} {image_4x4_g[80]} {image_4x4_g[81]} {image_4x4_g[82]} {image_4x4_g[83]} {image_4x4_g[84]} {image_4x4_g[85]} {image_4x4_g[86]} {image_4x4_g[87]} {image_4x4_g[88]} {image_4x4_g[89]} {image_4x4_g[90]} {image_4x4_g[91]} {image_4x4_g[92]} {image_4x4_g[93]} {image_4x4_g[94]} {image_4x4_g[95]} {image_4x4_g[96]} {image_4x4_g[97]} {image_4x4_g[98]} {image_4x4_g[99]} {image_4x4_g[100]} {image_4x4_g[101]} {image_4x4_g[102]} {image_4x4_g[103]} {image_4x4_g[104]} {image_4x4_g[105]} {image_4x4_g[106]} {image_4x4_g[107]} {image_4x4_g[108]} {image_4x4_g[109]} {image_4x4_g[110]} {image_4x4_g[111]} {image_4x4_g[112]} {image_4x4_g[113]} {image_4x4_g[114]} {image_4x4_g[115]} {image_4x4_g[116]} {image_4x4_g[117]} {image_4x4_g[118]} {image_4x4_g[119]} {image_4x4_g[120]} {image_4x4_g[121]} {image_4x4_g[122]} {image_4x4_g[123]} {image_4x4_g[124]} {image_4x4_g[125]} {image_4x4_g[126]} {image_4x4_g[127]} {kernel_g[0]} {kernel_g[1]} {kernel_g[2]} {kernel_g[3]} {kernel_g[4]} {kernel_g[5]} {kernel_g[6]} {kernel_g[7]} {kernel_g[8]} {kernel_g[9]} {kernel_g[10]} {kernel_g[11]} {kernel_g[12]} {kernel_g[13]} {kernel_g[14]} {kernel_g[15]} {kernel_g[16]} {kernel_g[17]} {kernel_g[18]} {kernel_g[19]} {kernel_g[20]} {kernel_g[21]} {kernel_g[22]} {kernel_g[23]} {kernel_g[24]} {kernel_g[25]} {kernel_g[26]} {kernel_g[27]} {kernel_g[28]} {kernel_g[29]} {kernel_g[30]} {kernel_g[31]} {kernel_g[32]} {kernel_g[33]} {kernel_g[34]} {kernel_g[35]} {kernel_g[36]} {kernel_g[37]} {kernel_g[38]} {kernel_g[39]} {kernel_g[40]} {kernel_g[41]} {kernel_g[42]} {kernel_g[43]} {kernel_g[44]} {kernel_g[45]} {kernel_g[46]} {kernel_g[47]} {kernel_g[48]} {kernel_g[49]} {kernel_g[50]} {kernel_g[51]} {kernel_g[52]} {kernel_g[53]} {kernel_g[54]} {kernel_g[55]} {kernel_g[56]} {kernel_g[57]} {kernel_g[58]} {kernel_g[59]} {kernel_g[60]} {kernel_g[61]} {kernel_g[62]} {kernel_g[63]} {kernel_g[64]} {kernel_g[65]} {kernel_g[66]} {kernel_g[67]} {kernel_g[68]} {kernel_g[69]} {kernel_g[70]} {kernel_g[71]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 3 -layer 3 -spreadType side -pin {{image_4x4_r[0]} {image_4x4_r[1]} {image_4x4_r[2]} {image_4x4_r[3]} {image_4x4_r[4]} {image_4x4_r[5]} {image_4x4_r[6]} {image_4x4_r[7]} {image_4x4_r[8]} {image_4x4_r[9]} {image_4x4_r[10]} {image_4x4_r[11]} {image_4x4_r[12]} {image_4x4_r[13]} {image_4x4_r[14]} {image_4x4_r[15]} {image_4x4_r[16]} {image_4x4_r[17]} {image_4x4_r[18]} {image_4x4_r[19]} {image_4x4_r[20]} {image_4x4_r[21]} {image_4x4_r[22]} {image_4x4_r[23]} {image_4x4_r[24]} {image_4x4_r[25]} {image_4x4_r[26]} {image_4x4_r[27]} {image_4x4_r[28]} {image_4x4_r[29]} {image_4x4_r[30]} {image_4x4_r[31]} {image_4x4_r[32]} {image_4x4_r[33]} {image_4x4_r[34]} {image_4x4_r[35]} {image_4x4_r[36]} {image_4x4_r[37]} {image_4x4_r[38]} {image_4x4_r[39]} {image_4x4_r[40]} {image_4x4_r[41]} {image_4x4_r[42]} {image_4x4_r[43]} {image_4x4_r[44]} {image_4x4_r[45]} {image_4x4_r[46]} {image_4x4_r[47]} {image_4x4_r[48]} {image_4x4_r[49]} {image_4x4_r[50]} {image_4x4_r[51]} {image_4x4_r[52]} {image_4x4_r[53]} {image_4x4_r[54]} {image_4x4_r[55]} {image_4x4_r[56]} {image_4x4_r[57]} {image_4x4_r[58]} {image_4x4_r[59]} {image_4x4_r[60]} {image_4x4_r[61]} {image_4x4_r[62]} {image_4x4_r[63]} {image_4x4_r[64]} {image_4x4_r[65]} {image_4x4_r[66]} {image_4x4_r[67]} {image_4x4_r[68]} {image_4x4_r[69]} {image_4x4_r[70]} {image_4x4_r[71]} {image_4x4_r[72]} {image_4x4_r[73]} {image_4x4_r[74]} {image_4x4_r[75]} {image_4x4_r[76]} {image_4x4_r[77]} {image_4x4_r[78]} {image_4x4_r[79]} {image_4x4_r[80]} {image_4x4_r[81]} {image_4x4_r[82]} {image_4x4_r[83]} {image_4x4_r[84]} {image_4x4_r[85]} {image_4x4_r[86]} {image_4x4_r[87]} {image_4x4_r[88]} {image_4x4_r[89]} {image_4x4_r[90]} {image_4x4_r[91]} {image_4x4_r[92]} {image_4x4_r[93]} {image_4x4_r[94]} {image_4x4_r[95]} {image_4x4_r[96]} {image_4x4_r[97]} {image_4x4_r[98]} {image_4x4_r[99]} {image_4x4_r[100]} {image_4x4_r[101]} {image_4x4_r[102]} {image_4x4_r[103]} {image_4x4_r[104]} {image_4x4_r[105]} {image_4x4_r[106]} {image_4x4_r[107]} {image_4x4_r[108]} {image_4x4_r[109]} {image_4x4_r[110]} {image_4x4_r[111]} {image_4x4_r[112]} {image_4x4_r[113]} {image_4x4_r[114]} {image_4x4_r[115]} {image_4x4_r[116]} {image_4x4_r[117]} {image_4x4_r[118]} {image_4x4_r[119]} {image_4x4_r[120]} {image_4x4_r[121]} {image_4x4_r[122]} {image_4x4_r[123]} {image_4x4_r[124]} {image_4x4_r[125]} {image_4x4_r[126]} {image_4x4_r[127]} {kernel_r[0]} {kernel_r[1]} {kernel_r[2]} {kernel_r[3]} {kernel_r[4]} {kernel_r[5]} {kernel_r[6]} {kernel_r[7]} {kernel_r[8]} {kernel_r[9]} {kernel_r[10]} {kernel_r[11]} {kernel_r[12]} {kernel_r[13]} {kernel_r[14]} {kernel_r[15]} {kernel_r[16]} {kernel_r[17]} {kernel_r[18]} {kernel_r[19]} {kernel_r[20]} {kernel_r[21]} {kernel_r[22]} {kernel_r[23]} {kernel_r[24]} {kernel_r[25]} {kernel_r[26]} {kernel_r[27]} {kernel_r[28]} {kernel_r[29]} {kernel_r[30]} {kernel_r[31]} {kernel_r[32]} {kernel_r[33]} {kernel_r[34]} {kernel_r[35]} {kernel_r[36]} {kernel_r[37]} {kernel_r[38]} {kernel_r[39]} {kernel_r[40]} {kernel_r[41]} {kernel_r[42]} {kernel_r[43]} {kernel_r[44]} {kernel_r[45]} {kernel_r[46]} {kernel_r[47]} {kernel_r[48]} {kernel_r[49]} {kernel_r[50]} {kernel_r[51]} {kernel_r[52]} {kernel_r[53]} {kernel_r[54]} {kernel_r[55]} {kernel_r[56]} {kernel_r[57]} {kernel_r[58]} {kernel_r[59]} {kernel_r[60]} {kernel_r[61]} {kernel_r[62]} {kernel_r[63]} {kernel_r[64]} {kernel_r[65]} {kernel_r[66]} {kernel_r[67]} {kernel_r[68]} {kernel_r[69]} {kernel_r[70]} {kernel_r[71]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 4 -spreadType side -pin {{input_addr[0]} {input_addr[1]} {input_addr[2]} {input_addr[3]} {input_addr[4]} {input_addr[5]} {input_addr[6]} {input_addr[7]} {input_addr[8]} {input_addr[9]} {input_addr[10]} {input_addr[11]} {input_addr[12]} {input_addr[13]} {input_addr[14]} {input_addr[15]} input_re {output_addr[0]} {output_addr[1]} {output_addr[2]} {output_addr[3]} {output_addr[4]} {output_addr[5]} {output_addr[6]} {output_addr[7]} {output_addr[8]} {output_addr[9]} {output_addr[10]} {output_addr[11]} {output_addr[12]} {output_addr[13]} {output_addr[14]} {output_addr[15]} output_we {y[0]} {y[1]} {y[2]} {y[3]} {y[4]} {y[5]} {y[6]} {y[7]}}
setPinAssignMode -pinEditInBatch false

saveDesign conv_pool.pin.enc


# placement pre-clock cts goes here... place your standard cells
#### Place Design
setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_reorder_scan false
setPlaceMode -place_global_cong_effort low
place_opt_design

# CTS

setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {f t t t t t t t t t} \
    -routeTopRoutingLayer 6 -routeBottomRoutingLayer 2 \
    -routeWithViaInPin true 

# set desired clock cells here...
set_ccopt_property buffer_cells {BUFx10_ASAP7_75t_R BUFx12_ASAP7_75t_R BUFx12f_ASAP7_75t_R BUFx16f_ASAP7_75t_R BUFx24_ASAP7_75t_R BUFx2_ASAP7_75t_R BUFx3_ASAP7_75t_R BUFx4_ASAP7_75t_R BUFx5_ASAP7_75t_R BUFx4f_ASAP7_75t_R BUFx6f_ASAP7_75t_R BUFx8_ASAP7_75t_R HB1xp67_ASAP7_75t_R HB2xp67_ASAP7_75t_R}

#set_ccopt_property inverter_cells {INVx11_ASAP7_75t_R INVx13_ASAP7_75t_R INVx1_ASAP7_75t_R INVx2_ASAP7_75t_R INVx3_ASAP7_75t_R INVx4_ASAP7_75t_R INVx5_ASAP7_75t_R INVx6_ASAP7_75t_R INVx8_ASAP7_75t_R INVxp67_ASAP7_75t_R INVxp33_ASAP7_75t_R}

#set_ccopt_property target_skew 5ps 
#set_ccopt_property target_max_trans 30ps
#setNanoRouteMode -routeTopRoutingLayer 5 -routeBottomRoutingLayer 2
#create_route_type -name ccopt_route_group -bottom_preferred_layer 4 -top_preferred_layer 5
#create_ccopt_clock_tree_spec
#ccopt_design -cts

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
create_ccopt_clock_tree_spec -filename ./cts/ccopt.spec
source ./cts/ccopt.spec
    
# Run CCopt
ccopt_design -outDir ./cts/
    
# Report timing
timeDesign -postCTS -expandedViews -outDir ./cts/timing/
    
# Report clock trees to check area and other statistics
report_ccopt_clock_trees -filename ./cts/clock_trees.rpt
report_ccopt_skew_groups -filename ./cts/skew_groups.rpt

#Post CTS
optDesign -postCTS
optDesign -postCTS -hold
saveDesign conv_pool.clock.enc

#Nano routing
setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {t t t t t t t t t t}
setNanoRouteMode -routeWithViaInPin true -routeDesignFixClockNets true -routeTopRoutingLayer 6
setNanoRouteMode -quiet -drouteFixAntenna 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign 

# all done--finish up with decap and finally filler

addFiller -cell {FILLER_ASAP7_75t_R FILLERxp5_ASAP7_75t_R } -prefix FILLER_

#Verify Geometry & Connectivity
verify_drc
verifyGeometry  -error 1000000 -warning 50
verifyConnectivity -type all -noAntenna -error 1000000 -warning 50

#Save final Design
saveNetlist conv_pool.apr.v
saveNetlist conv_pool.apr_pg.v -includePowerGround -excludeLeafCell
saveDesign conv_pool.final.enc

##StreamOutGds



