#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Aug 23 11:14:22 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v22.16-s082_1 (64bit) 06/07/2024 09:42 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.16-s082_1 NR240531-0106/22_16-UB (database version 18.20.629) {superthreading v2.20}
#@(#)CDS: AAE 22.16-s024 (64bit) 06/07/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.16-s024_1 () Jun  7 2024 03:27:16 ( )
#@(#)CDS: SYNTECH 22.16-s011_1 () May 27 2024 22:19:09 ( )
#@(#)CDS: CPE v22.16-s050
#@(#)CDS: IQuantus/TQuantus 21.2.2-s347 (64bit) Mon Dec 11 17:11:11 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set_db init_power_nets VDD
set_db init_ground_nets VSS
read_physical -lef {../lef/gsclib045_tech.lef ../lef/gsclib045_macro.lef}
read_netlist ../syn/outputs/counter_netlist.v -top counter
read_mmmc sample.view

connect_global_net VDD -type pg_pin -pin VDD -inst_base_name *
connect_global_net VSS -type pg_pin -pin VSS -inst_base_name *
set_db route_special_via_connect_to_shape { noshape }
route_special -connect core_pin -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target nearest_target -core_pin_target first_after_row_end -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }
set_db place_design_floorplan_mode false
place_design
create_clock_tree_spec
ccopt_design
set_db route_detail_fix_antenna 1
set_db route_antenna_diode_insertion 0
set_db route_with_timing_driven 1
set_db route_with_eco 0
set_db route_with_litho_driven 0
set_db route_detail_post_route_litho_repair 0
set_db route_with_si_driven 1
set_db route_detail_auto_stop 0
set_db route_selected_net_only 0
set_db route_top_routing_layer 11
set_db route_bottom_routing_layer 1
set_db route_detail_end_iteration 1
set_db route_with_timing_driven true
set_db route_with_si_driven true
route_design -global_detail -via_opt -wire_opt
add_fillers -base_cells FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 FILL1 -prefix FILLER
set_db check_drc_disable_rules {}
set_db check_drc_ndr_spacing auto
set_db check_drc_check_only default
set_db check_drc_inside_via_def true
set_db check_drc_exclude_pg_net false
set_db check_drc_ignore_trial_route false
set_db check_drc_ignore_cell_blockage false
set_db check_drc_use_min_spacing_on_block_obs auto
set_db check_drc_report counter.drc.rpt
set_db check_drc_limit 1000
check_drc
set_db check_drc_area {0 0 0 0}
set_layer_preference violation -is_visible 1
check_connectivity -type all -geometry_connect -error 1000 -warning 50
