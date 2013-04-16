//POVRay-File created by 3d41.ulp v###VERSIONDUMMY###
///Users/jmoreland/Dropbox/eagle/projects/JCM/MultiWiiChassis/FCB/MultiWiiChassis.brd
//10/13/12 4:37 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 172;
#local cam_z = -92;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 15;
#local lgt1_pos_y = 22;
#local lgt1_pos_z = 21;
#local lgt1_intense = 0.722857;
#local lgt2_pos_x = -15;
#local lgt2_pos_y = 22;
#local lgt2_pos_z = 21;
#local lgt2_intense = 0.722857;
#local lgt3_pos_x = 15;
#local lgt3_pos_y = 22;
#local lgt3_pos_z = -14;
#local lgt3_intense = 0.722857;
#local lgt4_pos_x = -15;
#local lgt4_pos_y = 22;
#local lgt4_pos_z = -14;
#local lgt4_intense = 0.722857;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 40.000000;
#declare pcb_y_size = 40.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(255);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-20.000000,0,-20.000000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MULTIWIICHASSIS(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<17.500000,17.500000><17.500000,57.500000>
<17.500000,57.500000><57.500000,57.500000>
<57.500000,57.500000><57.500000,17.500000>
<57.500000,17.500000><17.500000,17.500000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<55.000000,1,55.000000><55.000000,-5,55.000000>1.562500 texture{col_hls}}
cylinder{<20.000000,1,55.000000><20.000000,-5,55.000000>1.562500 texture{col_hls}}
cylinder{<20.000000,1,20.000000><20.000000,-5,20.000000>1.562500 texture{col_hls}}
cylinder{<55.000000,1,20.000000><55.000000,-5,20.000000>1.562500 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack__) #declare global_pack__=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<21.648100,0.000000,30.700600>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) + Buzzer 1X02
#ifndef(pack_ZV) #declare global_pack_ZV=yes; object {CON_PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.077900,0.000000,40.265500>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) 5V M01PTH 1X01
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<47.891700,0,54.343300>}		//unbekanntes Bauteil BSS138-SCL BSS138BOTTOM SOT23_BOT
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<41.122600,0,54.368700>}		//unbekanntes Bauteil BSS138-SDA BSS138BOTTOM SOT23_BOT
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.574000,0.000000,44.742100>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C1 4.7uf 0603-CAP
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.574000,0.000000,42.900600>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C2 4.7uf 0603-CAP
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<24.803100,-1.500000,54.914800>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C3 4.7uf 0603-CAP
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<35.852100,-1.500000,55.333900>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C4 1uf 0603-CAP
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<35.877500,-1.500000,56.642000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C5 .1uf 0603-CAP
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<38.976300,0.000000,29.603700>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C6 1uf 0603-CAP
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<27.301500,0.000000,43.349800>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C7 1uf 0603-CAP
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<25.004300,0.000000,41.239200>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C8 1uf 0603-CAP
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<37.122100,0.000000,29.591000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C9 1uf 0603-CAP
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.150000,0.000000,47.590000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP1 T 1X03
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.670000,0.000000,25.980000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP6 CR 1X03
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.038800,0.000000,24.079200>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP7 RR 1X03
#ifndef(pack_JP8) #declare global_pack_JP8=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<28.512700,0.000000,24.080900>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP8 FL 1X03
#ifndef(pack_JP9) #declare global_pack_JP9=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<36.346700,0.000000,24.042800>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP9 LR 1X03
#ifndef(pack_JP10) #declare global_pack_JP10=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.677800,0.000000,24.080900>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP10 FR 1X03
#ifndef(pack_JP11) #declare global_pack_JP11=yes; object {CON_PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.951100,0.000000,33.575300>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) JP11 Bat + 1X01
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<40.335200,0,44.780200>}		//unbekanntes Bauteil JP12  1X06_LOCK
#ifndef(pack_JP13) #declare global_pack_JP13=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.620000,0.000000,28.800000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP13 CP 1X03
#ifndef(pack_JP14) #declare global_pack_JP14=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.170000,0.000000,50.430000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP14 B 1X03
#ifndef(pack_JP15) #declare global_pack_JP15=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<25.992400,0.000000,24.080900>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP15 R 1X03
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<40.093900,0,48.183800>}		//unbekanntes Bauteil JP16  1X06_LOCK
#ifndef(pack_JP17) #declare global_pack_JP17=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.475900,0.000000,24.157100>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP17 L 1X03
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<43.256200,0,20.320000>}		//unbekanntes Bauteil LED1 Status LED-1206
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<46.278800,0,20.332700>}		//unbekanntes Bauteil LED2 P-CPU LED-1206
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<40.182800,0,20.256500>}		//unbekanntes Bauteil LED3 P-ESC LED-1206
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<35.763200,0,48.501300>}		//unbekanntes Bauteil LED4 P-3V3 LED-1206
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<30.949900,0,50.876200>}		//unbekanntes Bauteil MCP1825S V_REG_MCP1825S SOT223_BOT
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<46.266100,0.000000,24.930100>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R1 470 0603-RES
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.230800,0.000000,24.739600>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R2 470 0603-RES
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0603("333",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.071800,0.000000,42.430700>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R3 33K 0603-RES
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("513",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.691600,0.000000,35.839400>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 51K 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.221400,0.000000,54.203600>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 10k 0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<51.130200,0.000000,54.305200>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R6 10k 0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.418500,0.000000,51.955700>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R7 10k 0805
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<38.214300,0.000000,51.955700>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R8 10k 0805
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.195500,0.000000,24.625300>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R9 470 0805
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<35.674300,0.000000,52.603400>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R10 470 0805
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<36.766500,0.000000,41.389300>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R11 10k 0603-RES
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<28.981400,0,28.346400>}		//unbekanntes Bauteil SJ4 SOLDERJUMPERNO SJ_2S-NO
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<26.000000,0,28.370400>}		//unbekanntes Bauteil SJ5 SOLDERJUMPERNO SJ_2S-NO
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<56.057800,0,32.308800>}		//unbekanntes Bauteil U$11 AVR_MINI_PROGSMD AVR_MINI_PROG
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("ATMEGA168","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-315.000000,0> rotate<0,0,0> translate<31.052000,0.000000,36.032300>translate<0,0.035000,0> }#end		//TQFP-32 U1 ATMEGA168 TQFP32-08
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<22.284800,0,39.350200>}		//unbekanntes Bauteil Y1  RESONATOR-SMD
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack__) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<21.648100,0,30.700600> texture{col_thl}}
#ifndef(global_pack__) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<19.108100,0,30.700600> texture{col_thl}}
#ifndef(global_pack_ZV) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<19.077900,0,40.265500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.791700,-1.537000,54.343300>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.991700,-1.537000,55.323700>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.991700,-1.537000,53.362900>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.022600,-1.537000,54.368700>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.222600,-1.537000,55.349100>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.222600,-1.537000,53.388300>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.424000,0.000000,44.742100>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.724000,0.000000,44.742100>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.424000,0.000000,42.900600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.724000,0.000000,42.900600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.803100,-1.537000,54.064800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.803100,-1.537000,55.764800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.702100,-1.537000,55.333900>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.002100,-1.537000,55.333900>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.727500,-1.537000,56.642000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.027500,-1.537000,56.642000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.976300,0.000000,28.753700>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.976300,0.000000,30.453700>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.301500,0.000000,42.499800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.301500,0.000000,44.199800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.004300,0.000000,40.389200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.004300,0.000000,42.089200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.122100,0.000000,28.741000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.122100,0.000000,30.441000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.150000,0,47.590000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<21.610000,0,47.590000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<19.070000,0,47.590000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<50.670000,0,25.980000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<53.210000,0,25.980000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<55.750000,0,25.980000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<31.038800,0,24.079200> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<31.038800,0,21.539200> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<31.038800,0,18.999200> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<28.512700,0,24.080900> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<28.512700,0,21.540900> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<28.512700,0,19.000900> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<36.346700,0,24.042800> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<36.346700,0,21.502800> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<36.346700,0,18.962800> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.677800,0,24.080900> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.677800,0,21.540900> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.677800,0,19.000900> texture{col_thl}}
#ifndef(global_pack_JP11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<18.951100,0,33.575300> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<40.335200,0,44.780200> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<42.875200,0,44.526200> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<45.415200,0,44.780200> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.955200,0,44.526200> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<50.495200,0,44.780200> texture{col_thl}}
#ifndef(global_pack_JP12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<53.035200,0,44.526200> texture{col_thl}}
#ifndef(global_pack_JP13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<50.620000,0,28.800000> texture{col_thl}}
#ifndef(global_pack_JP13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<53.160000,0,28.800000> texture{col_thl}}
#ifndef(global_pack_JP13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<55.700000,0,28.800000> texture{col_thl}}
#ifndef(global_pack_JP14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.170000,0,50.430000> texture{col_thl}}
#ifndef(global_pack_JP14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<21.630000,0,50.430000> texture{col_thl}}
#ifndef(global_pack_JP14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<19.090000,0,50.430000> texture{col_thl}}
#ifndef(global_pack_JP15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.992400,0,24.080900> texture{col_thl}}
#ifndef(global_pack_JP15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.992400,0,21.540900> texture{col_thl}}
#ifndef(global_pack_JP15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.992400,0,19.000900> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<40.093900,0,48.183800> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<42.633900,0,47.929800> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<45.173900,0,48.183800> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.713900,0,47.929800> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<50.253900,0,48.183800> texture{col_thl}}
#ifndef(global_pack_JP16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<52.793900,0,47.929800> texture{col_thl}}
#ifndef(global_pack_JP17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<23.475900,0,24.157100> texture{col_thl}}
#ifndef(global_pack_JP17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<23.475900,0,21.617100> texture{col_thl}}
#ifndef(global_pack_JP17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<23.475900,0,19.077100> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.256200,0.000000,21.820000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.256200,0.000000,18.820000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.278800,0.000000,21.832700>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.278800,0.000000,18.832700>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<40.182800,0.000000,21.756500>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<40.182800,0.000000,18.756500>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.763200,0.000000,50.001300>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.763200,0.000000,47.001300>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.638500,-1.537000,53.975000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.949900,-1.537000,53.975000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.261300,-1.537000,53.975000>}
object{TOOLS_PCB_SMD(3.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.949900,-1.537000,47.777200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.266100,0.000000,24.080100>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.266100,0.000000,25.780100>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.230800,0.000000,23.889600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.230800,0.000000,25.589600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.221800,0.000000,42.430700>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.921800,0.000000,42.430700>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.791600,0.000000,35.839400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.591600,0.000000,35.839400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.221400,0.000000,53.303600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.221400,0.000000,55.103600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.130200,0.000000,53.405200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.130200,0.000000,55.205200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.418500,0.000000,52.855700>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.418500,0.000000,51.055700>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.214300,0.000000,52.855700>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.214300,0.000000,51.055700>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.195500,0.000000,23.725300>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.195500,0.000000,25.525300>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.674300,0.000000,51.703400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.674300,0.000000,53.503400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.916500,0.000000,41.389300>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.616500,0.000000,41.389300>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.981400,0.000000,28.796400>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.981400,0.000000,27.896400>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.000000,0.000000,28.820400>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.000000,0.000000,27.920400>}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<56.057800,0,32.308800> texture{col_thl}}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<56.057800,0,33.808800> texture{col_thl}}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<56.057800,0,35.308800> texture{col_thl}}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<56.057800,0,36.808800> texture{col_thl}}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<56.057800,0,38.308800> texture{col_thl}}
#ifndef(global_pack_U_11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<56.047800,0,39.808800> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<29.996572,0.000000,41.047525>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<29.430884,0.000000,40.481838>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<28.865200,0.000000,39.916153>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<28.299516,0.000000,39.350469>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<27.733828,0.000000,38.784781>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<27.168144,0.000000,38.219097>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<26.602459,0.000000,37.653413>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<26.036772,0.000000,37.087725>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<26.036772,0.000000,34.976872>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<26.602459,0.000000,34.411184>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<27.168144,0.000000,33.845500>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<27.733828,0.000000,33.279816>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<28.299516,0.000000,32.714128>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<28.865200,0.000000,32.148444>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<29.430884,0.000000,31.582759>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<29.996572,0.000000,31.017072>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<32.107425,0.000000,31.017072>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<32.673113,0.000000,31.582759>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<33.238797,0.000000,32.148444>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<33.804481,0.000000,32.714128>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<34.370169,0.000000,33.279816>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<34.935853,0.000000,33.845500>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<35.501538,0.000000,34.411184>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<36.067225,0.000000,34.976872>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<36.067225,0.000000,37.087725>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<35.501538,0.000000,37.653413>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<34.935853,0.000000,38.219097>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<34.370169,0.000000,38.784781>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<33.804481,0.000000,39.350469>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<33.238797,0.000000,39.916153>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<32.673113,0.000000,40.481838>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<32.107425,0.000000,41.047525>}
object{TOOLS_PCB_SMD(0.700000,1.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.284800,0.000000,40.550200>}
object{TOOLS_PCB_SMD(0.700000,1.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.284800,0.000000,39.350200>}
object{TOOLS_PCB_SMD(0.700000,1.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.284800,0.000000,38.150200>}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.519528,-1.535000,22.042072>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.529416,-1.535000,29.475431>}
box{<0,0,-0.101600><7.433366,0.035000,0.101600> rotate<0,-89.917853,0> translate<19.519528,-1.535000,22.042072> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.519528,-1.535000,22.042072>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.588150,-1.535000,22.070497>}
box{<0,0,-0.101600><0.074276,0.035000,0.101600> rotate<0,-22.499148,0> translate<19.519528,-1.535000,22.042072> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.519669,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.129050,-1.535000,22.148800>}
box{<0,0,-0.101600><2.609381,0.035000,0.101600> rotate<0,0.000000,0> translate<19.519669,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.519938,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.213219,-1.535000,22.352000>}
box{<0,0,-0.101600><2.693281,0.035000,0.101600> rotate<0,0.000000,0> translate<19.519938,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.520209,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.366500,-1.535000,22.555200>}
box{<0,0,-0.101600><2.846291,0.035000,0.101600> rotate<0,0.000000,0> translate<19.520209,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.520478,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.569700,-1.535000,22.758400>}
box{<0,0,-0.101600><3.049222,0.035000,0.101600> rotate<0,0.000000,0> translate<19.520478,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.520750,-1.535000,22.961600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.623897,-1.535000,22.961600>}
box{<0,0,-0.101600><3.103147,0.035000,0.101600> rotate<0,0.000000,0> translate<19.520750,-1.535000,22.961600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.521019,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.420697,-1.535000,23.164800>}
box{<0,0,-0.101600><2.899678,0.035000,0.101600> rotate<0,0.000000,0> translate<19.521019,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.521291,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.235663,-1.535000,23.368000>}
box{<0,0,-0.101600><2.714372,0.035000,0.101600> rotate<0,0.000000,0> translate<19.521291,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.521559,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.151497,-1.535000,23.571200>}
box{<0,0,-0.101600><2.629937,0.035000,0.101600> rotate<0,0.000000,0> translate<19.521559,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.521831,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.067328,-1.535000,23.774400>}
box{<0,0,-0.101600><2.545497,0.035000,0.101600> rotate<0,0.000000,0> translate<19.521831,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.522100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,23.977600>}
box{<0,0,-0.101600><2.506000,0.035000,0.101600> rotate<0,0.000000,0> translate<19.522100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.522372,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,24.180800>}
box{<0,0,-0.101600><2.505728,0.035000,0.101600> rotate<0,0.000000,0> translate<19.522372,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.522641,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,24.384000>}
box{<0,0,-0.101600><2.505459,0.035000,0.101600> rotate<0,0.000000,0> translate<19.522641,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.522913,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.086969,-1.535000,24.587200>}
box{<0,0,-0.101600><2.564056,0.035000,0.101600> rotate<0,0.000000,0> translate<19.522913,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.523181,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.171134,-1.535000,24.790400>}
box{<0,0,-0.101600><2.647953,0.035000,0.101600> rotate<0,0.000000,0> translate<19.523181,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.523453,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.264900,-1.535000,24.993600>}
box{<0,0,-0.101600><2.741447,0.035000,0.101600> rotate<0,0.000000,0> translate<19.523453,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.523722,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.468100,-1.535000,25.196800>}
box{<0,0,-0.101600><2.944378,0.035000,0.101600> rotate<0,0.000000,0> translate<19.523722,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.523994,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.693244,-1.535000,25.400000>}
box{<0,0,-0.101600><3.169250,0.035000,0.101600> rotate<0,0.000000,0> translate<19.523994,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.524263,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.183819,-1.535000,25.603200>}
box{<0,0,-0.101600><3.659556,0.035000,0.101600> rotate<0,0.000000,0> translate<19.524263,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.524534,-1.535000,25.806400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,25.806400>}
box{<0,0,-0.101600><29.697666,0.035000,0.101600> rotate<0,0.000000,0> translate<19.524534,-1.535000,25.806400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.524803,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,26.009600>}
box{<0,0,-0.101600><29.697397,0.035000,0.101600> rotate<0,0.000000,0> translate<19.524803,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.525075,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,26.212800>}
box{<0,0,-0.101600><29.697125,0.035000,0.101600> rotate<0,0.000000,0> translate<19.525075,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.525344,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.283513,-1.535000,26.416000>}
box{<0,0,-0.101600><29.758169,0.035000,0.101600> rotate<0,0.000000,0> translate<19.525344,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.525616,-1.535000,26.619200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.367678,-1.535000,26.619200>}
box{<0,0,-0.101600><29.842063,0.035000,0.101600> rotate<0,0.000000,0> translate<19.525616,-1.535000,26.619200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.525884,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.464900,-1.535000,26.822400>}
box{<0,0,-0.101600><29.939016,0.035000,0.101600> rotate<0,0.000000,0> translate<19.525884,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.526156,-1.535000,27.025600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.668100,-1.535000,27.025600>}
box{<0,0,-0.101600><30.141944,0.035000,0.101600> rotate<0,0.000000,0> translate<19.526156,-1.535000,27.025600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.526425,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.901588,-1.535000,27.228800>}
box{<0,0,-0.101600><30.375163,0.035000,0.101600> rotate<0,0.000000,0> translate<19.526425,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.526697,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.139359,-1.535000,27.432000>}
box{<0,0,-0.101600><30.612663,0.035000,0.101600> rotate<0,0.000000,0> translate<19.526697,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.526966,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.737297,-1.535000,27.635200>}
box{<0,0,-0.101600><30.210331,0.035000,0.101600> rotate<0,0.000000,0> translate<19.526966,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.527238,-1.535000,27.838400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.534097,-1.535000,27.838400>}
box{<0,0,-0.101600><30.006859,0.035000,0.101600> rotate<0,0.000000,0> translate<19.527238,-1.535000,27.838400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.527506,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.367047,-1.535000,28.041600>}
box{<0,0,-0.101600><29.839541,0.035000,0.101600> rotate<0,0.000000,0> translate<19.527506,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.527778,-1.535000,28.244800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.282881,-1.535000,28.244800>}
box{<0,0,-0.101600><29.755103,0.035000,0.101600> rotate<0,0.000000,0> translate<19.527778,-1.535000,28.244800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.528047,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.198712,-1.535000,28.448000>}
box{<0,0,-0.101600><29.670666,0.035000,0.101600> rotate<0,0.000000,0> translate<19.528047,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.528319,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,28.651200>}
box{<0,0,-0.101600><29.643881,0.035000,0.101600> rotate<0,0.000000,0> translate<19.528319,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.528588,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,28.854400>}
box{<0,0,-0.101600><29.643613,0.035000,0.101600> rotate<0,0.000000,0> translate<19.528588,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.528859,-1.535000,29.057600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,29.057600>}
box{<0,0,-0.101600><29.643341,0.035000,0.101600> rotate<0,0.000000,0> translate<19.528859,-1.535000,29.057600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.529128,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.340797,-1.535000,29.260800>}
box{<0,0,-0.101600><1.811669,0.035000,0.101600> rotate<0,0.000000,0> translate<19.529128,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.529400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.850225,-1.535000,29.464000>}
box{<0,0,-0.101600><1.320825,0.035000,0.101600> rotate<0,0.000000,0> translate<19.529400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.529416,-1.535000,29.475431>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.605359,-1.535000,29.500106>}
box{<0,0,-0.101600><0.079852,0.035000,0.101600> rotate<0,-17.998389,0> translate<19.529416,-1.535000,29.475431> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.532675,-1.535000,31.924706>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.533159,-1.535000,32.289472>}
box{<0,0,-0.101600><0.364766,0.035000,0.101600> rotate<0,-89.917982,0> translate<19.532675,-1.535000,31.924706> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.532675,-1.535000,31.924706>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.605359,-1.535000,31.901091>}
box{<0,0,-0.101600><0.076425,0.035000,0.101600> rotate<0,17.998128,0> translate<19.532675,-1.535000,31.924706> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.532913,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.256794,-1.535000,32.105600>}
box{<0,0,-0.101600><1.723881,0.035000,0.101600> rotate<0,0.000000,0> translate<19.532913,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.533159,-1.535000,32.289472>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.028206>}
box{<0,0,-0.101600><1.044730,0.035000,0.101600> rotate<0,-44.996909,0> translate<19.533159,-1.535000,32.289472> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.536575,-1.535000,34.857709>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541941,-1.535000,38.890625>}
box{<0,0,-0.101600><4.032919,0.035000,0.101600> rotate<0,-89.917836,0> translate<19.536575,-1.535000,34.857709> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.536575,-1.535000,34.857709>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,34.122391>}
box{<0,0,-0.101600><1.039900,0.035000,0.101600> rotate<0,44.996908,0> translate<19.536575,-1.535000,34.857709> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.536697,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.893525,-1.535000,34.950400>}
box{<0,0,-0.101600><35.356828,0.035000,0.101600> rotate<0,0.000000,0> translate<19.536697,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.536966,-1.535000,35.153600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.153600>}
box{<0,0,-0.101600><35.308034,0.035000,0.101600> rotate<0,0.000000,0> translate<19.536966,-1.535000,35.153600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.537237,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.356800>}
box{<0,0,-0.101600><35.307763,0.035000,0.101600> rotate<0,0.000000,0> translate<19.537237,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.537506,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.849128,-1.535000,35.560000>}
box{<0,0,-0.101600><35.311622,0.035000,0.101600> rotate<0,0.000000,0> translate<19.537506,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.537778,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.933294,-1.535000,35.763200>}
box{<0,0,-0.101600><35.395516,0.035000,0.101600> rotate<0,0.000000,0> translate<19.537778,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.538050,-1.535000,35.966400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.017463,-1.535000,35.966400>}
box{<0,0,-0.101600><35.479412,0.035000,0.101600> rotate<0,0.000000,0> translate<19.538050,-1.535000,35.966400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.538319,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.009838,-1.535000,36.169600>}
box{<0,0,-0.101600><35.471519,0.035000,0.101600> rotate<0,0.000000,0> translate<19.538319,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.538591,-1.535000,36.372800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.925669,-1.535000,36.372800>}
box{<0,0,-0.101600><35.387078,0.035000,0.101600> rotate<0,0.000000,0> translate<19.538591,-1.535000,36.372800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.538859,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,36.576000>}
box{<0,0,-0.101600><35.306141,0.035000,0.101600> rotate<0,0.000000,0> translate<19.538859,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.539131,-1.535000,36.779200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,36.779200>}
box{<0,0,-0.101600><35.305869,0.035000,0.101600> rotate<0,0.000000,0> translate<19.539131,-1.535000,36.779200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.539400,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,36.982400>}
box{<0,0,-0.101600><35.305600,0.035000,0.101600> rotate<0,0.000000,0> translate<19.539400,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.539672,-1.535000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.901153,-1.535000,37.185600>}
box{<0,0,-0.101600><35.361481,0.035000,0.101600> rotate<0,0.000000,0> translate<19.539672,-1.535000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.539941,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.985322,-1.535000,37.388800>}
box{<0,0,-0.101600><35.445381,0.035000,0.101600> rotate<0,0.000000,0> translate<19.539941,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.540213,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.059441,-1.535000,37.592000>}
box{<0,0,-0.101600><35.519228,0.035000,0.101600> rotate<0,0.000000,0> translate<19.540213,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.540481,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.957813,-1.535000,37.795200>}
box{<0,0,-0.101600><35.417331,0.035000,0.101600> rotate<0,0.000000,0> translate<19.540481,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.540753,-1.535000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.873644,-1.535000,37.998400>}
box{<0,0,-0.101600><35.332891,0.035000,0.101600> rotate<0,0.000000,0> translate<19.540753,-1.535000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541022,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.201600>}
box{<0,0,-0.101600><35.303978,0.035000,0.101600> rotate<0,0.000000,0> translate<19.541022,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541294,-1.535000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.404800>}
box{<0,0,-0.101600><35.303706,0.035000,0.101600> rotate<0,0.000000,0> translate<19.541294,-1.535000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541563,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.869009,-1.535000,38.608000>}
box{<0,0,-0.101600><35.327447,0.035000,0.101600> rotate<0,0.000000,0> translate<19.541563,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541834,-1.535000,38.811200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.953178,-1.535000,38.811200>}
box{<0,0,-0.101600><35.411344,0.035000,0.101600> rotate<0,0.000000,0> translate<19.541834,-1.535000,38.811200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.541941,-1.535000,38.890625>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.898013,-1.535000,39.038113>}
box{<0,0,-0.101600><0.385409,0.035000,0.101600> rotate<0,-22.498199,0> translate<19.541941,-1.535000,38.890625> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.545597,-1.535000,41.638856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551909,-1.535000,46.384519>}
box{<0,0,-0.101600><4.745667,0.035000,0.101600> rotate<0,-89.917853,0> translate<19.545597,-1.535000,41.638856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.545597,-1.535000,41.638856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.898013,-1.535000,41.492884>}
box{<0,0,-0.101600><0.381451,0.035000,0.101600> rotate<0,22.498035,0> translate<19.545597,-1.535000,41.638856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.545619,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.383784,-1.535000,41.656000>}
box{<0,0,-0.101600><35.838166,0.035000,0.101600> rotate<0,0.000000,0> translate<19.545619,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.545887,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.384844,-1.535000,41.859200>}
box{<0,0,-0.101600><35.838956,0.035000,0.101600> rotate<0,0.000000,0> translate<19.545887,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.546159,-1.535000,42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.385903,-1.535000,42.062400>}
box{<0,0,-0.101600><35.839744,0.035000,0.101600> rotate<0,0.000000,0> translate<19.546159,-1.535000,42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.546428,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.386959,-1.535000,42.265600>}
box{<0,0,-0.101600><35.840531,0.035000,0.101600> rotate<0,0.000000,0> translate<19.546428,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.546700,-1.535000,42.468800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.388019,-1.535000,42.468800>}
box{<0,0,-0.101600><35.841319,0.035000,0.101600> rotate<0,0.000000,0> translate<19.546700,-1.535000,42.468800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.546969,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.389078,-1.535000,42.672000>}
box{<0,0,-0.101600><35.842109,0.035000,0.101600> rotate<0,0.000000,0> translate<19.546969,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.547241,-1.535000,42.875200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.390138,-1.535000,42.875200>}
box{<0,0,-0.101600><35.842897,0.035000,0.101600> rotate<0,0.000000,0> translate<19.547241,-1.535000,42.875200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.547509,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.667213,-1.535000,43.078400>}
box{<0,0,-0.101600><28.119703,0.035000,0.101600> rotate<0,0.000000,0> translate<19.547509,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.547781,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.513678,-1.535000,43.281600>}
box{<0,0,-0.101600><22.965897,0.035000,0.101600> rotate<0,0.000000,0> translate<19.547781,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.548050,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.679281,-1.535000,43.484800>}
box{<0,0,-0.101600><20.131231,0.035000,0.101600> rotate<0,0.000000,0> translate<19.548050,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.548322,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.379897,-1.535000,43.688000>}
box{<0,0,-0.101600><19.831575,0.035000,0.101600> rotate<0,0.000000,0> translate<19.548322,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.548591,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.176697,-1.535000,43.891200>}
box{<0,0,-0.101600><19.628106,0.035000,0.101600> rotate<0,0.000000,0> translate<19.548591,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.548863,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.052175,-1.535000,44.094400>}
box{<0,0,-0.101600><19.503313,0.035000,0.101600> rotate<0,0.000000,0> translate<19.548863,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.549131,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.968009,-1.535000,44.297600>}
box{<0,0,-0.101600><19.418878,0.035000,0.101600> rotate<0,0.000000,0> translate<19.549131,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.549403,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,44.500800>}
box{<0,0,-0.101600><19.337997,0.035000,0.101600> rotate<0,0.000000,0> translate<19.549403,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.549672,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,44.704000>}
box{<0,0,-0.101600><19.337728,0.035000,0.101600> rotate<0,0.000000,0> translate<19.549672,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.549944,-1.535000,44.907200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,44.907200>}
box{<0,0,-0.101600><19.337456,0.035000,0.101600> rotate<0,0.000000,0> translate<19.549944,-1.535000,44.907200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.550213,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.904888,-1.535000,45.110400>}
box{<0,0,-0.101600><19.354675,0.035000,0.101600> rotate<0,0.000000,0> translate<19.550213,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.550484,-1.535000,45.313600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.989056,-1.535000,45.313600>}
box{<0,0,-0.101600><19.438572,0.035000,0.101600> rotate<0,0.000000,0> translate<19.550484,-1.535000,45.313600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.550753,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.073222,-1.535000,45.516800>}
box{<0,0,-0.101600><19.522469,0.035000,0.101600> rotate<0,0.000000,0> translate<19.550753,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551025,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.227500,-1.535000,45.720000>}
box{<0,0,-0.101600><19.676475,0.035000,0.101600> rotate<0,0.000000,0> translate<19.551025,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551294,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.430700,-1.535000,45.923200>}
box{<0,0,-0.101600><19.879406,0.035000,0.101600> rotate<0,0.000000,0> translate<19.551294,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551566,-1.535000,46.126400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.801934,-1.535000,46.126400>}
box{<0,0,-0.101600><20.250369,0.035000,0.101600> rotate<0,0.000000,0> translate<19.551566,-1.535000,46.126400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551834,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.869584,-1.535000,46.329600>}
box{<0,0,-0.101600><1.317750,0.035000,0.101600> rotate<0,0.000000,0> translate<19.551834,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.551909,-1.535000,46.384519>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.567259,-1.535000,46.389506>}
box{<0,0,-0.101600><0.016140,0.035000,0.101600> rotate<0,-17.998754,0> translate<19.551909,-1.535000,46.384519> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.552488,-1.535000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,32.308800>}
box{<0,0,-0.101600><35.292513,0.035000,0.101600> rotate<0,0.000000,0> translate<19.552488,-1.535000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.558900,-1.535000,51.639703>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.560631,-1.535000,52.940900>}
box{<0,0,-0.101600><1.301198,0.035000,0.101600> rotate<0,-89.917833,0> translate<19.558900,-1.535000,51.639703> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.558900,-1.535000,51.639703>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.587259,-1.535000,51.630491>}
box{<0,0,-0.101600><0.029818,0.035000,0.101600> rotate<0,17.995122,0> translate<19.558900,-1.535000,51.639703> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.559134,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.192822,-1.535000,51.816000>}
box{<0,0,-0.101600><1.633688,0.035000,0.101600> rotate<0,0.000000,0> translate<19.559134,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.559403,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.437778,-1.535000,52.019200>}
box{<0,0,-0.101600><35.878375,0.035000,0.101600> rotate<0,0.000000,0> translate<19.559403,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.559675,-1.535000,52.222400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.438834,-1.535000,52.222400>}
box{<0,0,-0.101600><35.879159,0.035000,0.101600> rotate<0,0.000000,0> translate<19.559675,-1.535000,52.222400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.559944,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.742278,-1.535000,52.425600>}
box{<0,0,-0.101600><8.182334,0.035000,0.101600> rotate<0,0.000000,0> translate<19.559944,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.560216,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.539078,-1.535000,52.628800>}
box{<0,0,-0.101600><7.978862,0.035000,0.101600> rotate<0,0.000000,0> translate<19.560216,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.560484,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,52.832000>}
box{<0,0,-0.101600><7.960416,0.035000,0.101600> rotate<0,0.000000,0> translate<19.560484,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.560631,-1.535000,52.940900>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.588150,-1.535000,52.929500>}
box{<0,0,-0.101600><0.029787,0.035000,0.101600> rotate<0,22.500933,0> translate<19.560631,-1.535000,52.940900> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.567259,-1.535000,46.389506>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.748938,-1.535000,46.482075>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<19.567259,-1.535000,46.389506> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.587259,-1.535000,51.630491>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.768937,-1.535000,51.537922>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<19.587259,-1.535000,51.630491> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.588150,-1.535000,22.070497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.411847,-1.535000,22.070497>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,0.000000,0> translate<19.588150,-1.535000,22.070497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.588150,-1.535000,52.929500>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.411847,-1.535000,52.929500>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,0.000000,0> translate<19.588150,-1.535000,52.929500> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.601331,-1.535000,31.902400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.802400,-1.535000,31.902400>}
box{<0,0,-0.101600><1.201069,0.035000,0.101600> rotate<0,0.000000,0> translate<19.601331,-1.535000,31.902400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.605359,-1.535000,29.500106>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.787038,-1.535000,29.592675>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<19.605359,-1.535000,29.500106> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.605359,-1.535000,31.901091>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.787038,-1.535000,31.808522>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<19.605359,-1.535000,31.901091> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.621981,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.765300,-1.535000,51.612800>}
box{<0,0,-0.101600><1.143319,0.035000,0.101600> rotate<0,0.000000,0> translate<19.621981,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.647088,-1.535000,34.747200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.977694,-1.535000,34.747200>}
box{<0,0,-0.101600><35.330606,0.035000,0.101600> rotate<0,0.000000,0> translate<19.647088,-1.535000,34.747200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.748938,-1.535000,46.482075>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.913894,-1.535000,46.601925>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<19.748938,-1.535000,46.482075> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.755688,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,32.512000>}
box{<0,0,-0.101600><35.089313,0.035000,0.101600> rotate<0,0.000000,0> translate<19.755688,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.768937,-1.535000,51.537922>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.933894,-1.535000,51.418072>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<19.768937,-1.535000,51.537922> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.787038,-1.535000,29.592675>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.951994,-1.535000,29.712525>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<19.787038,-1.535000,29.592675> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.787038,-1.535000,31.808522>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.951994,-1.535000,31.688672>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<19.787038,-1.535000,31.808522> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.818753,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.619697,-1.535000,46.532800>}
box{<0,0,-0.101600><0.800944,0.035000,0.101600> rotate<0,0.000000,0> translate<19.818753,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.840763,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.048247,-1.535000,39.014400>}
box{<0,0,-0.101600><35.207484,0.035000,0.101600> rotate<0,0.000000,0> translate<19.840763,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.850288,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.077847,-1.535000,34.544000>}
box{<0,0,-0.101600><35.227559,0.035000,0.101600> rotate<0,0.000000,0> translate<19.850288,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.889609,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.633997,-1.535000,29.667200>}
box{<0,0,-0.101600><0.744387,0.035000,0.101600> rotate<0,0.000000,0> translate<19.889609,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.898013,-1.535000,39.038113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.305284,-1.535000,39.445384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.898013,-1.535000,39.038113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.898013,-1.535000,41.492884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.305284,-1.535000,41.085613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<19.898013,-1.535000,41.492884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.913894,-1.535000,46.601925>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.058072,-1.535000,46.746103>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.913894,-1.535000,46.601925> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.933894,-1.535000,51.418072>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.078072,-1.535000,51.273894>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<19.933894,-1.535000,51.418072> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.937506,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.599200,-1.535000,31.699200>}
box{<0,0,-0.101600><0.661694,0.035000,0.101600> rotate<0,0.000000,0> translate<19.937506,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.938097,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.382725,-1.535000,41.452800>}
box{<0,0,-0.101600><35.444628,0.035000,0.101600> rotate<0,0.000000,0> translate<19.938097,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.942366,-1.535000,51.409600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.562100,-1.535000,51.409600>}
box{<0,0,-0.101600><0.619734,0.035000,0.101600> rotate<0,0.000000,0> translate<19.942366,-1.535000,51.409600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.951994,-1.535000,29.712525>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.096172,-1.535000,29.856703>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.951994,-1.535000,29.712525> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.951994,-1.535000,31.688672>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.096172,-1.535000,31.544494>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<19.951994,-1.535000,31.688672> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.958887,-1.535000,32.715200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,32.715200>}
box{<0,0,-0.101600><34.886113,0.035000,0.101600> rotate<0,0.000000,0> translate<19.958887,-1.535000,32.715200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.047969,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.416497,-1.535000,46.736000>}
box{<0,0,-0.101600><0.368528,0.035000,0.101600> rotate<0,0.000000,0> translate<20.047969,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.053487,-1.535000,34.340800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.965438,-1.535000,34.340800>}
box{<0,0,-0.101600><34.911950,0.035000,0.101600> rotate<0,0.000000,0> translate<20.053487,-1.535000,34.340800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.058072,-1.535000,46.746103>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.177922,-1.535000,46.911059>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<20.058072,-1.535000,46.746103> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.077500,-1.535000,39.217600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.979956,-1.535000,39.217600>}
box{<0,0,-0.101600><34.902456,0.035000,0.101600> rotate<0,0.000000,0> translate<20.077500,-1.535000,39.217600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.078072,-1.535000,51.273894>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.197922,-1.535000,51.108938>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<20.078072,-1.535000,51.273894> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.096172,-1.535000,29.856703>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.216022,-1.535000,30.021659>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<20.096172,-1.535000,29.856703> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.096172,-1.535000,31.544494>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.216022,-1.535000,31.379538>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<20.096172,-1.535000,31.544494> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.106122,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.430797,-1.535000,29.870400>}
box{<0,0,-0.101600><0.324675,0.035000,0.101600> rotate<0,0.000000,0> translate<20.106122,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.127113,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.384509,-1.535000,51.206400>}
box{<0,0,-0.101600><0.257397,0.035000,0.101600> rotate<0,0.000000,0> translate<20.127113,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.131406,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.410478,-1.535000,31.496000>}
box{<0,0,-0.101600><0.279072,0.035000,0.101600> rotate<0,0.000000,0> translate<20.131406,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141297,-1.535000,41.249600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.381669,-1.535000,41.249600>}
box{<0,0,-0.101600><35.240372,0.035000,0.101600> rotate<0,0.000000,0> translate<20.141297,-1.535000,41.249600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.162088,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,32.918400>}
box{<0,0,-0.101600><34.682913,0.035000,0.101600> rotate<0,0.000000,0> translate<20.162088,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.177922,-1.535000,46.911059>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.258572,-1.535000,47.069350>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,-62.996734,0> translate<20.177922,-1.535000,46.911059> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.192259,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.312478,-1.535000,46.939200>}
box{<0,0,-0.101600><0.120219,0.035000,0.101600> rotate<0,0.000000,0> translate<20.192259,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.197922,-1.535000,51.108938>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.278572,-1.535000,50.950647>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,62.996734,0> translate<20.197922,-1.535000,51.108938> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.216022,-1.535000,30.021659>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.296672,-1.535000,30.179950>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,-62.996734,0> translate<20.216022,-1.535000,30.021659> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.216022,-1.535000,31.379538>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.296672,-1.535000,31.221247>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,62.996734,0> translate<20.216022,-1.535000,31.379538> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.242484,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.340722,-1.535000,30.073600>}
box{<0,0,-0.101600><0.098237,0.035000,0.101600> rotate<0,0.000000,0> translate<20.242484,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.251797,-1.535000,51.003200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.300341,-1.535000,51.003200>}
box{<0,0,-0.101600><0.048544,0.035000,0.101600> rotate<0,0.000000,0> translate<20.251797,-1.535000,51.003200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.256688,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.881269,-1.535000,34.137600>}
box{<0,0,-0.101600><34.624581,0.035000,0.101600> rotate<0,0.000000,0> translate<20.256688,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.258572,-1.535000,47.069350>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.382613,-1.535000,46.769884>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,67.495888,0> translate<20.258572,-1.535000,47.069350> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.260216,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.326313,-1.535000,31.292800>}
box{<0,0,-0.101600><0.066097,0.035000,0.101600> rotate<0,0.000000,0> translate<20.260216,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.028206>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,34.122391>}
box{<0,0,-0.101600><1.094184,0.035000,0.101600> rotate<0,90.000000,0> translate<20.271897,-1.535000,34.122391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.121600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.121600>}
box{<0,0,-0.101600><34.573103,0.035000,0.101600> rotate<0,0.000000,0> translate<20.271897,-1.535000,33.121600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.945553,-1.535000,33.324800>}
box{<0,0,-0.101600><34.673656,0.035000,0.101600> rotate<0,0.000000,0> translate<20.271897,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.861384,-1.535000,33.528000>}
box{<0,0,-0.101600><34.589488,0.035000,0.101600> rotate<0,0.000000,0> translate<20.271897,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.731200>}
box{<0,0,-0.101600><34.573103,0.035000,0.101600> rotate<0,0.000000,0> translate<20.271897,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.271897,-1.535000,33.934400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.934400>}
box{<0,0,-0.101600><34.573103,0.035000,0.101600> rotate<0,0.000000,0> translate<20.271897,-1.535000,33.934400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.278572,-1.535000,50.950647>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.402613,-1.535000,51.250113>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,-67.495888,0> translate<20.278572,-1.535000,50.950647> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.280700,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.895788,-1.535000,39.420800>}
box{<0,0,-0.101600><34.615088,0.035000,0.101600> rotate<0,0.000000,0> translate<20.280700,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.296672,-1.535000,30.179950>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.420713,-1.535000,29.880484>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,67.495888,0> translate<20.296672,-1.535000,30.179950> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.296672,-1.535000,31.221247>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.420713,-1.535000,31.520713>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,-67.495888,0> translate<20.296672,-1.535000,31.221247> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.305284,-1.535000,39.445384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,39.977513>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<20.305284,-1.535000,39.445384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.305284,-1.535000,41.085613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,40.553484>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<20.305284,-1.535000,41.085613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.321528,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.380609,-1.535000,41.046400>}
box{<0,0,-0.101600><35.059081,0.035000,0.101600> rotate<0,0.000000,0> translate<20.321528,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.379266,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,39.624000>}
box{<0,0,-0.101600><34.455734,0.035000,0.101600> rotate<0,0.000000,0> translate<20.379266,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.382613,-1.535000,46.769884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.789884,-1.535000,46.362613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<20.382613,-1.535000,46.769884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.402613,-1.535000,51.250113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.809884,-1.535000,51.657384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<20.402613,-1.535000,51.250113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.405697,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.375875,-1.535000,40.843200>}
box{<0,0,-0.101600><34.970178,0.035000,0.101600> rotate<0,0.000000,0> translate<20.405697,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.411847,-1.535000,22.070497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,21.755281>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,22.498541,0> translate<20.411847,-1.535000,22.070497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.411847,-1.535000,52.929500>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,53.244716>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-22.498541,0> translate<20.411847,-1.535000,52.929500> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.420713,-1.535000,29.880484>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.827984,-1.535000,29.473213>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<20.420713,-1.535000,29.880484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.420713,-1.535000,31.520713>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.827984,-1.535000,31.927984>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<20.420713,-1.535000,31.520713> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.463434,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,39.827200>}
box{<0,0,-0.101600><34.371566,0.035000,0.101600> rotate<0,0.000000,0> translate<20.463434,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.489863,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.163844,-1.535000,40.640000>}
box{<0,0,-0.101600><34.673981,0.035000,0.101600> rotate<0,0.000000,0> translate<20.489863,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,39.977513>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,40.553484>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<20.525697,-1.535000,40.553484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,40.030400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,40.030400>}
box{<0,0,-0.101600><34.309303,0.035000,0.101600> rotate<0,0.000000,0> translate<20.525697,-1.535000,40.030400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.911034,-1.535000,40.233600>}
box{<0,0,-0.101600><34.385337,0.035000,0.101600> rotate<0,0.000000,0> translate<20.525697,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.525697,-1.535000,40.436800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.995203,-1.535000,40.436800>}
box{<0,0,-0.101600><34.469506,0.035000,0.101600> rotate<0,0.000000,0> translate<20.525697,-1.535000,40.436800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.601656,-1.535000,56.991875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,56.755281>}
box{<0,0,-0.101600><0.618249,0.035000,0.101600> rotate<0,22.498527,0> translate<20.601656,-1.535000,56.991875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.601656,-1.535000,56.991875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.991875>}
box{<0,0,-0.101600><13.520244,0.035000,0.101600> rotate<0,0.000000,0> translate<20.601656,-1.535000,56.991875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.667028,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.064278,-1.535000,53.035200>}
box{<0,0,-0.101600><3.397250,0.035000,0.101600> rotate<0,0.000000,0> translate<20.667028,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.713375,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.044884,-1.535000,21.945600>}
box{<0,0,-0.101600><1.331509,0.035000,0.101600> rotate<0,0.000000,0> translate<20.713375,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.789884,-1.535000,46.362613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.322012,-1.535000,46.142200>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<20.789884,-1.535000,46.362613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.809884,-1.535000,51.657384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.342013,-1.535000,51.877797>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<20.809884,-1.535000,51.657384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.827984,-1.535000,29.473213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.360112,-1.535000,29.252800>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<20.827984,-1.535000,29.473213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.827984,-1.535000,31.927984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.360112,-1.535000,32.148397>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<20.827984,-1.535000,31.927984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.833122,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.896000>}
box{<0,0,-0.101600><13.288778,0.035000,0.101600> rotate<0,0.000000,0> translate<20.833122,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.157594,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.861078,-1.535000,53.238400>}
box{<0,0,-0.101600><2.703484,0.035000,0.101600> rotate<0,0.000000,0> translate<21.157594,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,21.755281>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,21.172844>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,44.997030,0> translate<21.172844,-1.535000,21.755281> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,53.244716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,53.827153>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,-44.997030,0> translate<21.172844,-1.535000,53.244716> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.172844,-1.535000,56.755281>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,56.172844>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,44.997030,0> translate<21.172844,-1.535000,56.755281> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.185725,-1.535000,21.742400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.742400>}
box{<0,0,-0.101600><0.842375,0.035000,0.101600> rotate<0,0.000000,0> translate<21.185725,-1.535000,21.742400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.235325,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925888,-1.535000,56.692800>}
box{<0,0,-0.101600><13.690563,0.035000,0.101600> rotate<0,0.000000,0> translate<21.235325,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.322012,-1.535000,46.142200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.897984,-1.535000,46.142200>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<21.322012,-1.535000,46.142200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.342013,-1.535000,51.877797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.917984,-1.535000,51.877797>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<21.342013,-1.535000,51.877797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.360112,-1.535000,29.252800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.936084,-1.535000,29.252800>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<21.360112,-1.535000,29.252800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.360112,-1.535000,32.148397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.936084,-1.535000,32.148397>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<21.360112,-1.535000,32.148397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.369728,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,53.441600>}
box{<0,0,-0.101600><2.425372,0.035000,0.101600> rotate<0,0.000000,0> translate<21.369728,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.388925,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.539200>}
box{<0,0,-0.101600><0.639175,0.035000,0.101600> rotate<0,0.000000,0> translate<21.388925,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.438525,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.993413,-1.535000,56.489600>}
box{<0,0,-0.101600><2.554887,0.035000,0.101600> rotate<0,0.000000,0> translate<21.438525,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.572928,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,53.644800>}
box{<0,0,-0.101600><2.222172,0.035000,0.101600> rotate<0,0.000000,0> translate<21.572928,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.592125,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.336000>}
box{<0,0,-0.101600><0.435975,0.035000,0.101600> rotate<0,0.000000,0> translate<21.592125,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.641725,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,56.286400>}
box{<0,0,-0.101600><2.305775,0.035000,0.101600> rotate<0,0.000000,0> translate<21.641725,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,21.172844>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.411847>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,67.495520,0> translate<21.755281,-1.535000,21.172844> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,53.827153>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,54.588150>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-67.495520,0> translate<21.755281,-1.535000,53.827153> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.755281,-1.535000,56.172844>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,55.411847>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,67.495520,0> translate<21.755281,-1.535000,56.172844> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.763916,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,53.848000>}
box{<0,0,-0.101600><2.031184,0.035000,0.101600> rotate<0,0.000000,0> translate<21.763916,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.771869,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.109413,-1.535000,21.132800>}
box{<0,0,-0.101600><0.337544,0.035000,0.101600> rotate<0,0.000000,0> translate<21.771869,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.792416,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,56.083200>}
box{<0,0,-0.101600><2.155084,0.035000,0.101600> rotate<0,0.000000,0> translate<21.792416,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.848084,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.051200>}
box{<0,0,-0.101600><1.947016,0.035000,0.101600> rotate<0,0.000000,0> translate<21.848084,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.856037,-1.535000,20.929600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.193581,-1.535000,20.929600>}
box{<0,0,-0.101600><0.337544,0.035000,0.101600> rotate<0,0.000000,0> translate<21.856037,-1.535000,20.929600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.876584,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.880000>}
box{<0,0,-0.101600><2.070916,0.035000,0.101600> rotate<0,0.000000,0> translate<21.876584,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.897984,-1.535000,46.142200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.430112,-1.535000,46.362613>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<21.897984,-1.535000,46.142200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.917984,-1.535000,51.877797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.450112,-1.535000,51.657384>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<21.917984,-1.535000,51.877797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.932250,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.254400>}
box{<0,0,-0.101600><1.862850,0.035000,0.101600> rotate<0,0.000000,0> translate<21.932250,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.936084,-1.535000,29.252800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.468212,-1.535000,29.473213>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<21.936084,-1.535000,29.252800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.936084,-1.535000,32.148397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.468212,-1.535000,31.927984>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<21.936084,-1.535000,32.148397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.940206,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.319097,-1.535000,20.726400>}
box{<0,0,-0.101600><0.378891,0.035000,0.101600> rotate<0,0.000000,0> translate<21.940206,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.955397,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.243784,-1.535000,29.260800>}
box{<0,0,-0.101600><27.288388,0.035000,0.101600> rotate<0,0.000000,0> translate<21.955397,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<21.960750,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701488,-1.535000,55.676800>}
box{<0,0,-0.101600><2.740738,0.035000,0.101600> rotate<0,0.000000,0> translate<21.960750,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.016419,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.457600>}
box{<0,0,-0.101600><1.778681,0.035000,0.101600> rotate<0,0.000000,0> translate<22.016419,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.024375,-1.535000,20.523200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.522297,-1.535000,20.523200>}
box{<0,0,-0.101600><0.497922,0.035000,0.101600> rotate<0,0.000000,0> translate<22.024375,-1.535000,20.523200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.329113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,20.796984>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<22.028100,-1.535000,21.329113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.905084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.329113>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<22.028100,-1.535000,21.329113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,21.905084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,22.437213>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<22.028100,-1.535000,21.905084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,23.869112>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,23.336984>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<22.028100,-1.535000,23.869112> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,24.445084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,23.869112>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<22.028100,-1.535000,23.869112> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.028100,-1.535000,24.445084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,24.977213>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<22.028100,-1.535000,24.445084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.039406,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,32.105600>}
box{<0,0,-0.101600><32.805594,0.035000,0.101600> rotate<0,0.000000,0> translate<22.039406,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.044919,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.473600>}
box{<0,0,-0.101600><1.902581,0.035000,0.101600> rotate<0,0.000000,0> translate<22.044919,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.067178,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.732822,-1.535000,51.816000>}
box{<0,0,-0.101600><1.665644,0.035000,0.101600> rotate<0,0.000000,0> translate<22.067178,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.075716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.411847>}
box{<0,0,-0.101600><0.336131,0.035000,0.101600> rotate<0,90.000000,0> translate<22.070497,-1.535000,20.411847> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.075716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.628500,-1.535000,20.061666>}
box{<0,0,-0.101600><0.558180,0.035000,0.101600> rotate<0,1.442255,0> translate<22.070497,-1.535000,20.075716> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.703063,-1.535000,20.116800>}
box{<0,0,-0.101600><0.632566,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.824088,-1.535000,20.320000>}
box{<0,0,-0.101600><0.753591,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,54.588150>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,55.411847>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,90.000000,0> translate<22.070497,-1.535000,55.411847> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.660800>}
box{<0,0,-0.101600><1.724603,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.833884,-1.535000,54.864000>}
box{<0,0,-0.101600><1.763388,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.977703,-1.535000,55.067200>}
box{<0,0,-0.101600><1.907206,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.070497,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.270400>}
box{<0,0,-0.101600><1.877003,0.035000,0.101600> rotate<0,0.000000,0> translate<22.070497,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,20.796984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,20.389713>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<22.248513,-1.535000,20.796984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,22.437213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,22.844484>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.248513,-1.535000,22.437213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,23.336984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,22.929713>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<22.248513,-1.535000,23.336984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.248513,-1.535000,24.977213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,25.384484>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.248513,-1.535000,24.977213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.350409,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.409584,-1.535000,46.329600>}
box{<0,0,-0.101600><1.059175,0.035000,0.101600> rotate<0,0.000000,0> translate<22.350409,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.430112,-1.535000,46.362613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.837384,-1.535000,46.769884>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.430112,-1.535000,46.362613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.445969,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.327950,-1.535000,29.464000>}
box{<0,0,-0.101600><26.881981,0.035000,0.101600> rotate<0,0.000000,0> translate<22.445969,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.450112,-1.535000,51.657384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.857384,-1.535000,51.250113>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<22.450112,-1.535000,51.657384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.468212,-1.535000,29.473213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.875484,-1.535000,29.880484>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.468212,-1.535000,29.473213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.468212,-1.535000,31.927984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.875484,-1.535000,31.520713>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<22.468212,-1.535000,31.927984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.493797,-1.535000,31.902400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,31.902400>}
box{<0,0,-0.101600><32.351203,0.035000,0.101600> rotate<0,0.000000,0> translate<22.493797,-1.535000,31.902400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.494697,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.305300,-1.535000,51.612800>}
box{<0,0,-0.101600><0.810603,0.035000,0.101600> rotate<0,0.000000,0> translate<22.494697,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.600300,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.159697,-1.535000,46.532800>}
box{<0,0,-0.101600><0.559397,0.035000,0.101600> rotate<0,0.000000,0> translate<22.600300,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.628500,-1.535000,20.061666>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.632003,-1.535000,20.065172>}
box{<0,0,-0.101600><0.004956,0.035000,0.101600> rotate<0,-45.022573,0> translate<22.628500,-1.535000,20.061666> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.632003,-1.535000,20.065172>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.796959,-1.535000,20.185022>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<22.632003,-1.535000,20.065172> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,20.389713>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.955250,-1.535000,20.265672>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,22.498172,0> translate<22.655784,-1.535000,20.389713> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,22.844484>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.758669,-1.535000,22.887100>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,-22.498288,0> translate<22.655784,-1.535000,22.844484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,22.929713>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.758669,-1.535000,22.887100>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,22.496802,0> translate<22.655784,-1.535000,22.929713> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.655784,-1.535000,25.384484>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.187912,-1.535000,25.604897>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<22.655784,-1.535000,25.384484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.662200,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.439700,-1.535000,29.667200>}
box{<0,0,-0.101600><26.777500,0.035000,0.101600> rotate<0,0.000000,0> translate<22.662200,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.696997,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,31.699200>}
box{<0,0,-0.101600><32.148003,0.035000,0.101600> rotate<0,0.000000,0> translate<22.696997,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.697897,-1.535000,51.409600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.102100,-1.535000,51.409600>}
box{<0,0,-0.101600><0.404203,0.035000,0.101600> rotate<0,0.000000,0> translate<22.697897,-1.535000,51.409600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.796959,-1.535000,20.185022>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.955250,-1.535000,20.265672>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,-26.997327,0> translate<22.796959,-1.535000,20.185022> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.803500,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.956497,-1.535000,46.736000>}
box{<0,0,-0.101600><0.152997,0.035000,0.101600> rotate<0,0.000000,0> translate<22.803500,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.837384,-1.535000,46.769884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.880000,-1.535000,46.872769>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,-67.495773,0> translate<22.837384,-1.535000,46.769884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.857384,-1.535000,51.250113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.900000,-1.535000,51.147228>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,67.495773,0> translate<22.857384,-1.535000,51.250113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.865400,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.642900,-1.535000,29.870400>}
box{<0,0,-0.101600><26.777500,0.035000,0.101600> rotate<0,0.000000,0> translate<22.865400,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.875484,-1.535000,29.880484>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.412613>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<22.875484,-1.535000,29.880484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.875484,-1.535000,31.520713>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.988584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<22.875484,-1.535000,31.520713> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.875491,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.924509,-1.535000,51.206400>}
box{<0,0,-0.101600><0.049019,0.035000,0.101600> rotate<0,0.000000,0> translate<22.875491,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.880000,-1.535000,46.872769>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.922612,-1.535000,46.769884>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,67.497258,0> translate<22.880000,-1.535000,46.872769> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.885722,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,31.496000>}
box{<0,0,-0.101600><31.959278,0.035000,0.101600> rotate<0,0.000000,0> translate<22.885722,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.900000,-1.535000,51.147228>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.942613,-1.535000,51.250113>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,-67.497258,0> translate<22.900000,-1.535000,51.147228> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.922612,-1.535000,46.769884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.329884,-1.535000,46.362613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<22.922612,-1.535000,46.769884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.942613,-1.535000,51.250113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.349884,-1.535000,51.657384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<22.942613,-1.535000,51.250113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.955472,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.911462,-1.535000,30.073600>}
box{<0,0,-0.101600><26.955991,0.035000,0.101600> rotate<0,0.000000,0> translate<22.955472,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<22.969891,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.945778,-1.535000,31.292800>}
box{<0,0,-0.101600><31.975888,0.035000,0.101600> rotate<0,0.000000,0> translate<22.969891,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.039641,-1.535000,30.276800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.324500,-1.535000,30.276800>}
box{<0,0,-0.101600><32.284859,0.035000,0.101600> rotate<0,0.000000,0> translate<23.039641,-1.535000,30.276800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.054056,-1.535000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.328734,-1.535000,31.089600>}
box{<0,0,-0.101600><32.274678,0.035000,0.101600> rotate<0,0.000000,0> translate<23.054056,-1.535000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.412613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.988584>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<23.095897,-1.535000,30.988584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.325559,-1.535000,30.480000>}
box{<0,0,-0.101600><32.229663,0.035000,0.101600> rotate<0,0.000000,0> translate<23.095897,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.326616,-1.535000,30.683200>}
box{<0,0,-0.101600><32.230719,0.035000,0.101600> rotate<0,0.000000,0> translate<23.095897,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.095897,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.327675,-1.535000,30.886400>}
box{<0,0,-0.101600><32.231778,0.035000,0.101600> rotate<0,0.000000,0> translate<23.095897,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.187912,-1.535000,25.604897>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.763884,-1.535000,25.604897>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<23.187912,-1.535000,25.604897> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.329884,-1.535000,46.362613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.862013,-1.535000,46.142200>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<23.329884,-1.535000,46.362613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.349884,-1.535000,51.657384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.882013,-1.535000,51.877797>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<23.349884,-1.535000,51.657384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.763884,-1.535000,25.604897>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.296012,-1.535000,25.384484>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<23.763884,-1.535000,25.604897> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.767981,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.258984,-1.535000,25.603200>}
box{<0,0,-0.101600><25.491003,0.035000,0.101600> rotate<0,0.000000,0> translate<23.767981,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,53.304378>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.092678,-1.535000,53.006800>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<23.795100,-1.535000,53.304378> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.825219>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,53.304378>}
box{<0,0,-0.101600><1.520841,0.035000,0.101600> rotate<0,-90.000000,0> translate<23.795100,-1.535000,53.304378> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.795100,-1.535000,54.825219>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.999441,-1.535000,55.029556>}
box{<0,0,-0.101600><0.288979,0.035000,0.101600> rotate<0,-44.996592,0> translate<23.795100,-1.535000,54.825219> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.862013,-1.535000,46.142200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.437984,-1.535000,46.142200>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<23.862013,-1.535000,46.142200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.882013,-1.535000,51.877797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.457984,-1.535000,51.877797>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<23.882013,-1.535000,51.877797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.167981>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.971734,-1.535000,55.077541>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<23.947500,-1.535000,55.167981> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.663203>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.167981>}
box{<0,0,-0.101600><0.495222,0.035000,0.101600> rotate<0,-90.000000,0> translate<23.947500,-1.535000,55.167981> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.663203>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701488,-1.535000,55.663203>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,0.000000,0> translate<23.947500,-1.535000,55.663203> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.866391>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701488,-1.535000,55.866391>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,0.000000,0> translate<23.947500,-1.535000,55.866391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,56.361616>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,55.866391>}
box{<0,0,-0.101600><0.495225,0.035000,0.101600> rotate<0,-90.000000,0> translate<23.947500,-1.535000,55.866391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.947500,-1.535000,56.361616>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.971734,-1.535000,56.452056>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<23.947500,-1.535000,56.361616> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.971734,-1.535000,55.077541>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.999441,-1.535000,55.029556>}
box{<0,0,-0.101600><0.055409,0.035000,0.101600> rotate<0,59.993839,0> translate<23.971734,-1.535000,55.077541> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<23.971734,-1.535000,56.452056>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.018550,-1.535000,56.533141>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-59.995225,0> translate<23.971734,-1.535000,56.452056> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.018550,-1.535000,56.533141>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.084756,-1.535000,56.599347>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,-44.997030,0> translate<24.018550,-1.535000,56.533141> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.084756,-1.535000,56.599347>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.165841,-1.535000,56.646163>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-29.998836,0> translate<24.084756,-1.535000,56.599347> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.092678,-1.535000,53.006800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.513519,-1.535000,53.006800>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,0.000000,0> translate<24.092678,-1.535000,53.006800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.165841,-1.535000,56.646163>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.256281,-1.535000,56.670397>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<24.165841,-1.535000,56.646163> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.256281,-1.535000,56.670397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,56.670397>}
box{<0,0,-0.101600><0.445222,0.035000,0.101600> rotate<0,0.000000,0> translate<24.256281,-1.535000,56.670397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.258556,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.393709,-1.535000,25.400000>}
box{<0,0,-0.101600><1.135153,0.035000,0.101600> rotate<0,0.000000,0> translate<24.258556,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.296012,-1.535000,25.384484>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.703284,-1.535000,24.977213>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<24.296012,-1.535000,25.384484> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.437984,-1.535000,46.142200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.970113,-1.535000,46.362613>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<24.437984,-1.535000,46.142200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.457984,-1.535000,51.877797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.990113,-1.535000,51.657384>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<24.457984,-1.535000,51.877797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.483697,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.060800,-1.535000,25.196800>}
box{<0,0,-0.101600><0.577103,0.035000,0.101600> rotate<0,0.000000,0> translate<24.483697,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.515091,-1.535000,49.005856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.970113,-1.535000,48.817384>}
box{<0,0,-0.101600><0.492510,0.035000,0.101600> rotate<0,22.498047,0> translate<24.515091,-1.535000,49.005856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.515091,-1.535000,49.005856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.990113,-1.535000,49.202613>}
box{<0,0,-0.101600><0.514158,0.035000,0.101600> rotate<0,-22.498077,0> translate<24.515091,-1.535000,49.005856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.598762,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.806944,-1.535000,48.971200>}
box{<0,0,-0.101600><4.208181,0.035000,0.101600> rotate<0,0.000000,0> translate<24.598762,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.607178,-1.535000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.436719,-1.535000,51.816000>}
box{<0,0,-0.101600><30.829541,0.035000,0.101600> rotate<0,0.000000,0> translate<24.607178,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.686897,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.857600,-1.535000,24.993600>}
box{<0,0,-0.101600><0.170703,0.035000,0.101600> rotate<0,0.000000,0> translate<24.686897,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701488,-1.535000,55.866391>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701488,-1.535000,55.663203>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,-90.000000,0> translate<24.701488,-1.535000,55.663203> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,55.866409>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,56.670397>}
box{<0,0,-0.101600><0.803987,0.035000,0.101600> rotate<0,90.000000,0> translate<24.701503,-1.535000,56.670397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,55.866409>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,55.866409>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<24.701503,-1.535000,55.866409> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,55.880000>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<24.701503,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,56.083200>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<24.701503,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,56.286400>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<24.701503,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.701503,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,56.489600>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<24.701503,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.703284,-1.535000,24.977213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.749931,-1.535000,24.864597>}
box{<0,0,-0.101600><0.121894,0.035000,0.101600> rotate<0,67.495564,0> translate<24.703284,-1.535000,24.977213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.749931,-1.535000,24.864597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.765013,-1.535000,24.901013>}
box{<0,0,-0.101600><0.039415,0.035000,0.101600> rotate<0,-67.499031,0> translate<24.749931,-1.535000,24.864597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.765013,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.172284,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<24.765013,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.890409,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.073225,-1.535000,46.329600>}
box{<0,0,-0.101600><4.182816,0.035000,0.101600> rotate<0,0.000000,0> translate<24.890409,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,56.670397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,55.866409>}
box{<0,0,-0.101600><0.803987,0.035000,0.101600> rotate<0,-90.000000,0> translate<24.904691,-1.535000,55.866409> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904691,-1.535000,56.670397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.349916,-1.535000,56.670397>}
box{<0,0,-0.101600><0.445225,0.035000,0.101600> rotate<0,0.000000,0> translate<24.904691,-1.535000,56.670397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904709,-1.535000,55.663203>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904709,-1.535000,55.866391>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,90.000000,0> translate<24.904709,-1.535000,55.866391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904709,-1.535000,55.663203>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.663203>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,0.000000,0> translate<24.904709,-1.535000,55.663203> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904709,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.676800>}
box{<0,0,-0.101600><9.191791,0.035000,0.101600> rotate<0,0.000000,0> translate<24.904709,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.904709,-1.535000,55.866391>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.866391>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,0.000000,0> translate<24.904709,-1.535000,55.866391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.922000,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.953472,-1.535000,49.174400>}
box{<0,0,-0.101600><4.031472,0.035000,0.101600> rotate<0,0.000000,0> translate<24.922000,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.970113,-1.535000,46.362613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.377384,-1.535000,46.769884>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<24.970113,-1.535000,46.362613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.970113,-1.535000,48.817384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.377384,-1.535000,48.410113>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<24.970113,-1.535000,48.817384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.990113,-1.535000,49.202613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.397384,-1.535000,49.609884>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<24.990113,-1.535000,49.202613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<24.990113,-1.535000,51.657384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.397384,-1.535000,51.250113>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<24.990113,-1.535000,51.657384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.019497,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.768000>}
box{<0,0,-0.101600><3.774803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.019497,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.034697,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.435659,-1.535000,51.612800>}
box{<0,0,-0.101600><30.400962,0.035000,0.101600> rotate<0,0.000000,0> translate<25.034697,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.140300,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.822656,-1.535000,46.532800>}
box{<0,0,-0.101600><3.682356,0.035000,0.101600> rotate<0,0.000000,0> translate<25.140300,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.165100,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.240200,-1.535000,49.377600>}
box{<0,0,-0.101600><14.075100,0.035000,0.101600> rotate<0,0.000000,0> translate<25.165100,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.172284,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.704413,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<25.172284,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.222697,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.564800>}
box{<0,0,-0.101600><3.571603,0.035000,0.101600> rotate<0,0.000000,0> translate<25.222697,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.237897,-1.535000,51.409600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.434600,-1.535000,51.409600>}
box{<0,0,-0.101600><30.196703,0.035000,0.101600> rotate<0,0.000000,0> translate<25.237897,-1.535000,51.409600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.343500,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,46.736000>}
box{<0,0,-0.101600><3.450800,0.035000,0.101600> rotate<0,0.000000,0> translate<25.343500,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.349916,-1.535000,56.670397>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.440356,-1.535000,56.646163>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,14.999532,0> translate<25.349916,-1.535000,56.670397> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.368300,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.683278,-1.535000,49.580800>}
box{<0,0,-0.101600><14.314978,0.035000,0.101600> rotate<0,0.000000,0> translate<25.368300,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.377384,-1.535000,46.769884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.302013>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<25.377384,-1.535000,46.769884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.377384,-1.535000,48.410113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.877984>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<25.377384,-1.535000,48.410113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.397384,-1.535000,49.609884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.142012>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<25.397384,-1.535000,49.609884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.397384,-1.535000,51.250113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.717984>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<25.397384,-1.535000,51.250113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.397481,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.361600>}
box{<0,0,-0.101600><3.396819,0.035000,0.101600> rotate<0,0.000000,0> translate<25.397481,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.415491,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.433544,-1.535000,51.206400>}
box{<0,0,-0.101600><30.018053,0.035000,0.101600> rotate<0,0.000000,0> translate<25.415491,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.440356,-1.535000,56.646163>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.521441,-1.535000,56.599347>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,29.998836,0> translate<25.440356,-1.535000,56.646163> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.447516,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,46.939200>}
box{<0,0,-0.101600><3.346784,0.035000,0.101600> rotate<0,0.000000,0> translate<25.447516,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.469503,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.426131,-1.535000,49.784000>}
box{<0,0,-0.101600><29.956628,0.035000,0.101600> rotate<0,0.000000,0> translate<25.469503,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.481647,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.158400>}
box{<0,0,-0.101600><3.312653,0.035000,0.101600> rotate<0,0.000000,0> translate<25.481647,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.499659,-1.535000,51.003200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.432484,-1.535000,51.003200>}
box{<0,0,-0.101600><29.932825,0.035000,0.101600> rotate<0,0.000000,0> translate<25.499659,-1.535000,51.003200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.513519,-1.535000,53.006800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,53.304378>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<25.513519,-1.535000,53.006800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.521441,-1.535000,56.599347>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.587647,-1.535000,56.533141>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,44.997030,0> translate<25.521441,-1.535000,56.599347> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.531681,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.142400>}
box{<0,0,-0.101600><3.262619,0.035000,0.101600> rotate<0,0.000000,0> translate<25.531681,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.541919,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,53.035200>}
box{<0,0,-0.101600><1.978981,0.035000,0.101600> rotate<0,0.000000,0> translate<25.541919,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.553672,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.427191,-1.535000,49.987200>}
box{<0,0,-0.101600><29.873519,0.035000,0.101600> rotate<0,0.000000,0> translate<25.553672,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.565816,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.955200>}
box{<0,0,-0.101600><3.228484,0.035000,0.101600> rotate<0,0.000000,0> translate<25.565816,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.583828,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.431425,-1.535000,50.800000>}
box{<0,0,-0.101600><29.847597,0.035000,0.101600> rotate<0,0.000000,0> translate<25.583828,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.587647,-1.535000,56.533141>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.634463,-1.535000,56.452056>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,59.995225,0> translate<25.587647,-1.535000,56.533141> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.302013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.877984>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<25.597797,-1.535000,47.877984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.345600>}
box{<0,0,-0.101600><3.196503,0.035000,0.101600> rotate<0,0.000000,0> translate<25.597797,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.548800>}
box{<0,0,-0.101600><3.196503,0.035000,0.101600> rotate<0,0.000000,0> translate<25.597797,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.597797,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,47.752000>}
box{<0,0,-0.101600><5.250491,0.035000,0.101600> rotate<0,0.000000,0> translate<25.597797,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.606756,-1.535000,55.029556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.634463,-1.535000,55.077541>}
box{<0,0,-0.101600><0.055409,0.035000,0.101600> rotate<0,-59.993839,0> translate<25.606756,-1.535000,55.029556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.606756,-1.535000,55.029556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.825219>}
box{<0,0,-0.101600><0.288979,0.035000,0.101600> rotate<0,44.996592,0> translate<25.606756,-1.535000,55.029556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.612787,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.489600>}
box{<0,0,-0.101600><8.509113,0.035000,0.101600> rotate<0,0.000000,0> translate<25.612787,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.142012>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.717984>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<25.617797,-1.535000,50.717984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.190400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.428250,-1.535000,50.190400>}
box{<0,0,-0.101600><29.810453,0.035000,0.101600> rotate<0,0.000000,0> translate<25.617797,-1.535000,50.190400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.429306,-1.535000,50.393600>}
box{<0,0,-0.101600><29.811509,0.035000,0.101600> rotate<0,0.000000,0> translate<25.617797,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.617797,-1.535000,50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.430366,-1.535000,50.596800>}
box{<0,0,-0.101600><29.812569,0.035000,0.101600> rotate<0,0.000000,0> translate<25.617797,-1.535000,50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.628491,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,55.067200>}
box{<0,0,-0.101600><1.892409,0.035000,0.101600> rotate<0,0.000000,0> translate<25.628491,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.634463,-1.535000,55.077541>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.167981>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<25.634463,-1.535000,55.077541> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.634463,-1.535000,56.452056>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,56.361616>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<25.634463,-1.535000,56.452056> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.167981>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.663203>}
box{<0,0,-0.101600><0.495222,0.035000,0.101600> rotate<0,90.000000,0> translate<25.658697,-1.535000,55.663203> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,55.270400>}
box{<0,0,-0.101600><1.862203,0.035000,0.101600> rotate<0,0.000000,0> translate<25.658697,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.691481,-1.535000,55.473600>}
box{<0,0,-0.101600><2.032784,0.035000,0.101600> rotate<0,0.000000,0> translate<25.658697,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.866391>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,56.361616>}
box{<0,0,-0.101600><0.495225,0.035000,0.101600> rotate<0,90.000000,0> translate<25.658697,-1.535000,56.361616> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.880000>}
box{<0,0,-0.101600><8.437803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.658697,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.125109,-1.535000,56.083200>}
box{<0,0,-0.101600><8.466413,0.035000,0.101600> rotate<0,0.000000,0> translate<25.658697,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.658697,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.286400>}
box{<0,0,-0.101600><8.463203,0.035000,0.101600> rotate<0,0.000000,0> translate<25.658697,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.704413,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.280384,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<25.704413,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.745119,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,53.238400>}
box{<0,0,-0.101600><1.775781,0.035000,0.101600> rotate<0,0.000000,0> translate<25.745119,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.772316,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,54.864000>}
box{<0,0,-0.101600><1.748584,0.035000,0.101600> rotate<0,0.000000,0> translate<25.772316,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,53.304378>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.825219>}
box{<0,0,-0.101600><1.520841,0.035000,0.101600> rotate<0,90.000000,0> translate<25.811097,-1.535000,54.825219> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,53.441600>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,53.644800>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,53.848000>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,54.051200>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,54.254400>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,54.457600>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<25.811097,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,54.660800>}
box{<0,0,-0.101600><1.709803,0.035000,0.101600> rotate<0,0.000000,0> translate<25.811097,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.280384,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.812513,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<26.280384,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.591091,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.914009,-1.535000,25.400000>}
box{<0,0,-0.101600><1.322919,0.035000,0.101600> rotate<0,0.000000,0> translate<26.591091,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.812513,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.219784,-1.535000,24.901013>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<26.812513,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.923997,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.581100,-1.535000,25.196800>}
box{<0,0,-0.101600><0.657103,0.035000,0.101600> rotate<0,0.000000,0> translate<26.923997,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.127197,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.377900,-1.535000,24.993600>}
box{<0,0,-0.101600><0.250703,0.035000,0.101600> rotate<0,0.000000,0> translate<27.127197,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.219784,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.252547,-1.535000,24.821909>}
box{<0,0,-0.101600><0.085619,0.035000,0.101600> rotate<0,67.497454,0> translate<27.219784,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.252547,-1.535000,24.821909>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.285312,-1.535000,24.901013>}
box{<0,0,-0.101600><0.085621,0.035000,0.101600> rotate<0,-67.495522,0> translate<27.252547,-1.535000,24.821909> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.285312,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.692584,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<27.285312,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,52.646978>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.818478,-1.535000,52.349400>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<27.520900,-1.535000,52.646978> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,55.303019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,52.646978>}
box{<0,0,-0.101600><2.656041,0.035000,0.101600> rotate<0,-90.000000,0> translate<27.520900,-1.535000,52.646978> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.520900,-1.535000,55.303019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.818478,-1.535000,55.600597>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<27.520900,-1.535000,55.303019> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.692584,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.224713,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<27.692584,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.818478,-1.535000,52.349400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.458519,-1.535000,52.349400>}
box{<0,0,-0.101600><1.640041,0.035000,0.101600> rotate<0,0.000000,0> translate<27.818478,-1.535000,52.349400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.818478,-1.535000,55.600597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.458519,-1.535000,55.600597>}
box{<0,0,-0.101600><1.640041,0.035000,0.101600> rotate<0,0.000000,0> translate<27.818478,-1.535000,55.600597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.224713,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.800684,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<28.224713,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794297,-1.535000,47.878791>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.924016>}
box{<0,0,-0.101600><1.045225,0.035000,0.101600> rotate<0,-89.993889,0> translate<28.794297,-1.535000,47.878791> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794297,-1.535000,47.878791>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,47.878791>}
box{<0,0,-0.101600><2.053991,0.035000,0.101600> rotate<0,0.000000,0> translate<28.794297,-1.535000,47.878791> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,46.630381>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.818534,-1.535000,46.539941>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<28.794300,-1.535000,46.630381> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.675603>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,46.630381>}
box{<0,0,-0.101600><1.045222,0.035000,0.101600> rotate<0,-90.000000,0> translate<28.794300,-1.535000,46.630381> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,47.675603>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,47.675603>}
box{<0,0,-0.101600><2.053988,0.035000,0.101600> rotate<0,0.000000,0> translate<28.794300,-1.535000,47.675603> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.794300,-1.535000,48.924016>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.818534,-1.535000,49.014456>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<28.794300,-1.535000,48.924016> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.800684,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.332813,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<28.800684,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.818534,-1.535000,46.539941>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.865350,-1.535000,46.458856>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,59.995225,0> translate<28.818534,-1.535000,46.539941> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.818534,-1.535000,49.014456>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.865350,-1.535000,49.095541>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-59.995225,0> translate<28.818534,-1.535000,49.014456> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.865350,-1.535000,46.458856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.931556,-1.535000,46.392650>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,44.997030,0> translate<28.865350,-1.535000,46.458856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.865350,-1.535000,49.095541>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.931556,-1.535000,49.161747>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,-44.997030,0> translate<28.865350,-1.535000,49.095541> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.931556,-1.535000,46.392650>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.012641,-1.535000,46.345834>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,29.998836,0> translate<28.931556,-1.535000,46.392650> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<28.931556,-1.535000,49.161747>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.012641,-1.535000,49.208562>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-29.998836,0> translate<28.931556,-1.535000,49.161747> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.012641,-1.535000,46.345834>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.103081,-1.535000,46.321600>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,14.999532,0> translate<29.012641,-1.535000,46.345834> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.012641,-1.535000,49.208562>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.103081,-1.535000,49.232797>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<29.012641,-1.535000,49.208562> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.103081,-1.535000,46.321600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.321600>}
box{<0,0,-0.101600><1.745222,0.035000,0.101600> rotate<0,0.000000,0> translate<29.103081,-1.535000,46.321600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.103081,-1.535000,49.232797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,49.232797>}
box{<0,0,-0.101600><1.745222,0.035000,0.101600> rotate<0,0.000000,0> translate<29.103081,-1.535000,49.232797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.111391,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.444213,-1.535000,25.400000>}
box{<0,0,-0.101600><1.332822,0.035000,0.101600> rotate<0,0.000000,0> translate<29.111391,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.332813,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.740084,-1.535000,24.901013>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<29.332813,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.444297,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.108900,-1.535000,25.196800>}
box{<0,0,-0.101600><0.664603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.444297,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.458519,-1.535000,52.349400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,52.646978>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<29.458519,-1.535000,52.349400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.458519,-1.535000,55.600597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,55.303019>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<29.458519,-1.535000,55.600597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.534719,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.365078,-1.535000,52.425600>}
box{<0,0,-0.101600><2.830359,0.035000,0.101600> rotate<0,0.000000,0> translate<29.534719,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.585516,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.314281,-1.535000,55.473600>}
box{<0,0,-0.101600><2.728766,0.035000,0.101600> rotate<0,0.000000,0> translate<29.585516,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.647497,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.905700,-1.535000,24.993600>}
box{<0,0,-0.101600><0.258203,0.035000,0.101600> rotate<0,0.000000,0> translate<29.647497,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.737919,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.066006,-1.535000,52.628800>}
box{<0,0,-0.101600><0.328087,0.035000,0.101600> rotate<0,0.000000,0> translate<29.737919,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.740084,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.776100,-1.535000,24.814056>}
box{<0,0,-0.101600><0.094120,0.035000,0.101600> rotate<0,67.497139,0> translate<29.740084,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,52.646978>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,55.303019>}
box{<0,0,-0.101600><2.656041,0.035000,0.101600> rotate<0,90.000000,0> translate<29.756097,-1.535000,55.303019> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,52.832000>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.035200>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.238400>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.441600>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.644800>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.848000>}
box{<0,0,-0.101600><0.228600,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,54.051200>}
box{<0,0,-0.101600><1.092191,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,54.254400>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,54.457600>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,54.660800>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,54.864000>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,55.067200>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.756097,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.032344,-1.535000,55.270400>}
box{<0,0,-0.101600><0.276247,0.035000,0.101600> rotate<0,0.000000,0> translate<29.756097,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.776100,-1.535000,24.814056>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.811413,-1.535000,24.899313>}
box{<0,0,-0.101600><0.092280,0.035000,0.101600> rotate<0,-67.496575,0> translate<29.776100,-1.535000,24.814056> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.811413,-1.535000,24.899313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.218684,-1.535000,25.306584>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<29.811413,-1.535000,24.899313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.873403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,52.810581>}
box{<0,0,-0.101600><1.062822,0.035000,0.101600> rotate<0,89.993892,0> translate<29.984697,-1.535000,53.873403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,53.873403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,53.873403>}
box{<0,0,-0.101600><0.863591,0.035000,0.101600> rotate<0,0.000000,0> translate<29.984697,-1.535000,53.873403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,54.076591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,55.139416>}
box{<0,0,-0.101600><1.062825,0.035000,0.101600> rotate<0,-89.993892,0> translate<29.984697,-1.535000,54.076591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984697,-1.535000,54.076591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,54.076591>}
box{<0,0,-0.101600><0.863591,0.035000,0.101600> rotate<0,0.000000,0> translate<29.984697,-1.535000,54.076591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,52.810581>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.008934,-1.535000,52.720141>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<29.984700,-1.535000,52.810581> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<29.984700,-1.535000,55.139416>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.008934,-1.535000,55.229856>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<29.984700,-1.535000,55.139416> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.008934,-1.535000,52.720141>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.055750,-1.535000,52.639056>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,59.995225,0> translate<30.008934,-1.535000,52.720141> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.008934,-1.535000,55.229856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.055750,-1.535000,55.310941>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-59.995225,0> translate<30.008934,-1.535000,55.229856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.055750,-1.535000,52.639056>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.121956,-1.535000,52.572850>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,44.997030,0> translate<30.055750,-1.535000,52.639056> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.055750,-1.535000,55.310941>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.121956,-1.535000,55.377147>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,-44.997030,0> translate<30.055750,-1.535000,55.310941> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.121956,-1.535000,52.572850>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.203041,-1.535000,52.526034>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,29.998836,0> translate<30.121956,-1.535000,52.572850> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.121956,-1.535000,55.377147>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.203041,-1.535000,55.423963>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-29.998836,0> translate<30.121956,-1.535000,55.377147> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.203041,-1.535000,52.526034>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.293481,-1.535000,52.501800>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,14.999532,0> translate<30.203041,-1.535000,52.526034> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.203041,-1.535000,55.423963>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.293481,-1.535000,55.448197>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<30.203041,-1.535000,55.423963> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.218684,-1.535000,25.306584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.750813,-1.535000,25.526997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<30.218684,-1.535000,25.306584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.293481,-1.535000,52.501800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,52.501800>}
box{<0,0,-0.101600><0.554822,0.035000,0.101600> rotate<0,0.000000,0> translate<30.293481,-1.535000,52.501800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.293481,-1.535000,55.448197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,55.448197>}
box{<0,0,-0.101600><0.554822,0.035000,0.101600> rotate<0,0.000000,0> translate<30.293481,-1.535000,55.448197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.750813,-1.535000,25.526997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.326784,-1.535000,25.526997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<30.750813,-1.535000,25.526997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,47.878791>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,47.675603>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,-90.000000,0> translate<30.848288,-1.535000,47.675603> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,54.076591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848288,-1.535000,53.873403>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,-90.000000,0> translate<30.848288,-1.535000,53.873403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.321600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.675587>}
box{<0,0,-0.101600><1.353987,0.035000,0.101600> rotate<0,90.000000,0> translate<30.848303,-1.535000,47.675587> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.329600>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.532800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.736000>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.939200>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.142400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.345600>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.548800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.675587>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.675587>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.675587> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.878809>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,49.232797>}
box{<0,0,-0.101600><1.353988,0.035000,0.101600> rotate<0,90.000000,0> translate<30.848303,-1.535000,49.232797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.878809>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.878809>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.878809> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.955200>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,48.158400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,48.361600>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,48.564800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,48.768000>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,48.971200>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,49.174400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,52.501800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.873387>}
box{<0,0,-0.101600><1.371587,0.035000,0.101600> rotate<0,90.000000,0> translate<30.848303,-1.535000,53.873387> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,52.628800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,52.832000>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.035200>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.238400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.441600>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.644800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.848000>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,53.873387>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.873387>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,53.873387> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.076609>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,55.448197>}
box{<0,0,-0.101600><1.371587,0.035000,0.101600> rotate<0,90.000000,0> translate<30.848303,-1.535000,55.448197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.076609>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.076609>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,54.076609> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.254400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.457600>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.660800>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.864000>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,55.067200>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<30.848303,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,55.270400>}
box{<0,0,-0.101600><0.203188,0.035000,0.101600> rotate<0,0.000000,0> translate<30.848303,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.321600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.796716,-1.535000,46.321600>}
box{<0,0,-0.101600><1.745225,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051491,-1.535000,46.321600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.675587>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,46.321600>}
box{<0,0,-0.101600><1.353987,0.035000,0.101600> rotate<0,-90.000000,0> translate<31.051491,-1.535000,46.321600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,49.232797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,47.878809>}
box{<0,0,-0.101600><1.353988,0.035000,0.101600> rotate<0,-90.000000,0> translate<31.051491,-1.535000,47.878809> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,49.232797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.796716,-1.535000,49.232797>}
box{<0,0,-0.101600><1.745225,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051491,-1.535000,49.232797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,52.501800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.606316,-1.535000,52.501800>}
box{<0,0,-0.101600><0.554825,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051491,-1.535000,52.501800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,53.873387>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,52.501800>}
box{<0,0,-0.101600><1.371587,0.035000,0.101600> rotate<0,-90.000000,0> translate<31.051491,-1.535000,52.501800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,55.448197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,54.076609>}
box{<0,0,-0.101600><1.371587,0.035000,0.101600> rotate<0,-90.000000,0> translate<31.051491,-1.535000,54.076609> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051491,-1.535000,55.448197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.606316,-1.535000,55.448197>}
box{<0,0,-0.101600><0.554825,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051491,-1.535000,55.448197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,47.675603>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,47.878791>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,90.000000,0> translate<31.051509,-1.535000,47.878791> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,47.675603>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.675603>}
box{<0,0,-0.101600><2.053987,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,47.675603> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.705666,-1.535000,47.752000>}
box{<0,0,-0.101600><7.654156,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,47.878791>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.878791>}
box{<0,0,-0.101600><2.053987,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,47.878791> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,53.873403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,54.076591>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,90.000000,0> translate<31.051509,-1.535000,54.076591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,53.873403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.873403>}
box{<0,0,-0.101600><0.863588,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,53.873403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,54.051200>}
box{<0,0,-0.101600><1.092191,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.051509,-1.535000,54.076591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.076591>}
box{<0,0,-0.101600><0.863588,0.035000,0.101600> rotate<0,0.000000,0> translate<31.051509,-1.535000,54.076591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.326784,-1.535000,25.526997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.858913,-1.535000,25.306584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<31.326784,-1.535000,25.526997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.606316,-1.535000,52.501800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.696756,-1.535000,52.526034>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<31.606316,-1.535000,52.501800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.606316,-1.535000,55.448197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.696756,-1.535000,55.423963>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,14.999532,0> translate<31.606316,-1.535000,55.448197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.633388,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.079109,-1.535000,25.400000>}
box{<0,0,-0.101600><1.445722,0.035000,0.101600> rotate<0,0.000000,0> translate<31.633388,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.696756,-1.535000,52.526034>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.777841,-1.535000,52.572850>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-29.998836,0> translate<31.696756,-1.535000,52.526034> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.696756,-1.535000,55.423963>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.777841,-1.535000,55.377147>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,29.998836,0> translate<31.696756,-1.535000,55.423963> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.777841,-1.535000,52.572850>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.844047,-1.535000,52.639056>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,-44.997030,0> translate<31.777841,-1.535000,52.572850> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.777841,-1.535000,55.377147>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.844047,-1.535000,55.310941>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,44.997030,0> translate<31.777841,-1.535000,55.377147> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.833791,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.161878,-1.535000,52.628800>}
box{<0,0,-0.101600><0.328087,0.035000,0.101600> rotate<0,0.000000,0> translate<31.833791,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.844047,-1.535000,52.639056>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.890863,-1.535000,52.720141>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-59.995225,0> translate<31.844047,-1.535000,52.639056> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.844047,-1.535000,55.310941>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.890863,-1.535000,55.229856>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,59.995225,0> translate<31.844047,-1.535000,55.310941> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.858913,-1.535000,25.306584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.266184,-1.535000,24.899313>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<31.858913,-1.535000,25.306584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.867456,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,55.270400>}
box{<0,0,-0.101600><0.276244,0.035000,0.101600> rotate<0,0.000000,0> translate<31.867456,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.890863,-1.535000,52.720141>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,52.810581>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<31.890863,-1.535000,52.720141> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.890863,-1.535000,55.229856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,55.139416>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<31.890863,-1.535000,55.229856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,52.810581>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.873403>}
box{<0,0,-0.101600><1.062822,0.035000,0.101600> rotate<0,90.000000,0> translate<31.915097,-1.535000,53.873403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,52.832000>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,53.035200>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,53.238400>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,53.441600>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,53.644800>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,53.848000>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.076591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,55.139416>}
box{<0,0,-0.101600><1.062825,0.035000,0.101600> rotate<0,90.000000,0> translate<31.915097,-1.535000,55.139416> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,54.254400>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,54.457600>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,54.660800>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,54.864000>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.915097,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,55.067200>}
box{<0,0,-0.101600><0.228603,0.035000,0.101600> rotate<0,0.000000,0> translate<31.915097,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<31.968697,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.746200,-1.535000,25.196800>}
box{<0,0,-0.101600><0.777503,0.035000,0.101600> rotate<0,0.000000,0> translate<31.968697,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,52.646978>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.441278,-1.535000,52.349400>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<32.143700,-1.535000,52.646978> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,55.303019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,52.646978>}
box{<0,0,-0.101600><2.656041,0.035000,0.101600> rotate<0,-90.000000,0> translate<32.143700,-1.535000,52.646978> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.143700,-1.535000,55.303019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.441278,-1.535000,55.600597>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<32.143700,-1.535000,55.303019> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.171897,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.543000,-1.535000,24.993600>}
box{<0,0,-0.101600><0.371103,0.035000,0.101600> rotate<0,0.000000,0> translate<32.171897,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.266184,-1.535000,24.899313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.357947,-1.535000,24.677775>}
box{<0,0,-0.101600><0.239790,0.035000,0.101600> rotate<0,67.495840,0> translate<32.266184,-1.535000,24.899313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.311297,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.404597,-1.535000,24.790400>}
box{<0,0,-0.101600><0.093300,0.035000,0.101600> rotate<0,0.000000,0> translate<32.311297,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.357947,-1.535000,24.677775>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.450412,-1.535000,24.901013>}
box{<0,0,-0.101600><0.241630,0.035000,0.101600> rotate<0,-67.496066,0> translate<32.357947,-1.535000,24.677775> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.441278,-1.535000,52.349400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.081319,-1.535000,52.349400>}
box{<0,0,-0.101600><1.640041,0.035000,0.101600> rotate<0,0.000000,0> translate<32.441278,-1.535000,52.349400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.441278,-1.535000,55.600597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.081319,-1.535000,55.600597>}
box{<0,0,-0.101600><1.640041,0.035000,0.101600> rotate<0,0.000000,0> translate<32.441278,-1.535000,55.600597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.450412,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.857684,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<32.450412,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.796716,-1.535000,46.321600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.887156,-1.535000,46.345834>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<32.796716,-1.535000,46.321600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.796716,-1.535000,49.232797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.887156,-1.535000,49.208562>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,14.999532,0> translate<32.796716,-1.535000,49.232797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.826569,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.408134,-1.535000,46.329600>}
box{<0,0,-0.101600><22.581566,0.035000,0.101600> rotate<0,0.000000,0> translate<32.826569,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.857684,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.389813,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<32.857684,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.887156,-1.535000,46.345834>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.968241,-1.535000,46.392650>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-29.998836,0> translate<32.887156,-1.535000,46.345834> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.887156,-1.535000,49.208562>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.968241,-1.535000,49.161747>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,29.998836,0> translate<32.887156,-1.535000,49.208562> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.946328,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.037000,-1.535000,49.174400>}
box{<0,0,-0.101600><6.090672,0.035000,0.101600> rotate<0,0.000000,0> translate<32.946328,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.968241,-1.535000,46.392650>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.034447,-1.535000,46.458856>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,-44.997030,0> translate<32.968241,-1.535000,46.392650> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<32.968241,-1.535000,49.161747>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.034447,-1.535000,49.095541>}
box{<0,0,-0.101600><0.093630,0.035000,0.101600> rotate<0,44.997030,0> translate<32.968241,-1.535000,49.161747> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.034447,-1.535000,46.458856>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.081263,-1.535000,46.539941>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,-59.995225,0> translate<33.034447,-1.535000,46.458856> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.034447,-1.535000,49.095541>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.081263,-1.535000,49.014456>}
box{<0,0,-0.101600><0.093629,0.035000,0.101600> rotate<0,59.995225,0> translate<33.034447,-1.535000,49.095541> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.077137,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.303269,-1.535000,46.532800>}
box{<0,0,-0.101600><14.226131,0.035000,0.101600> rotate<0,0.000000,0> translate<33.077137,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.081263,-1.535000,46.539941>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,46.630381>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<33.081263,-1.535000,46.539941> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.081263,-1.535000,49.014456>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.924016>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,74.994529,0> translate<33.081263,-1.535000,49.014456> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.092856,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.852966,-1.535000,48.971200>}
box{<0,0,-0.101600><5.760109,0.035000,0.101600> rotate<0,0.000000,0> translate<33.092856,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,46.630381>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.675603>}
box{<0,0,-0.101600><1.045222,0.035000,0.101600> rotate<0,90.000000,0> translate<33.105497,-1.535000,47.675603> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.805913,-1.535000,46.736000>}
box{<0,0,-0.101600><6.700416,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.315338,-1.535000,46.939200>}
box{<0,0,-0.101600><6.209841,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.087797,-1.535000,47.142400>}
box{<0,0,-0.101600><5.982300,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.884597,-1.535000,47.345600>}
box{<0,0,-0.101600><5.779100,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.789834,-1.535000,47.548800>}
box{<0,0,-0.101600><5.684338,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.878791>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.924016>}
box{<0,0,-0.101600><1.045225,0.035000,0.101600> rotate<0,90.000000,0> translate<33.105497,-1.535000,48.924016> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,47.955200>}
box{<0,0,-0.101600><5.540603,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,48.158400>}
box{<0,0,-0.101600><5.540603,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,48.361600>}
box{<0,0,-0.101600><5.540603,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.684628,-1.535000,48.564800>}
box{<0,0,-0.101600><5.579131,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.105497,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.768797,-1.535000,48.768000>}
box{<0,0,-0.101600><5.663300,0.035000,0.101600> rotate<0,0.000000,0> translate<33.105497,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.389813,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.965784,-1.535000,25.528697>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<33.389813,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<33.965784,-1.535000,25.528697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.497912,-1.535000,25.308284>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<33.965784,-1.535000,25.528697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.081319,-1.535000,52.349400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,52.646978>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<34.081319,-1.535000,52.349400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.081319,-1.535000,55.600597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.585413>}
box{<0,0,-0.101600><0.021472,0.035000,0.101600> rotate<0,45.002926,0> translate<34.081319,-1.535000,55.600597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.880716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.585413>}
box{<0,0,-0.101600><0.295303,0.035000,0.101600> rotate<0,-90.000000,0> translate<34.096500,-1.535000,55.585413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.096500,-1.535000,55.880716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.120734,-1.535000,55.971156>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-74.994529,0> translate<34.096500,-1.535000,55.880716> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.120734,-1.535000,55.971156>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.144231,-1.535000,56.011850>}
box{<0,0,-0.101600><0.046990,0.035000,0.101600> rotate<0,-59.993583,0> translate<34.120734,-1.535000,55.971156> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.095181>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.144231,-1.535000,56.011850>}
box{<0,0,-0.101600><0.086272,0.035000,0.101600> rotate<0,74.993313,0> translate<34.121900,-1.535000,56.095181> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.540403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.095181>}
box{<0,0,-0.101600><0.445222,0.035000,0.101600> rotate<0,-90.000000,0> translate<34.121900,-1.535000,56.095181> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.540403>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925888,-1.535000,56.540403>}
box{<0,0,-0.101600><0.803987,0.035000,0.101600> rotate<0,0.000000,0> translate<34.121900,-1.535000,56.540403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.743591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925888,-1.535000,56.743591>}
box{<0,0,-0.101600><0.803987,0.035000,0.101600> rotate<0,0.000000,0> translate<34.121900,-1.535000,56.743591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.991875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.121900,-1.535000,56.743591>}
box{<0,0,-0.101600><0.248284,0.035000,0.101600> rotate<0,-90.000000,0> translate<34.121900,-1.535000,56.743591> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.157519,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.266878,-1.535000,52.425600>}
box{<0,0,-0.101600><7.109359,0.035000,0.101600> rotate<0,0.000000,0> translate<34.157519,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.276491,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.839991,-1.535000,25.400000>}
box{<0,0,-0.101600><1.563500,0.035000,0.101600> rotate<0,0.000000,0> translate<34.276491,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.360719,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.063678,-1.535000,52.628800>}
box{<0,0,-0.101600><6.702959,0.035000,0.101600> rotate<0,0.000000,0> translate<34.360719,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,52.646978>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,54.485372>}
box{<0,0,-0.101600><1.838394,0.035000,0.101600> rotate<0,90.000000,0> translate<34.378897,-1.535000,54.485372> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,52.832000>}
box{<0,0,-0.101600><6.635703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,53.035200>}
box{<0,0,-0.101600><6.635703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,53.238400>}
box{<0,0,-0.101600><6.635703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.031278,-1.535000,53.441600>}
box{<0,0,-0.101600><4.652381,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.828078,-1.535000,53.644800>}
box{<0,0,-0.101600><4.449181,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,53.848000>}
box{<0,0,-0.101600><4.435703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,54.051200>}
box{<0,0,-0.101600><4.435703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,54.254400>}
box{<0,0,-0.101600><4.435703,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.809978,-1.535000,54.457600>}
box{<0,0,-0.101600><1.431081,0.035000,0.101600> rotate<0,0.000000,0> translate<34.378897,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.378897,-1.535000,54.485372>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.405281,-1.535000,54.478300>}
box{<0,0,-0.101600><0.027316,0.035000,0.101600> rotate<0,15.003473,0> translate<34.378897,-1.535000,54.485372> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.405281,-1.535000,54.478300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,54.478300>}
box{<0,0,-0.101600><0.495222,0.035000,0.101600> rotate<0,0.000000,0> translate<34.405281,-1.535000,54.478300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.497912,-1.535000,25.308284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.905184,-1.535000,24.901013>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<34.497912,-1.535000,25.308284> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.609397,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.453200,-1.535000,25.196800>}
box{<0,0,-0.101600><0.843803,0.035000,0.101600> rotate<0,0.000000,0> translate<34.609397,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.812597,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.250000,-1.535000,24.993600>}
box{<0,0,-0.101600><0.437403,0.035000,0.101600> rotate<0,0.000000,0> translate<34.812597,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,54.478300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.232288>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,90.000000,0> translate<34.900503,-1.535000,55.232288> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,54.660800>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,54.864000>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.067200>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.232288>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.232288>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.232288> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.435509>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.786400>}
box{<0,0,-0.101600><0.350891,0.035000,0.101600> rotate<0,90.000000,0> translate<34.900503,-1.535000,55.786400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.435509>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.435509>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.435509> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.473600>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.676800>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.900503,-1.535000,55.786400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,55.786400>}
box{<0,0,-0.101600><0.025400,0.035000,0.101600> rotate<0,0.000000,0> translate<34.900503,-1.535000,55.786400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.905184,-1.535000,24.901013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.020141,-1.535000,24.623481>}
box{<0,0,-0.101600><0.300397,0.035000,0.101600> rotate<0,67.495714,0> translate<34.905184,-1.535000,24.901013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925888,-1.535000,56.743591>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925888,-1.535000,56.540403>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,-90.000000,0> translate<34.925888,-1.535000,56.540403> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,55.786400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,56.540388>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,90.000000,0> translate<34.925903,-1.535000,56.540388> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.880000>}
box{<0,0,-0.101600><0.177787,0.035000,0.101600> rotate<0,0.000000,0> translate<34.925903,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,56.083200>}
box{<0,0,-0.101600><0.177787,0.035000,0.101600> rotate<0,0.000000,0> translate<34.925903,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.286400>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.925903,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.489600>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.925903,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.925903,-1.535000,56.540388>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.540388>}
box{<0,0,-0.101600><0.203187,0.035000,0.101600> rotate<0,0.000000,0> translate<34.925903,-1.535000,56.540388> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<34.951003,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.089278,-1.535000,24.790400>}
box{<0,0,-0.101600><0.138275,0.035000,0.101600> rotate<0,0.000000,0> translate<34.951003,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.020141,-1.535000,24.623481>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.119312,-1.535000,24.862913>}
box{<0,0,-0.101600><0.259157,0.035000,0.101600> rotate<0,-67.496321,0> translate<35.020141,-1.535000,24.623481> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,54.478300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.598916,-1.535000,54.478300>}
box{<0,0,-0.101600><0.495225,0.035000,0.101600> rotate<0,0.000000,0> translate<35.103691,-1.535000,54.478300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.232288>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,54.478300>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,-90.000000,0> translate<35.103691,-1.535000,54.478300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,56.189497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,55.435509>}
box{<0,0,-0.101600><0.753988,0.035000,0.101600> rotate<0,-90.000000,0> translate<35.103691,-1.535000,55.435509> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.103691,-1.535000,56.189497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.189497>}
box{<0,0,-0.101600><0.025400,0.035000,0.101600> rotate<0,0.000000,0> translate<35.103691,-1.535000,56.189497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.119312,-1.535000,24.862913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.526584,-1.535000,25.270184>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<35.119312,-1.535000,24.862913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.540388>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.129091,-1.535000,56.189497>}
box{<0,0,-0.101600><0.350891,0.035000,0.101600> rotate<0,-90.000000,0> translate<35.129091,-1.535000,56.189497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.526584,-1.535000,25.270184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.058712,-1.535000,25.490597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<35.526584,-1.535000,25.270184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.598916,-1.535000,54.478300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.689356,-1.535000,54.502534>}
box{<0,0,-0.101600><0.093631,0.035000,0.101600> rotate<0,-14.999532,0> translate<35.598916,-1.535000,54.478300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.689356,-1.535000,54.502534>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.737341,-1.535000,54.530241>}
box{<0,0,-0.101600><0.055409,0.035000,0.101600> rotate<0,-30.000221,0> translate<35.689356,-1.535000,54.502534> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.737341,-1.535000,54.530241>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.941678,-1.535000,54.325900>}
box{<0,0,-0.101600><0.288979,0.035000,0.101600> rotate<0,44.997468,0> translate<35.737341,-1.535000,54.530241> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<35.941678,-1.535000,54.325900>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.462519,-1.535000,54.325900>}
box{<0,0,-0.101600><1.520841,0.035000,0.101600> rotate<0,0.000000,0> translate<35.941678,-1.535000,54.325900> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.058712,-1.535000,25.490597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.634684,-1.535000,25.490597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<36.058712,-1.535000,25.490597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.634684,-1.535000,25.490597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,25.270184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<36.634684,-1.535000,25.490597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.853409,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.343153,-1.535000,25.400000>}
box{<0,0,-0.101600><12.489744,0.035000,0.101600> rotate<0,0.000000,0> translate<36.853409,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.867347,-1.535000,20.151372>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.025638,-1.535000,20.070722>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,26.997327,0> translate<36.867347,-1.535000,20.151372> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.867347,-1.535000,20.151372>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,20.275413>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,-22.498172,0> translate<36.867347,-1.535000,20.151372> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<36.935203,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,20.116800>}
box{<0,0,-0.101600><15.994297,0.035000,0.101600> rotate<0,0.000000,0> translate<36.935203,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.025638,-1.535000,20.070722>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.190594,-1.535000,19.950872>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<37.025638,-1.535000,20.070722> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.063928,-1.535000,22.772800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,22.730184>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,22.498288,0> translate<37.063928,-1.535000,22.772800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.063928,-1.535000,22.772800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,22.815413>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,-22.496802,0> translate<37.063928,-1.535000,22.772800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.098694,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.285328,-1.535000,22.758400>}
box{<0,0,-0.101600><18.186634,0.035000,0.101600> rotate<0,0.000000,0> translate<37.098694,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,20.275413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,20.682684>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<37.166812,-1.535000,20.275413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,22.730184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,22.322913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<37.166812,-1.535000,22.730184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,22.815413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,23.222684>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<37.166812,-1.535000,22.815413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.166812,-1.535000,25.270184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,24.862913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<37.166812,-1.535000,25.270184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.190594,-1.535000,19.950872>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.334772,-1.535000,19.806694>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<37.190594,-1.535000,19.950872> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.211400,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,20.320000>}
box{<0,0,-0.101600><15.718100,0.035000,0.101600> rotate<0,0.000000,0> translate<37.211400,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.227866,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,19.913600>}
box{<0,0,-0.101600><15.701634,0.035000,0.101600> rotate<0,0.000000,0> translate<37.227866,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.240197,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.427319,-1.535000,25.196800>}
box{<0,0,-0.101600><12.187122,0.035000,0.101600> rotate<0,0.000000,0> translate<37.240197,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.313000,-1.535000,22.961600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.286388,-1.535000,22.961600>}
box{<0,0,-0.101600><17.973388,0.035000,0.101600> rotate<0,0.000000,0> translate<37.313000,-1.535000,22.961600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.334772,-1.535000,19.806694>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.420069,-1.535000,19.689291>}
box{<0,0,-0.101600><0.145117,0.035000,0.101600> rotate<0,53.996912,0> translate<37.334772,-1.535000,19.806694> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.341797,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.284272,-1.535000,22.555200>}
box{<0,0,-0.101600><17.942475,0.035000,0.101600> rotate<0,0.000000,0> translate<37.341797,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.404734,-1.535000,19.710400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,19.710400>}
box{<0,0,-0.101600><15.524766,0.035000,0.101600> rotate<0,0.000000,0> translate<37.404734,-1.535000,19.710400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.414600,-1.535000,20.523200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.975625,-1.535000,20.523200>}
box{<0,0,-0.101600><15.561025,0.035000,0.101600> rotate<0,0.000000,0> translate<37.414600,-1.535000,20.523200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.420069,-1.535000,19.689291>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.050600,-1.535000,19.295797>}
box{<0,0,-0.101600><15.635484,0.035000,0.101600> rotate<0,1.442004,0> translate<37.420069,-1.535000,19.689291> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.443397,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.608897,-1.535000,24.993600>}
box{<0,0,-0.101600><12.165500,0.035000,0.101600> rotate<0,0.000000,0> translate<37.443397,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.462519,-1.535000,54.325900>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,54.623478>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<37.462519,-1.535000,54.325900> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.516200,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.287447,-1.535000,23.164800>}
box{<0,0,-0.101600><17.771247,0.035000,0.101600> rotate<0,0.000000,0> translate<37.516200,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.544997,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.283213,-1.535000,22.352000>}
box{<0,0,-0.101600><17.738216,0.035000,0.101600> rotate<0,0.000000,0> translate<37.544997,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,20.682684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.214813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<37.574084,-1.535000,20.682684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,22.322913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.790784>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<37.574084,-1.535000,22.322913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,23.222684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,23.754812>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<37.574084,-1.535000,23.222684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.574084,-1.535000,24.862913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,24.330784>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<37.574084,-1.535000,24.862913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.592191,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.059794,-1.535000,20.726400>}
box{<0,0,-0.101600><15.467603,0.035000,0.101600> rotate<0,0.000000,0> translate<37.592191,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.594219,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,54.457600>}
box{<0,0,-0.101600><1.220381,0.035000,0.101600> rotate<0,0.000000,0> translate<37.594219,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.604122,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.812097,-1.535000,24.790400>}
box{<0,0,-0.101600><12.207975,0.035000,0.101600> rotate<0,0.000000,0> translate<37.604122,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.634275,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.288506,-1.535000,23.368000>}
box{<0,0,-0.101600><17.654231,0.035000,0.101600> rotate<0,0.000000,0> translate<37.634275,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.646206,-1.535000,22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.282153,-1.535000,22.148800>}
box{<0,0,-0.101600><17.635947,0.035000,0.101600> rotate<0,0.000000,0> translate<37.646206,-1.535000,22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.676356,-1.535000,20.929600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.143963,-1.535000,20.929600>}
box{<0,0,-0.101600><15.467606,0.035000,0.101600> rotate<0,0.000000,0> translate<37.676356,-1.535000,20.929600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.688288,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.249228,-1.535000,24.587200>}
box{<0,0,-0.101600><12.560941,0.035000,0.101600> rotate<0,0.000000,0> translate<37.688288,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.718441,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.289563,-1.535000,23.571200>}
box{<0,0,-0.101600><17.571122,0.035000,0.101600> rotate<0,0.000000,0> translate<37.718441,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.730372,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.286625,-1.535000,21.945600>}
box{<0,0,-0.101600><16.556253,0.035000,0.101600> rotate<0,0.000000,0> translate<37.730372,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,54.623478>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.906181>}
box{<0,0,-0.101600><1.282703,0.035000,0.101600> rotate<0,90.000000,0> translate<37.760097,-1.535000,55.906181> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,54.660800>}
box{<0,0,-0.101600><1.054503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,54.864000>}
box{<0,0,-0.101600><1.054503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,55.067200>}
box{<0,0,-0.101600><1.054503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.005881,-1.535000,55.270400>}
box{<0,0,-0.101600><1.245784,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,55.473600>}
box{<0,0,-0.101600><3.254503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,55.676800>}
box{<0,0,-0.101600><3.254503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,55.880000>}
box{<0,0,-0.101600><3.254503,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760097,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760097,-1.535000,55.906181>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,55.931578>}
box{<0,0,-0.101600><0.035919,0.035000,0.101600> rotate<0,-44.993506,0> translate<37.760097,-1.535000,55.906181> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.760525,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.228131,-1.535000,21.132800>}
box{<0,0,-0.101600><15.467606,0.035000,0.101600> rotate<0,0.000000,0> translate<37.760525,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.772456,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.293797,-1.535000,24.384000>}
box{<0,0,-0.101600><17.521341,0.035000,0.101600> rotate<0,0.000000,0> translate<37.772456,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,55.931578>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.991875>}
box{<0,0,-0.101600><1.060297,0.035000,0.101600> rotate<0,90.000000,0> translate<37.785497,-1.535000,56.991875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.038281,-1.535000,56.083200>}
box{<0,0,-0.101600><3.252784,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.241481,-1.535000,56.286400>}
box{<0,0,-0.101600><3.455984,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.561472,-1.535000,56.489600>}
box{<0,0,-0.101600><15.775975,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.692800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.764672,-1.535000,56.692800>}
box{<0,0,-0.101600><15.979175,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.692800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.166884,-1.535000,56.896000>}
box{<0,0,-0.101600><16.381388,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.785497,-1.535000,56.991875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.398347,-1.535000,56.991875>}
box{<0,0,-0.101600><16.612850,0.035000,0.101600> rotate<0,0.000000,0> translate<37.785497,-1.535000,56.991875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.214813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.790784>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<37.794497,-1.535000,21.790784> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.407872,-1.535000,21.336000>}
box{<0,0,-0.101600><15.613375,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.611072,-1.535000,21.539200>}
box{<0,0,-0.101600><15.816575,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,21.742400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.814272,-1.535000,21.742400>}
box{<0,0,-0.101600><16.019775,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,21.742400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,23.754812>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,24.330784>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<37.794497,-1.535000,24.330784> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.290622,-1.535000,23.774400>}
box{<0,0,-0.101600><17.496125,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.291681,-1.535000,23.977600>}
box{<0,0,-0.101600><17.497184,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<37.794497,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.292741,-1.535000,24.180800>}
box{<0,0,-0.101600><17.498244,0.035000,0.101600> rotate<0,0.000000,0> translate<37.794497,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,47.895813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.866512,-1.535000,47.363684>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<38.646100,-1.535000,47.895813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,48.471784>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,47.895813>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<38.646100,-1.535000,47.895813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.646100,-1.535000,48.471784>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.866512,-1.535000,49.003913>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<38.646100,-1.535000,48.471784> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,53.658278>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.112178,-1.535000,53.360700>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<38.814600,-1.535000,53.658278> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,55.079119>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,53.658278>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,-90.000000,0> translate<38.814600,-1.535000,53.658278> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.814600,-1.535000,55.079119>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.112178,-1.535000,55.376697>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<38.814600,-1.535000,55.079119> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.866512,-1.535000,47.363684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.273784,-1.535000,46.956412>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<38.866512,-1.535000,47.363684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.866512,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.273784,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<38.866512,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,44.492213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.107813,-1.535000,43.960084>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<38.887400,-1.535000,44.492213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,45.068184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,44.492213>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<38.887400,-1.535000,44.492213> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<38.887400,-1.535000,45.068184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.107813,-1.535000,45.600313>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<38.887400,-1.535000,45.068184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.107813,-1.535000,43.960084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.515084,-1.535000,43.552813>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<39.107813,-1.535000,43.960084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.107813,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.515084,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<39.107813,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.112178,-1.535000,53.360700>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.933019,-1.535000,53.360700>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<39.112178,-1.535000,53.360700> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.112178,-1.535000,55.376697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.933019,-1.535000,55.376697>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<39.112178,-1.535000,55.376697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.273784,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.805913,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<39.273784,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.273784,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.805913,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<39.273784,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.515084,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.047213,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<39.515084,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.515084,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.047213,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<39.515084,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.805913,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.381884,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<39.805913,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<39.805913,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.381884,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<39.805913,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.047213,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.623184,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<40.047213,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.047213,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.623184,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<40.047213,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.381884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.914013,-1.535000,46.956412>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<40.381884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.381884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.123500,-1.535000,46.736000>}
box{<0,0,-0.101600><1.741616,0.035000,0.101600> rotate<0,0.000000,0> translate<40.381884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.381884,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.914013,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<40.381884,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.504522,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.763278,-1.535000,49.580800>}
box{<0,0,-0.101600><4.258756,0.035000,0.101600> rotate<0,0.000000,0> translate<40.504522,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.623184,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.155313,-1.535000,43.552813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<40.623184,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.623184,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.155313,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<40.623184,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.868466,-1.535000,46.126400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.881934,-1.535000,46.126400>}
box{<0,0,-0.101600><4.013469,0.035000,0.101600> rotate<0,0.000000,0> translate<40.868466,-1.535000,46.126400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.872456,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.793478,-1.535000,46.939200>}
box{<0,0,-0.101600><0.921022,0.035000,0.101600> rotate<0,0.000000,0> translate<40.872456,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.914013,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.321284,-1.535000,47.363684>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<40.914013,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.914013,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.321284,-1.535000,49.003913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<40.914013,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.933019,-1.535000,53.360700>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,53.442284>}
box{<0,0,-0.101600><0.115376,0.035000,0.101600> rotate<0,-44.998127,0> translate<40.933019,-1.535000,53.360700> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.933019,-1.535000,55.376697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,55.295113>}
box{<0,0,-0.101600><0.115376,0.035000,0.101600> rotate<0,44.998127,0> translate<40.933019,-1.535000,55.376697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.947597,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.320200,-1.535000,49.377600>}
box{<0,0,-0.101600><3.372603,0.035000,0.101600> rotate<0,0.000000,0> translate<40.947597,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<40.991112,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.104697,-1.535000,43.484800>}
box{<0,0,-0.101600><1.113584,0.035000,0.101600> rotate<0,0.000000,0> translate<40.991112,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.013916,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,53.441600>}
box{<0,0,-0.101600><0.000684,0.035000,0.101600> rotate<0,0.000000,0> translate<41.013916,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,52.677878>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.312178,-1.535000,52.380300>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<41.014600,-1.535000,52.677878> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,53.442284>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,52.677878>}
box{<0,0,-0.101600><0.764406,0.035000,0.101600> rotate<0,-90.000000,0> translate<41.014600,-1.535000,52.677878> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,56.059519>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,55.295113>}
box{<0,0,-0.101600><0.764406,0.035000,0.101600> rotate<0,-90.000000,0> translate<41.014600,-1.535000,55.295113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.014600,-1.535000,56.059519>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.312178,-1.535000,56.357097>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<41.014600,-1.535000,56.059519> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.100000,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.604775,-1.535000,47.142400>}
box{<0,0,-0.101600><0.504775,0.035000,0.101600> rotate<0,0.000000,0> translate<41.100000,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.150797,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.272391,-1.535000,49.174400>}
box{<0,0,-0.101600><1.121594,0.035000,0.101600> rotate<0,0.000000,0> translate<41.150797,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.155313,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.562584,-1.535000,43.960084>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<41.155313,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.155313,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.562584,-1.535000,45.600313>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<41.155313,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.239697,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.510700,-1.535000,45.923200>}
box{<0,0,-0.101600><3.271003,0.035000,0.101600> rotate<0,0.000000,0> translate<41.239697,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.290500,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.882984,-1.535000,43.688000>}
box{<0,0,-0.101600><0.592484,0.035000,0.101600> rotate<0,0.000000,0> translate<41.290500,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.303200,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.477700,-1.535000,47.345600>}
box{<0,0,-0.101600><0.174500,0.035000,0.101600> rotate<0,0.000000,0> translate<41.303200,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.312178,-1.535000,52.380300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.133019,-1.535000,52.380300>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<41.312178,-1.535000,52.380300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.312178,-1.535000,56.357097>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.133019,-1.535000,56.357097>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<41.312178,-1.535000,56.357097> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.321284,-1.535000,47.363684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.396653,-1.535000,47.545647>}
box{<0,0,-0.101600><0.196954,0.035000,0.101600> rotate<0,-67.496240,0> translate<41.321284,-1.535000,47.363684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.321284,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.503356,-1.535000,48.564344>}
box{<0,0,-0.101600><0.475784,0.035000,0.101600> rotate<0,67.495931,0> translate<41.321284,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.334834,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.863403,-1.535000,48.971200>}
box{<0,0,-0.101600><0.528569,0.035000,0.101600> rotate<0,0.000000,0> translate<41.334834,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.396653,-1.535000,47.545647>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.433406,-1.535000,47.432538>}
box{<0,0,-0.101600><0.118931,0.035000,0.101600> rotate<0,71.994487,0> translate<41.396653,-1.535000,47.545647> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.419003,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.641691,-1.535000,48.768000>}
box{<0,0,-0.101600><0.222687,0.035000,0.101600> rotate<0,0.000000,0> translate<41.419003,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.433406,-1.535000,47.432538>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.525975,-1.535000,47.250859>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,62.996062,0> translate<41.433406,-1.535000,47.432538> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.442897,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.364809,-1.535000,45.720000>}
box{<0,0,-0.101600><0.921912,0.035000,0.101600> rotate<0,0.000000,0> translate<41.442897,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.493700,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.744884,-1.535000,43.891200>}
box{<0,0,-0.101600><0.251184,0.035000,0.101600> rotate<0,0.000000,0> translate<41.493700,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.503169,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.503591,-1.535000,48.564800>}
box{<0,0,-0.101600><0.000422,0.035000,0.101600> rotate<0,0.000000,0> translate<41.503169,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.503356,-1.535000,48.564344>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.525975,-1.535000,48.608738>}
box{<0,0,-0.101600><0.049824,0.035000,0.101600> rotate<0,-62.996862,0> translate<41.503356,-1.535000,48.564344> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.525975,-1.535000,47.250859>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.645825,-1.535000,47.085903>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<41.525975,-1.535000,47.250859> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.525975,-1.535000,48.608738>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.645825,-1.535000,48.773694>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<41.525975,-1.535000,48.608738> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.562584,-1.535000,43.960084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.637953,-1.535000,44.142050>}
box{<0,0,-0.101600><0.196957,0.035000,0.101600> rotate<0,-67.496588,0> translate<41.562584,-1.535000,43.960084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.562584,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.744656,-1.535000,45.160741>}
box{<0,0,-0.101600><0.475787,0.035000,0.101600> rotate<0,67.496075,0> translate<41.562584,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.597178,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.034784,-1.535000,45.516800>}
box{<0,0,-0.101600><0.437606,0.035000,0.101600> rotate<0,0.000000,0> translate<41.597178,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.618216,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.653434,-1.535000,44.094400>}
box{<0,0,-0.101600><0.035219,0.035000,0.101600> rotate<0,0.000000,0> translate<41.618216,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.637953,-1.535000,44.142050>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.674706,-1.535000,44.028938>}
box{<0,0,-0.101600><0.118934,0.035000,0.101600> rotate<0,71.994952,0> translate<41.637953,-1.535000,44.142050> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.645825,-1.535000,47.085903>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.790003,-1.535000,46.941725>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<41.645825,-1.535000,47.085903> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.645825,-1.535000,48.773694>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.790003,-1.535000,48.917872>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<41.645825,-1.535000,48.773694> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.674706,-1.535000,44.028938>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.767275,-1.535000,43.847259>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,62.996062,0> translate<41.674706,-1.535000,44.028938> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.681344,-1.535000,45.313600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.846081,-1.535000,45.313600>}
box{<0,0,-0.101600><0.164738,0.035000,0.101600> rotate<0,0.000000,0> translate<41.681344,-1.535000,45.313600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.744656,-1.535000,45.160741>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.767275,-1.535000,45.205137>}
box{<0,0,-0.101600><0.049827,0.035000,0.101600> rotate<0,-62.998493,0> translate<41.744656,-1.535000,45.160741> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.767275,-1.535000,43.847259>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.887125,-1.535000,43.682303>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<41.767275,-1.535000,43.847259> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.767275,-1.535000,45.205137>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.887125,-1.535000,45.370094>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<41.767275,-1.535000,45.205137> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.790003,-1.535000,46.941725>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.954959,-1.535000,46.821875>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<41.790003,-1.535000,46.941725> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.790003,-1.535000,48.917872>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.954959,-1.535000,49.037722>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<41.790003,-1.535000,48.917872> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.887125,-1.535000,43.682303>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.031303,-1.535000,43.538125>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<41.887125,-1.535000,43.682303> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.887125,-1.535000,45.370094>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.031303,-1.535000,45.514272>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<41.887125,-1.535000,45.370094> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.954959,-1.535000,46.821875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.136637,-1.535000,46.729306>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<41.954959,-1.535000,46.821875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<41.954959,-1.535000,49.037722>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.136637,-1.535000,49.130291>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<41.954959,-1.535000,49.037722> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.031303,-1.535000,43.538125>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.196259,-1.535000,43.418275>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<42.031303,-1.535000,43.538125> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.031303,-1.535000,45.514272>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.196259,-1.535000,45.634122>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<42.031303,-1.535000,45.514272> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.136637,-1.535000,46.729306>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.330556,-1.535000,46.666297>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,17.999174,0> translate<42.136637,-1.535000,46.729306> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.136637,-1.535000,49.130291>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.330556,-1.535000,49.193300>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-17.999174,0> translate<42.136637,-1.535000,49.130291> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.196259,-1.535000,43.418275>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.377938,-1.535000,43.325706>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<42.196259,-1.535000,43.418275> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.196259,-1.535000,45.634122>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.377938,-1.535000,45.726691>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<42.196259,-1.535000,45.634122> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.330556,-1.535000,46.666297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.531947,-1.535000,46.634400>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,8.999332,0> translate<42.330556,-1.535000,46.666297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.330556,-1.535000,49.193300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.531947,-1.535000,49.225197>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,-8.999332,0> translate<42.330556,-1.535000,49.193300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.377938,-1.535000,43.325706>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.571856,-1.535000,43.262697>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,17.999174,0> translate<42.377938,-1.535000,43.325706> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.377938,-1.535000,45.726691>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.571856,-1.535000,45.789700>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-17.999174,0> translate<42.377938,-1.535000,45.726691> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.531947,-1.535000,46.634400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,46.634400>}
box{<0,0,-0.101600><0.000353,0.035000,0.101600> rotate<0,0.000000,0> translate<42.531947,-1.535000,46.634400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.531947,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,49.225197>}
box{<0,0,-0.101600><0.000353,0.035000,0.101600> rotate<0,0.000000,0> translate<42.531947,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,46.634400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.828184>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,90.000000,0> translate<42.532300,-1.535000,47.828184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,46.736000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,46.939200>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.142400>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.345600>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.548800>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.752000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,47.828184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.828184>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,47.828184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.031413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,49.225197>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,90.000000,0> translate<42.532300,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.031413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.031413>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.031413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.158400>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.361600>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.564800>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.768000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.971200>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.532300,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,49.174400>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.532300,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.571856,-1.535000,43.262697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773247,-1.535000,43.230800>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,8.999332,0> translate<42.571856,-1.535000,43.262697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.571856,-1.535000,45.789700>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773247,-1.535000,45.821597>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,-8.999332,0> translate<42.571856,-1.535000,45.789700> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,46.634400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735850,-1.535000,46.634400>}
box{<0,0,-0.101600><0.000356,0.035000,0.101600> rotate<0,0.000000,0> translate<42.735494,-1.535000,46.634400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,47.828184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,46.634400>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,-90.000000,0> translate<42.735494,-1.535000,46.634400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,48.031413>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,-90.000000,0> translate<42.735494,-1.535000,48.031413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735494,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735850,-1.535000,49.225197>}
box{<0,0,-0.101600><0.000356,0.035000,0.101600> rotate<0,0.000000,0> translate<42.735494,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735850,-1.535000,46.634400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.937241,-1.535000,46.666297>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,-8.999332,0> translate<42.735850,-1.535000,46.634400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.735850,-1.535000,49.225197>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.937241,-1.535000,49.193300>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,8.999332,0> translate<42.735850,-1.535000,49.225197> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773247,-1.535000,43.230800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.230800>}
box{<0,0,-0.101600><0.000353,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773247,-1.535000,43.230800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773247,-1.535000,45.821597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.821597>}
box{<0,0,-0.101600><0.000353,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773247,-1.535000,45.821597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.230800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.424584>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,90.000000,0> translate<42.773600,-1.535000,44.424584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.281600>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.484800>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.688000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.891200>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.094400>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.297600>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.424584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.424584>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.424584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.627813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.821597>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,90.000000,0> translate<42.773600,-1.535000,45.821597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.627813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.627813>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.627813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.704000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,44.907200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.907200>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,44.907200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.110400>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.313600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.313600>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,45.313600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.516800>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.773600,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.720000>}
box{<0,0,-0.101600><0.203194,0.035000,0.101600> rotate<0,0.000000,0> translate<42.773600,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.937241,-1.535000,46.666297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.131159,-1.535000,46.729306>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-17.999174,0> translate<42.937241,-1.535000,46.666297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.937241,-1.535000,49.193300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.131159,-1.535000,49.130291>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,17.999174,0> translate<42.937241,-1.535000,49.193300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.230800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.977150,-1.535000,43.230800>}
box{<0,0,-0.101600><0.000356,0.035000,0.101600> rotate<0,0.000000,0> translate<42.976794,-1.535000,43.230800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.424584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,43.230800>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,-90.000000,0> translate<42.976794,-1.535000,43.230800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.821597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,44.627813>}
box{<0,0,-0.101600><1.193784,0.035000,0.101600> rotate<0,-90.000000,0> translate<42.976794,-1.535000,44.627813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.976794,-1.535000,45.821597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.977150,-1.535000,45.821597>}
box{<0,0,-0.101600><0.000356,0.035000,0.101600> rotate<0,0.000000,0> translate<42.976794,-1.535000,45.821597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.977150,-1.535000,43.230800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.178541,-1.535000,43.262697>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,-8.999332,0> translate<42.977150,-1.535000,43.230800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.977150,-1.535000,45.821597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.178541,-1.535000,45.789700>}
box{<0,0,-0.101600><0.203901,0.035000,0.101600> rotate<0,8.999332,0> translate<42.977150,-1.535000,45.821597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<42.995409,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.117000,-1.535000,49.174400>}
box{<0,0,-0.101600><1.121591,0.035000,0.101600> rotate<0,0.000000,0> translate<42.995409,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.131159,-1.535000,46.729306>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.312838,-1.535000,46.821875>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<43.131159,-1.535000,46.729306> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.131159,-1.535000,49.130291>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.312838,-1.535000,49.037722>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<43.131159,-1.535000,49.130291> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.133019,-1.535000,52.380300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,52.677878>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<43.133019,-1.535000,52.380300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.133019,-1.535000,56.357097>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,56.059519>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<43.133019,-1.535000,56.357097> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.144294,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.885913,-1.535000,46.736000>}
box{<0,0,-0.101600><1.741619,0.035000,0.101600> rotate<0,0.000000,0> translate<43.144294,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.160616,-1.535000,54.368697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.098719>}
box{<0,0,-0.101600><0.381809,0.035000,0.101600> rotate<0,44.996699,0> translate<43.160616,-1.535000,54.368697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.160616,-1.535000,54.368697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.638678>}
box{<0,0,-0.101600><0.381811,0.035000,0.101600> rotate<0,-44.997030,0> translate<43.160616,-1.535000,54.368697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.178319,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.010578,-1.535000,52.425600>}
box{<0,0,-0.101600><4.832259,0.035000,0.101600> rotate<0,0.000000,0> translate<43.178319,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.178541,-1.535000,43.262697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.372459,-1.535000,43.325706>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-17.999174,0> translate<43.178541,-1.535000,43.262697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.178541,-1.535000,45.789700>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.372459,-1.535000,45.726691>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,17.999174,0> translate<43.178541,-1.535000,45.789700> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.203716,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.035981,-1.535000,56.286400>}
box{<0,0,-0.101600><4.832266,0.035000,0.101600> rotate<0,0.000000,0> translate<43.203716,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.236716,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.176638,-1.535000,43.281600>}
box{<0,0,-0.101600><3.939922,0.035000,0.101600> rotate<0,0.000000,0> translate<43.236716,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.249519,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,54.457600>}
box{<0,0,-0.101600><2.334181,0.035000,0.101600> rotate<0,0.000000,0> translate<43.249519,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.274916,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,54.254400>}
box{<0,0,-0.101600><2.308784,0.035000,0.101600> rotate<0,0.000000,0> translate<43.274916,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.312838,-1.535000,46.821875>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.477794,-1.535000,46.941725>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<43.312838,-1.535000,46.821875> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.312838,-1.535000,49.037722>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.477794,-1.535000,48.917872>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<43.312838,-1.535000,49.037722> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.372459,-1.535000,43.325706>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.554138,-1.535000,43.418275>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<43.372459,-1.535000,43.325706> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.372459,-1.535000,45.726691>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.554138,-1.535000,45.634122>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<43.372459,-1.535000,45.726691> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.381519,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.807378,-1.535000,52.628800>}
box{<0,0,-0.101600><4.425859,0.035000,0.101600> rotate<0,0.000000,0> translate<43.381519,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.385591,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.307500,-1.535000,45.720000>}
box{<0,0,-0.101600><0.921909,0.035000,0.101600> rotate<0,0.000000,0> translate<43.385591,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.404397,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.932966,-1.535000,48.971200>}
box{<0,0,-0.101600><0.528569,0.035000,0.101600> rotate<0,0.000000,0> translate<43.404397,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.406916,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.832781,-1.535000,56.083200>}
box{<0,0,-0.101600><4.425866,0.035000,0.101600> rotate<0,0.000000,0> translate<43.406916,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,52.677878>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.098719>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,90.000000,0> translate<43.430597,-1.535000,54.098719> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,52.832000>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,53.035200>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,53.238400>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.774978,-1.535000,53.441600>}
box{<0,0,-0.101600><2.344381,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,53.644800>}
box{<0,0,-0.101600><2.153103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,53.848000>}
box{<0,0,-0.101600><2.153103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,54.051200>}
box{<0,0,-0.101600><2.153103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.638678>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,56.059519>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,90.000000,0> translate<43.430597,-1.535000,56.059519> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,54.660800>}
box{<0,0,-0.101600><2.153103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,54.864000>}
box{<0,0,-0.101600><2.153103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.597181,-1.535000,55.067200>}
box{<0,0,-0.101600><2.166584,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.800381,-1.535000,55.270400>}
box{<0,0,-0.101600><2.369784,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.473600>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.676800>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.430597,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.880000>}
box{<0,0,-0.101600><4.353103,0.035000,0.101600> rotate<0,0.000000,0> translate<43.430597,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.474316,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.395338,-1.535000,46.939200>}
box{<0,0,-0.101600><0.921022,0.035000,0.101600> rotate<0,0.000000,0> translate<43.474316,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.477794,-1.535000,46.941725>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.621972,-1.535000,47.085903>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<43.477794,-1.535000,46.941725> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.477794,-1.535000,48.917872>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.621972,-1.535000,48.773694>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<43.477794,-1.535000,48.917872> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.554138,-1.535000,43.418275>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.719094,-1.535000,43.538125>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<43.554138,-1.535000,43.418275> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.554138,-1.535000,45.634122>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.719094,-1.535000,45.514272>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<43.554138,-1.535000,45.634122> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.621972,-1.535000,47.085903>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.741822,-1.535000,47.250859>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<43.621972,-1.535000,47.085903> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.621972,-1.535000,48.773694>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.741822,-1.535000,48.608738>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<43.621972,-1.535000,48.773694> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.626109,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.848800,-1.535000,48.768000>}
box{<0,0,-0.101600><0.222691,0.035000,0.101600> rotate<0,0.000000,0> translate<43.626109,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.645697,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.759281,-1.535000,43.484800>}
box{<0,0,-0.101600><1.113584,0.035000,0.101600> rotate<0,0.000000,0> translate<43.645697,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.663019,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.167797,-1.535000,47.142400>}
box{<0,0,-0.101600><0.504778,0.035000,0.101600> rotate<0,0.000000,0> translate<43.663019,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.715616,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.153222,-1.535000,45.516800>}
box{<0,0,-0.101600><0.437606,0.035000,0.101600> rotate<0,0.000000,0> translate<43.715616,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.719094,-1.535000,43.538125>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.863272,-1.535000,43.682303>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<43.719094,-1.535000,43.538125> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.719094,-1.535000,45.514272>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.863272,-1.535000,45.370094>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<43.719094,-1.535000,45.514272> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.741822,-1.535000,47.250859>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.834391,-1.535000,47.432538>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-62.996062,0> translate<43.741822,-1.535000,47.250859> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.741822,-1.535000,48.608738>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.764441,-1.535000,48.564341>}
box{<0,0,-0.101600><0.049827,0.035000,0.101600> rotate<0,62.998493,0> translate<43.741822,-1.535000,48.608738> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.764209,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.764631,-1.535000,48.564800>}
box{<0,0,-0.101600><0.000422,0.035000,0.101600> rotate<0,0.000000,0> translate<43.764209,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.764441,-1.535000,48.564341>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.946513,-1.535000,49.003913>}
box{<0,0,-0.101600><0.475787,0.035000,0.101600> rotate<0,-67.496075,0> translate<43.764441,-1.535000,48.564341> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.790094,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.964597,-1.535000,47.345600>}
box{<0,0,-0.101600><0.174503,0.035000,0.101600> rotate<0,0.000000,0> translate<43.790094,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.834391,-1.535000,47.432538>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.871144,-1.535000,47.545650>}
box{<0,0,-0.101600><0.118934,0.035000,0.101600> rotate<0,-71.994952,0> translate<43.834391,-1.535000,47.432538> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.863272,-1.535000,43.682303>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.983122,-1.535000,43.847259>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<43.863272,-1.535000,43.682303> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.863272,-1.535000,45.370094>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.983122,-1.535000,45.205137>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<43.863272,-1.535000,45.370094> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.867409,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.459897,-1.535000,43.688000>}
box{<0,0,-0.101600><0.592488,0.035000,0.101600> rotate<0,0.000000,0> translate<43.867409,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.871144,-1.535000,47.545650>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.946513,-1.535000,47.363684>}
box{<0,0,-0.101600><0.196957,0.035000,0.101600> rotate<0,67.496588,0> translate<43.871144,-1.535000,47.545650> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.904319,-1.535000,45.313600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.069056,-1.535000,45.313600>}
box{<0,0,-0.101600><0.164738,0.035000,0.101600> rotate<0,0.000000,0> translate<43.904319,-1.535000,45.313600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.946513,-1.535000,47.363684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.353784,-1.535000,46.956412>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<43.946513,-1.535000,47.363684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.946513,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.353784,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<43.946513,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.983122,-1.535000,43.847259>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.075691,-1.535000,44.028938>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-62.996062,0> translate<43.983122,-1.535000,43.847259> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<43.983122,-1.535000,45.205137>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.005741,-1.535000,45.160741>}
box{<0,0,-0.101600><0.049827,0.035000,0.101600> rotate<0,62.998493,0> translate<43.983122,-1.535000,45.205137> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.005509,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.256697,-1.535000,43.891200>}
box{<0,0,-0.101600><0.251188,0.035000,0.101600> rotate<0,0.000000,0> translate<44.005509,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.005741,-1.535000,45.160741>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.187812,-1.535000,45.600313>}
box{<0,0,-0.101600><0.475787,0.035000,0.101600> rotate<0,-67.496075,0> translate<44.005741,-1.535000,45.160741> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.075691,-1.535000,44.028938>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.112444,-1.535000,44.142050>}
box{<0,0,-0.101600><0.118934,0.035000,0.101600> rotate<0,-71.994952,0> translate<44.075691,-1.535000,44.028938> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.096959,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.132178,-1.535000,44.094400>}
box{<0,0,-0.101600><0.035219,0.035000,0.101600> rotate<0,0.000000,0> translate<44.096959,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.112444,-1.535000,44.142050>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.187812,-1.535000,43.960084>}
box{<0,0,-0.101600><0.196957,0.035000,0.101600> rotate<0,67.496588,0> translate<44.112444,-1.535000,44.142050> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.187812,-1.535000,43.960084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.595084,-1.535000,43.552813>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<44.187812,-1.535000,43.960084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.187812,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.595084,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<44.187812,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.353784,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.885913,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<44.353784,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.353784,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.885913,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<44.353784,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.595084,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.127212,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<44.595084,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.595084,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.127212,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<44.595084,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.653153,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.963031,-1.535000,19.507200>}
box{<0,0,-0.101600><8.309878,0.035000,0.101600> rotate<0,0.000000,0> translate<44.653153,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.885913,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.461884,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<44.885913,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<44.885913,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.461884,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<44.885913,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.127212,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.703184,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<45.127212,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.127212,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.703184,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<45.127212,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.461884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.994013,-1.535000,46.956412>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<45.461884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.461884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.860197,-1.535000,46.736000>}
box{<0,0,-0.101600><1.398312,0.035000,0.101600> rotate<0,0.000000,0> translate<45.461884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.461884,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.994013,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<45.461884,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,53.632878>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.881278,-1.535000,53.335300>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<45.583700,-1.535000,53.632878> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,55.053719>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,53.632878>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,-90.000000,0> translate<45.583700,-1.535000,53.632878> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.583700,-1.535000,55.053719>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.881278,-1.535000,55.351297>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<45.583700,-1.535000,55.053719> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.584522,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.843278,-1.535000,49.580800>}
box{<0,0,-0.101600><4.258756,0.035000,0.101600> rotate<0,0.000000,0> translate<45.584522,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.703184,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.235312,-1.535000,43.552813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<45.703184,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.703184,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.235312,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<45.703184,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.881278,-1.535000,53.335300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.702119,-1.535000,53.335300>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<45.881278,-1.535000,53.335300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.881278,-1.535000,55.351297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.702119,-1.535000,55.351297>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<45.881278,-1.535000,55.351297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.948466,-1.535000,46.126400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.961934,-1.535000,46.126400>}
box{<0,0,-0.101600><4.013469,0.035000,0.101600> rotate<0,0.000000,0> translate<45.948466,-1.535000,46.126400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.952456,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.656997,-1.535000,46.939200>}
box{<0,0,-0.101600><0.704541,0.035000,0.101600> rotate<0,0.000000,0> translate<45.952456,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.994013,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.387156,-1.535000,47.349559>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<45.994013,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<45.994013,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.401284,-1.535000,49.003913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<45.994013,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.027597,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.400200,-1.535000,49.377600>}
box{<0,0,-0.101600><3.372603,0.035000,0.101600> rotate<0,0.000000,0> translate<46.027597,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.071113,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.949097,-1.535000,43.484800>}
box{<0,0,-0.101600><0.877984,0.035000,0.101600> rotate<0,0.000000,0> translate<46.071113,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.179997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.472959,-1.535000,47.142400>}
box{<0,0,-0.101600><0.292963,0.035000,0.101600> rotate<0,0.000000,0> translate<46.179997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.230797,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.935350,-1.535000,49.174400>}
box{<0,0,-0.101600><0.704553,0.035000,0.101600> rotate<0,0.000000,0> translate<46.230797,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.235312,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.628456,-1.535000,43.945959>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<46.235312,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.235312,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.642584,-1.535000,45.600313>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<46.235312,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.319697,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.544578,-1.535000,45.923200>}
box{<0,0,-0.101600><1.224881,0.035000,0.101600> rotate<0,0.000000,0> translate<46.319697,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.370497,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.745897,-1.535000,43.688000>}
box{<0,0,-0.101600><0.375400,0.035000,0.101600> rotate<0,0.000000,0> translate<46.370497,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.383197,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.388794,-1.535000,47.345600>}
box{<0,0,-0.101600><0.005597,0.035000,0.101600> rotate<0,0.000000,0> translate<46.383197,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.387156,-1.535000,47.349559>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.486513,-1.535000,47.109684>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<46.387156,-1.535000,47.349559> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.401284,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.500641,-1.535000,48.764038>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<46.401284,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.414834,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.707803,-1.535000,48.971200>}
box{<0,0,-0.101600><0.292969,0.035000,0.101600> rotate<0,0.000000,0> translate<46.414834,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.486513,-1.535000,47.109684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.893784,-1.535000,46.702413>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<46.486513,-1.535000,47.109684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.499000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.504603,-1.535000,48.768000>}
box{<0,0,-0.101600><0.005603,0.035000,0.101600> rotate<0,0.000000,0> translate<46.499000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.500641,-1.535000,48.764038>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.893784,-1.535000,49.157184>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<46.500641,-1.535000,48.764038> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.522897,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.101503,-1.535000,45.720000>}
box{<0,0,-0.101600><0.578606,0.035000,0.101600> rotate<0,0.000000,0> translate<46.522897,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.573697,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.651138,-1.535000,43.891200>}
box{<0,0,-0.101600><0.077441,0.035000,0.101600> rotate<0,0.000000,0> translate<46.573697,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.628456,-1.535000,43.945959>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.727812,-1.535000,43.706084>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<46.628456,-1.535000,43.945959> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.642584,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.741941,-1.535000,45.360438>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<46.642584,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.677178,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.898303,-1.535000,45.516800>}
box{<0,0,-0.101600><0.221125,0.035000,0.101600> rotate<0,0.000000,0> translate<46.677178,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.727812,-1.535000,43.706084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.135084,-1.535000,43.298813>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<46.727812,-1.535000,43.706084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.741941,-1.535000,45.360438>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.135084,-1.535000,45.753584>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<46.741941,-1.535000,45.360438> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.893784,-1.535000,46.702413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.425913,-1.535000,46.482000>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<46.893784,-1.535000,46.702413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<46.893784,-1.535000,49.157184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.425913,-1.535000,49.377597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<46.893784,-1.535000,49.157184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.135084,-1.535000,43.298813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.667213,-1.535000,43.078400>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<47.135084,-1.535000,43.298813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.135084,-1.535000,45.753584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.667213,-1.535000,45.973997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<47.135084,-1.535000,45.753584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.425913,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.001884,-1.535000,46.482000>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<47.425913,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.425913,-1.535000,49.377597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.001884,-1.535000,49.377597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<47.425913,-1.535000,49.377597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.667213,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.243184,-1.535000,43.078400>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<47.667213,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.667213,-1.535000,45.973997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.243184,-1.535000,45.973997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<47.667213,-1.535000,45.973997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.702119,-1.535000,53.335300>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,53.416884>}
box{<0,0,-0.101600><0.115376,0.035000,0.101600> rotate<0,-44.998127,0> translate<47.702119,-1.535000,53.335300> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.702119,-1.535000,55.351297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.269713>}
box{<0,0,-0.101600><0.115376,0.035000,0.101600> rotate<0,44.998127,0> translate<47.702119,-1.535000,55.351297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783016,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.270400>}
box{<0,0,-0.101600><0.000684,0.035000,0.101600> rotate<0,0.000000,0> translate<47.783016,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,52.652478>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.081278,-1.535000,52.354900>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<47.783700,-1.535000,52.652478> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,53.416884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,52.652478>}
box{<0,0,-0.101600><0.764406,0.035000,0.101600> rotate<0,-90.000000,0> translate<47.783700,-1.535000,52.652478> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,56.034119>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,55.269713>}
box{<0,0,-0.101600><0.764406,0.035000,0.101600> rotate<0,-90.000000,0> translate<47.783700,-1.535000,55.269713> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<47.783700,-1.535000,56.034119>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.081278,-1.535000,56.331697>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<47.783700,-1.535000,56.034119> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.001884,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.534013,-1.535000,46.702413>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<48.001884,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.001884,-1.535000,49.377597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.534013,-1.535000,49.157184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<48.001884,-1.535000,49.377597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.081278,-1.535000,52.354900>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.902119,-1.535000,52.354900>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<48.081278,-1.535000,52.354900> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.081278,-1.535000,56.331697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.902119,-1.535000,56.331697>}
box{<0,0,-0.101600><1.820841,0.035000,0.101600> rotate<0,0.000000,0> translate<48.081278,-1.535000,56.331697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.124525,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.383269,-1.535000,46.532800>}
box{<0,0,-0.101600><4.258744,0.035000,0.101600> rotate<0,0.000000,0> translate<48.124525,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.243184,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.775313,-1.535000,43.298813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<48.243184,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.243184,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.747213,-1.535000,43.078400>}
box{<0,0,-0.101600><4.504028,0.035000,0.101600> rotate<0,0.000000,0> translate<48.243184,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.243184,-1.535000,45.973997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.775313,-1.535000,45.753584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<48.243184,-1.535000,45.973997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.365822,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.590700,-1.535000,45.923200>}
box{<0,0,-0.101600><1.224878,0.035000,0.101600> rotate<0,0.000000,0> translate<48.365822,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.492450,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.197000,-1.535000,49.174400>}
box{<0,0,-0.101600><0.704550,0.035000,0.101600> rotate<0,0.000000,0> translate<48.492450,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.534013,-1.535000,46.702413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.941284,-1.535000,47.109684>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<48.534013,-1.535000,46.702413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.534013,-1.535000,49.157184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.927156,-1.535000,48.764038>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,44.997258,0> translate<48.534013,-1.535000,49.157184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.567600,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.965913,-1.535000,46.736000>}
box{<0,0,-0.101600><1.398312,0.035000,0.101600> rotate<0,0.000000,0> translate<48.567600,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.719997,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.012966,-1.535000,48.971200>}
box{<0,0,-0.101600><0.292969,0.035000,0.101600> rotate<0,0.000000,0> translate<48.719997,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.733756,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.256638,-1.535000,43.281600>}
box{<0,0,-0.101600><3.522881,0.035000,0.101600> rotate<0,0.000000,0> translate<48.733756,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.770800,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.475338,-1.535000,46.939200>}
box{<0,0,-0.101600><0.704538,0.035000,0.101600> rotate<0,0.000000,0> translate<48.770800,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.775313,-1.535000,43.298813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.182584,-1.535000,43.706084>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<48.775313,-1.535000,43.298813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.775313,-1.535000,45.753584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.168456,-1.535000,45.360438>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,44.997258,0> translate<48.775313,-1.535000,45.753584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.808897,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.387500,-1.535000,45.720000>}
box{<0,0,-0.101600><0.578603,0.035000,0.101600> rotate<0,0.000000,0> translate<48.808897,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.923197,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.928800,-1.535000,48.768000>}
box{<0,0,-0.101600><0.005603,0.035000,0.101600> rotate<0,0.000000,0> translate<48.923197,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.927156,-1.535000,48.764038>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.026513,-1.535000,49.003913>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,-67.496203,0> translate<48.927156,-1.535000,48.764038> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.941284,-1.535000,47.109684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.040641,-1.535000,47.349559>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,-67.496203,0> translate<48.941284,-1.535000,47.109684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.954834,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.247797,-1.535000,47.142400>}
box{<0,0,-0.101600><0.292963,0.035000,0.101600> rotate<0,0.000000,0> translate<48.954834,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<48.961300,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.839281,-1.535000,43.484800>}
box{<0,0,-0.101600><0.877981,0.035000,0.101600> rotate<0,0.000000,0> translate<48.961300,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.012097,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.233222,-1.535000,45.516800>}
box{<0,0,-0.101600><0.221125,0.035000,0.101600> rotate<0,0.000000,0> translate<49.012097,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.026513,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.433784,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.026513,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.039000,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.044597,-1.535000,47.345600>}
box{<0,0,-0.101600><0.005597,0.035000,0.101600> rotate<0,0.000000,0> translate<49.039000,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.040641,-1.535000,47.349559>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.433784,-1.535000,46.956412>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,44.997258,0> translate<49.040641,-1.535000,47.349559> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.164500,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.539897,-1.535000,43.688000>}
box{<0,0,-0.101600><0.375397,0.035000,0.101600> rotate<0,0.000000,0> translate<49.164500,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.168456,-1.535000,45.360438>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.267813,-1.535000,45.600313>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,-67.496203,0> translate<49.168456,-1.535000,45.360438> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,28.512013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.392613,-1.535000,27.979884>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<49.172200,-1.535000,28.512013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,29.087984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,28.512013>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<49.172200,-1.535000,28.512013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.172200,-1.535000,29.087984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.392613,-1.535000,29.620113>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<49.172200,-1.535000,29.087984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.182584,-1.535000,43.706084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.281941,-1.535000,43.945959>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,-67.496203,0> translate<49.182584,-1.535000,43.706084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,25.692013>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.442613,-1.535000,25.159884>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<49.222200,-1.535000,25.692013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,26.267984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,25.692013>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,-90.000000,0> translate<49.222200,-1.535000,25.692013> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.222200,-1.535000,26.267984>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.442613,-1.535000,26.800113>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<49.222200,-1.535000,26.267984> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.259256,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.336697,-1.535000,43.891200>}
box{<0,0,-0.101600><0.077441,0.035000,0.101600> rotate<0,0.000000,0> translate<49.259256,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.267813,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.675084,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.267813,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.281941,-1.535000,43.945959>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.675084,-1.535000,43.552813>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,44.997258,0> translate<49.281941,-1.535000,43.945959> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.392613,-1.535000,27.979884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.799884,-1.535000,27.572613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<49.392613,-1.535000,27.979884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.392613,-1.535000,29.620113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.799884,-1.535000,30.027384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.392613,-1.535000,29.620113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.433784,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.965913,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<49.433784,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.433784,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.965913,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<49.433784,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.442613,-1.535000,25.159884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.849884,-1.535000,24.752613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<49.442613,-1.535000,25.159884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.442613,-1.535000,26.800113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.849884,-1.535000,27.207384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.442613,-1.535000,26.800113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.675084,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.207213,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<49.675084,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.675084,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.207213,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<49.675084,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.799884,-1.535000,27.572613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.265763,-1.535000,27.379644>}
box{<0,0,-0.101600><0.504261,0.035000,0.101600> rotate<0,22.498065,0> translate<49.799884,-1.535000,27.572613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.799884,-1.535000,30.027384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.332013,-1.535000,30.247797>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<49.799884,-1.535000,30.027384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.849884,-1.535000,24.752613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.382013,-1.535000,24.532200>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<49.849884,-1.535000,24.752613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.849884,-1.535000,27.207384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.265763,-1.535000,27.379644>}
box{<0,0,-0.101600><0.450142,0.035000,0.101600> rotate<0,-22.498164,0> translate<49.849884,-1.535000,27.207384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.902119,-1.535000,52.354900>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,52.652478>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.902119,-1.535000,52.354900> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.902119,-1.535000,56.331697>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,56.034119>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<49.902119,-1.535000,56.331697> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.929716,-1.535000,54.343297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.073319>}
box{<0,0,-0.101600><0.381809,0.035000,0.101600> rotate<0,44.996699,0> translate<49.929716,-1.535000,54.343297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.929716,-1.535000,54.343297>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.613278>}
box{<0,0,-0.101600><0.381811,0.035000,0.101600> rotate<0,-44.997030,0> translate<49.929716,-1.535000,54.343297> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.947416,-1.535000,56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.358272,-1.535000,56.286400>}
box{<0,0,-0.101600><3.410856,0.035000,0.101600> rotate<0,0.000000,0> translate<49.947416,-1.535000,56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.965913,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.541884,-1.535000,46.736000>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<49.965913,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.965913,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.541884,-1.535000,49.631597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<49.965913,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<49.972819,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.439894,-1.535000,52.425600>}
box{<0,0,-0.101600><5.467075,0.035000,0.101600> rotate<0,0.000000,0> translate<49.972819,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.018616,-1.535000,54.254400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.067744,-1.535000,54.254400>}
box{<0,0,-0.101600><3.049128,0.035000,0.101600> rotate<0,0.000000,0> translate<50.018616,-1.535000,54.254400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.044019,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.983575,-1.535000,54.457600>}
box{<0,0,-0.101600><2.939556,0.035000,0.101600> rotate<0,0.000000,0> translate<50.044019,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.150616,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.207584,-1.535000,56.083200>}
box{<0,0,-0.101600><3.056969,0.035000,0.101600> rotate<0,0.000000,0> translate<50.150616,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.176019,-1.535000,52.628800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.440953,-1.535000,52.628800>}
box{<0,0,-0.101600><5.264934,0.035000,0.101600> rotate<0,0.000000,0> translate<50.176019,-1.535000,52.628800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,52.652478>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.073319>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,90.000000,0> translate<50.199697,-1.535000,54.073319> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.442013,-1.535000,52.832000>}
box{<0,0,-0.101600><5.242316,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,53.035200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.332966,-1.535000,53.035200>}
box{<0,0,-0.101600><4.133269,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,53.035200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.842400,-1.535000,53.238400>}
box{<0,0,-0.101600><3.642703,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.630269,-1.535000,53.441600>}
box{<0,0,-0.101600><3.430572,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.427069,-1.535000,53.644800>}
box{<0,0,-0.101600><3.227372,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.236078,-1.535000,53.848000>}
box{<0,0,-0.101600><3.036381,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.151909,-1.535000,54.051200>}
box{<0,0,-0.101600><2.952213,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.613278>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,56.034119>}
box{<0,0,-0.101600><1.420841,0.035000,0.101600> rotate<0,90.000000,0> translate<50.199697,-1.535000,56.034119> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.660800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,54.660800>}
box{<0,0,-0.101600><2.729803,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,54.660800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,54.864000>}
box{<0,0,-0.101600><2.729803,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,55.067200>}
box{<0,0,-0.101600><2.729803,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,55.270400>}
box{<0,0,-0.101600><2.729803,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.955081,-1.535000,55.473600>}
box{<0,0,-0.101600><2.755384,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.039250,-1.535000,55.676800>}
box{<0,0,-0.101600><2.839553,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.199697,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.123416,-1.535000,55.880000>}
box{<0,0,-0.101600><2.923719,0.035000,0.101600> rotate<0,0.000000,0> translate<50.199697,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.207213,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.783184,-1.535000,43.332400>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<50.207213,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.207213,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.783184,-1.535000,46.227997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<50.207213,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.332013,-1.535000,30.247797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.907984,-1.535000,30.247797>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<50.332013,-1.535000,30.247797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.382013,-1.535000,24.532200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.957984,-1.535000,24.532200>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<50.382013,-1.535000,24.532200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.541884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.074013,-1.535000,46.956412>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<50.541884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.541884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.940197,-1.535000,46.736000>}
box{<0,0,-0.101600><1.398313,0.035000,0.101600> rotate<0,0.000000,0> translate<50.541884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.541884,-1.535000,49.631597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.074013,-1.535000,49.411184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<50.541884,-1.535000,49.631597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.664522,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.425072,-1.535000,49.580800>}
box{<0,0,-0.101600><4.760550,0.035000,0.101600> rotate<0,0.000000,0> translate<50.664522,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.783184,-1.535000,43.332400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.315313,-1.535000,43.552813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<50.783184,-1.535000,43.332400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.783184,-1.535000,46.227997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.315313,-1.535000,46.007584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<50.783184,-1.535000,46.227997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.907984,-1.535000,30.247797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.440113,-1.535000,30.027384>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<50.907984,-1.535000,30.247797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<50.957984,-1.535000,24.532200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.490113,-1.535000,24.752613>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<50.957984,-1.535000,24.532200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.028466,-1.535000,46.126400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.407075,-1.535000,46.126400>}
box{<0,0,-0.101600><4.378609,0.035000,0.101600> rotate<0,0.000000,0> translate<51.028466,-1.535000,46.126400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.032456,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.736997,-1.535000,46.939200>}
box{<0,0,-0.101600><0.704541,0.035000,0.101600> rotate<0,0.000000,0> translate<51.032456,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.074013,-1.535000,46.956412>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.467156,-1.535000,47.349559>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<51.074013,-1.535000,46.956412> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.074013,-1.535000,49.411184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.481284,-1.535000,49.003913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.074013,-1.535000,49.411184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.090766,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.789228,-1.535000,24.587200>}
box{<0,0,-0.101600><1.698462,0.035000,0.101600> rotate<0,0.000000,0> translate<51.090766,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.107597,-1.535000,49.377600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.424016,-1.535000,49.377600>}
box{<0,0,-0.101600><4.316419,0.035000,0.101600> rotate<0,0.000000,0> translate<51.107597,-1.535000,49.377600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.151113,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.029097,-1.535000,43.484800>}
box{<0,0,-0.101600><0.877984,0.035000,0.101600> rotate<0,0.000000,0> translate<51.151113,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.259997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.552959,-1.535000,47.142400>}
box{<0,0,-0.101600><0.292962,0.035000,0.101600> rotate<0,0.000000,0> translate<51.259997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.310797,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.015350,-1.535000,49.174400>}
box{<0,0,-0.101600><0.704553,0.035000,0.101600> rotate<0,0.000000,0> translate<51.310797,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.315313,-1.535000,43.552813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.708456,-1.535000,43.945959>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<51.315313,-1.535000,43.552813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.315313,-1.535000,46.007584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.722584,-1.535000,45.600313>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.315313,-1.535000,46.007584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.328538,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.451463,-1.535000,30.073600>}
box{<0,0,-0.101600><1.122925,0.035000,0.101600> rotate<0,0.000000,0> translate<51.328538,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.399697,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.624578,-1.535000,45.923200>}
box{<0,0,-0.101600><1.224881,0.035000,0.101600> rotate<0,0.000000,0> translate<51.399697,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.440113,-1.535000,30.027384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.847384,-1.535000,29.620113>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.440113,-1.535000,30.027384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.450497,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.825897,-1.535000,43.688000>}
box{<0,0,-0.101600><0.375400,0.035000,0.101600> rotate<0,0.000000,0> translate<51.450497,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.463197,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.468794,-1.535000,47.345600>}
box{<0,0,-0.101600><0.005597,0.035000,0.101600> rotate<0,0.000000,0> translate<51.463197,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.467156,-1.535000,47.349559>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.566513,-1.535000,47.109684>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<51.467156,-1.535000,47.349559> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.481284,-1.535000,49.003913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.580641,-1.535000,48.764038>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<51.481284,-1.535000,49.003913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.490113,-1.535000,24.752613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.897384,-1.535000,25.159884>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<51.490113,-1.535000,24.752613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.494834,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.787803,-1.535000,48.971200>}
box{<0,0,-0.101600><0.292969,0.035000,0.101600> rotate<0,0.000000,0> translate<51.494834,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.527900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.352097,-1.535000,24.790400>}
box{<0,0,-0.101600><0.824197,0.035000,0.101600> rotate<0,0.000000,0> translate<51.527900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.566513,-1.535000,47.109684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.973784,-1.535000,46.702413>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.566513,-1.535000,47.109684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.579000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.584603,-1.535000,48.768000>}
box{<0,0,-0.101600><0.005603,0.035000,0.101600> rotate<0,0.000000,0> translate<51.579000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.580641,-1.535000,48.764038>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.973784,-1.535000,49.157184>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<51.580641,-1.535000,48.764038> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.597097,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.182900,-1.535000,29.870400>}
box{<0,0,-0.101600><0.585803,0.035000,0.101600> rotate<0,0.000000,0> translate<51.597097,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.602897,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.181503,-1.535000,45.720000>}
box{<0,0,-0.101600><0.578606,0.035000,0.101600> rotate<0,0.000000,0> translate<51.602897,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.653697,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.731138,-1.535000,43.891200>}
box{<0,0,-0.101600><0.077441,0.035000,0.101600> rotate<0,0.000000,0> translate<51.653697,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.708456,-1.535000,43.945959>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.807813,-1.535000,43.706084>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<51.708456,-1.535000,43.945959> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.722584,-1.535000,45.600313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.821941,-1.535000,45.360438>}
box{<0,0,-0.101600><0.259638,0.035000,0.101600> rotate<0,67.496203,0> translate<51.722584,-1.535000,45.600313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.731100,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.148897,-1.535000,24.993600>}
box{<0,0,-0.101600><0.417797,0.035000,0.101600> rotate<0,0.000000,0> translate<51.731100,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.757178,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.978303,-1.535000,45.516800>}
box{<0,0,-0.101600><0.221125,0.035000,0.101600> rotate<0,0.000000,0> translate<51.757178,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.800297,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.979700,-1.535000,29.667200>}
box{<0,0,-0.101600><0.179403,0.035000,0.101600> rotate<0,0.000000,0> translate<51.800297,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.807813,-1.535000,43.706084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.215084,-1.535000,43.298813>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.807813,-1.535000,43.706084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.821941,-1.535000,45.360438>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.215084,-1.535000,45.753584>}
box{<0,0,-0.101600><0.555991,0.035000,0.101600> rotate<0,-44.997258,0> translate<51.821941,-1.535000,45.360438> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.847384,-1.535000,29.620113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.889997,-1.535000,29.517228>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,67.497258,0> translate<51.847384,-1.535000,29.620113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.889997,-1.535000,29.517228>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.932613,-1.535000,29.620113>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,-67.495773,0> translate<51.889997,-1.535000,29.517228> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.897384,-1.535000,25.159884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.939997,-1.535000,25.262769>}
box{<0,0,-0.101600><0.111360,0.035000,0.101600> rotate<0,-67.497258,0> translate<51.897384,-1.535000,25.159884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.912672,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.967319,-1.535000,25.196800>}
box{<0,0,-0.101600><0.054647,0.035000,0.101600> rotate<0,0.000000,0> translate<51.912672,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.932613,-1.535000,29.620113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.339884,-1.535000,30.027384>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<51.932613,-1.535000,29.620113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.939997,-1.535000,25.262769>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.982613,-1.535000,25.159884>}
box{<0,0,-0.101600><0.111361,0.035000,0.101600> rotate<0,67.495773,0> translate<51.939997,-1.535000,25.262769> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.973784,-1.535000,46.702413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.505913,-1.535000,46.482000>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<51.973784,-1.535000,46.702413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.973784,-1.535000,49.157184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.505913,-1.535000,49.377597>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<51.973784,-1.535000,49.157184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<51.982613,-1.535000,25.159884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.389884,-1.535000,24.752613>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<51.982613,-1.535000,25.159884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.215084,-1.535000,43.298813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.747213,-1.535000,43.078400>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<52.215084,-1.535000,43.298813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.215084,-1.535000,45.753584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.747213,-1.535000,45.973997>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<52.215084,-1.535000,45.753584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.339884,-1.535000,30.027384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.872013,-1.535000,30.247797>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<52.339884,-1.535000,30.027384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.389884,-1.535000,24.752613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.922013,-1.535000,24.532200>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<52.389884,-1.535000,24.752613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.505913,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.081884,-1.535000,46.482000>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.505913,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.505913,-1.535000,49.377597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.081884,-1.535000,49.377597>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.505913,-1.535000,49.377597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.724753,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.047200,-1.535000,19.304000>}
box{<0,0,-0.101600><0.322447,0.035000,0.101600> rotate<0,0.000000,0> translate<52.724753,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.747213,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.323184,-1.535000,43.078400>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.747213,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.747213,-1.535000,45.973997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.323184,-1.535000,45.973997>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.747213,-1.535000,45.973997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.872013,-1.535000,30.247797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.447984,-1.535000,30.247797>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.872013,-1.535000,30.247797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.922013,-1.535000,24.532200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.497984,-1.535000,24.532200>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,0.000000,0> translate<52.922013,-1.535000,24.532200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,19.588150>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.050600,-1.535000,19.295797>}
box{<0,0,-0.101600><0.316442,0.035000,0.101600> rotate<0,67.494981,0> translate<52.929500,-1.535000,19.588150> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,20.411847>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,19.588150>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-90.000000,0> translate<52.929500,-1.535000,19.588150> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,20.411847>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,21.172844>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-67.495520,0> translate<52.929500,-1.535000,20.411847> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,54.588150>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,53.827153>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,67.495520,0> translate<52.929500,-1.535000,54.588150> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,55.411847>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,54.588150>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-90.000000,0> translate<52.929500,-1.535000,54.588150> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<52.929500,-1.535000,55.411847>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,56.172844>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-67.495520,0> translate<52.929500,-1.535000,55.411847> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.081884,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.614013,-1.535000,46.702413>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<53.081884,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.081884,-1.535000,49.377597>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.614013,-1.535000,49.157184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<53.081884,-1.535000,49.377597> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.204525,-1.535000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.409194,-1.535000,46.532800>}
box{<0,0,-0.101600><2.204669,0.035000,0.101600> rotate<0,0.000000,0> translate<53.204525,-1.535000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,21.172844>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,21.755281>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,-44.997030,0> translate<53.244716,-1.535000,21.172844> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,53.827153>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,53.244716>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,44.997030,0> translate<53.244716,-1.535000,53.827153> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.244716,-1.535000,56.172844>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,56.755281>}
box{<0,0,-0.101600><0.823691,0.035000,0.101600> rotate<0,-44.997030,0> translate<53.244716,-1.535000,56.172844> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.323184,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.855313,-1.535000,43.298813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<53.323184,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.323184,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.391194,-1.535000,43.078400>}
box{<0,0,-0.101600><2.068009,0.035000,0.101600> rotate<0,0.000000,0> translate<53.323184,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.323184,-1.535000,45.973997>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.855313,-1.535000,45.753584>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<53.323184,-1.535000,45.973997> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.445822,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.406016,-1.535000,45.923200>}
box{<0,0,-0.101600><1.960194,0.035000,0.101600> rotate<0,0.000000,0> translate<53.445822,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.447984,-1.535000,30.247797>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.980113,-1.535000,30.027384>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,22.498314,0> translate<53.447984,-1.535000,30.247797> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.497984,-1.535000,24.532200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.030113,-1.535000,24.752613>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-22.498314,0> translate<53.497984,-1.535000,24.532200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.572450,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.422956,-1.535000,49.174400>}
box{<0,0,-0.101600><1.850506,0.035000,0.101600> rotate<0,0.000000,0> translate<53.572450,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.614013,-1.535000,46.702413>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.021284,-1.535000,47.109684>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<53.614013,-1.535000,46.702413> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.614013,-1.535000,49.157184>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.021284,-1.535000,48.749913>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<53.614013,-1.535000,49.157184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.630766,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.294856,-1.535000,24.587200>}
box{<0,0,-0.101600><1.664091,0.035000,0.101600> rotate<0,0.000000,0> translate<53.630766,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.647600,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.410250,-1.535000,46.736000>}
box{<0,0,-0.101600><1.762650,0.035000,0.101600> rotate<0,0.000000,0> translate<53.647600,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.799997,-1.535000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.421897,-1.535000,48.971200>}
box{<0,0,-0.101600><1.621900,0.035000,0.101600> rotate<0,0.000000,0> translate<53.799997,-1.535000,48.971200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.813756,-1.535000,43.281600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.392253,-1.535000,43.281600>}
box{<0,0,-0.101600><1.578497,0.035000,0.101600> rotate<0,0.000000,0> translate<53.813756,-1.535000,43.281600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,21.755281>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.588150,-1.535000,22.070497>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,-22.498541,0> translate<53.827153,-1.535000,21.755281> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,53.244716>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.588150,-1.535000,52.929500>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,22.498541,0> translate<53.827153,-1.535000,53.244716> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.827153,-1.535000,56.755281>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.398347,-1.535000,56.991875>}
box{<0,0,-0.101600><0.618255,0.035000,0.101600> rotate<0,-22.498306,0> translate<53.827153,-1.535000,56.755281> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.850800,-1.535000,46.939200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.411309,-1.535000,46.939200>}
box{<0,0,-0.101600><1.560509,0.035000,0.101600> rotate<0,0.000000,0> translate<53.850800,-1.535000,46.939200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.855313,-1.535000,43.298813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.262584,-1.535000,43.706084>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<53.855313,-1.535000,43.298813> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.855313,-1.535000,45.753584>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.262584,-1.535000,45.346313>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<53.855313,-1.535000,45.753584> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.868538,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.323441,-1.535000,30.073600>}
box{<0,0,-0.101600><1.454903,0.035000,0.101600> rotate<0,0.000000,0> translate<53.868538,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.888897,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.404959,-1.535000,45.720000>}
box{<0,0,-0.101600><1.516063,0.035000,0.101600> rotate<0,0.000000,0> translate<53.888897,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<53.980113,-1.535000,30.027384>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.387384,-1.535000,29.620113>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,44.997030,0> translate<53.980113,-1.535000,30.027384> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.003197,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.420838,-1.535000,48.768000>}
box{<0,0,-0.101600><1.417641,0.035000,0.101600> rotate<0,0.000000,0> translate<54.003197,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.021284,-1.535000,47.109684>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,47.641813>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<54.021284,-1.535000,47.109684> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.021284,-1.535000,48.749913>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,48.217784>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<54.021284,-1.535000,48.749913> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.030113,-1.535000,24.752613>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.437384,-1.535000,25.159884>}
box{<0,0,-0.101600><0.575969,0.035000,0.101600> rotate<0,-44.997030,0> translate<54.030113,-1.535000,24.752613> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.034834,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.412369,-1.535000,47.142400>}
box{<0,0,-0.101600><1.377534,0.035000,0.101600> rotate<0,0.000000,0> translate<54.034834,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.041300,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.393313,-1.535000,43.484800>}
box{<0,0,-0.101600><1.352013,0.035000,0.101600> rotate<0,0.000000,0> translate<54.041300,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.067900,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.231356,-1.535000,24.790400>}
box{<0,0,-0.101600><1.163456,0.035000,0.101600> rotate<0,0.000000,0> translate<54.067900,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.092097,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.403900,-1.535000,45.516800>}
box{<0,0,-0.101600><1.311803,0.035000,0.101600> rotate<0,0.000000,0> translate<54.092097,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.097963,-1.535000,48.564800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.419778,-1.535000,48.564800>}
box{<0,0,-0.101600><1.321816,0.035000,0.101600> rotate<0,0.000000,0> translate<54.097963,-1.535000,48.564800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.119000,-1.535000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.413428,-1.535000,47.345600>}
box{<0,0,-0.101600><1.294428,0.035000,0.101600> rotate<0,0.000000,0> translate<54.119000,-1.535000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.137097,-1.535000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.969419,-1.535000,29.870400>}
box{<0,0,-0.101600><0.832322,0.035000,0.101600> rotate<0,0.000000,0> translate<54.137097,-1.535000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.182128,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.418722,-1.535000,48.361600>}
box{<0,0,-0.101600><1.236594,0.035000,0.101600> rotate<0,0.000000,0> translate<54.182128,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.203169,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.414487,-1.535000,47.548800>}
box{<0,0,-0.101600><1.211319,0.035000,0.101600> rotate<0,0.000000,0> translate<54.203169,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,47.641813>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,48.217784>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<54.241697,-1.535000,48.217784> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.415544,-1.535000,47.752000>}
box{<0,0,-0.101600><1.173847,0.035000,0.101600> rotate<0,0.000000,0> translate<54.241697,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.416603,-1.535000,47.955200>}
box{<0,0,-0.101600><1.174906,0.035000,0.101600> rotate<0,0.000000,0> translate<54.241697,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.241697,-1.535000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.417663,-1.535000,48.158400>}
box{<0,0,-0.101600><1.175966,0.035000,0.101600> rotate<0,0.000000,0> translate<54.241697,-1.535000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.244500,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.394372,-1.535000,43.688000>}
box{<0,0,-0.101600><1.149872,0.035000,0.101600> rotate<0,0.000000,0> translate<54.244500,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.262584,-1.535000,43.706084>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.238213>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,-67.495746,0> translate<54.262584,-1.535000,43.706084> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.262584,-1.535000,45.346313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.814184>}
box{<0,0,-0.101600><0.575970,0.035000,0.101600> rotate<0,67.495746,0> translate<54.262584,-1.535000,45.346313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.271100,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.904428,-1.535000,24.993600>}
box{<0,0,-0.101600><0.633328,0.035000,0.101600> rotate<0,0.000000,0> translate<54.271100,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.276134,-1.535000,45.313600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.402841,-1.535000,45.313600>}
box{<0,0,-0.101600><1.126706,0.035000,0.101600> rotate<0,0.000000,0> translate<54.276134,-1.535000,45.313600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.339259,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.395431,-1.535000,43.891200>}
box{<0,0,-0.101600><1.056172,0.035000,0.101600> rotate<0,0.000000,0> translate<54.339259,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.340297,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.735231,-1.535000,29.667200>}
box{<0,0,-0.101600><0.394934,0.035000,0.101600> rotate<0,0.000000,0> translate<54.340297,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.360303,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.401781,-1.535000,45.110400>}
box{<0,0,-0.101600><1.041478,0.035000,0.101600> rotate<0,0.000000,0> translate<54.360303,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.387384,-1.535000,29.620113>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.511425,-1.535000,29.320647>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,67.495888,0> translate<54.387384,-1.535000,29.620113> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.423428,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.396487,-1.535000,44.094400>}
box{<0,0,-0.101600><0.973059,0.035000,0.101600> rotate<0,0.000000,0> translate<54.423428,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.437384,-1.535000,25.159884>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.561425,-1.535000,25.459350>}
box{<0,0,-0.101600><0.324138,0.035000,0.101600> rotate<0,-67.495888,0> translate<54.437384,-1.535000,25.159884> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.444472,-1.535000,44.907200>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.400722,-1.535000,44.907200>}
box{<0,0,-0.101600><0.956250,0.035000,0.101600> rotate<0,0.000000,0> translate<54.444472,-1.535000,44.907200> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.452050,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.584466,-1.535000,29.464000>}
box{<0,0,-0.101600><0.132416,0.035000,0.101600> rotate<0,0.000000,0> translate<54.452050,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.452675,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.717825,-1.535000,25.196800>}
box{<0,0,-0.101600><0.265150,0.035000,0.101600> rotate<0,0.000000,0> translate<54.452675,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.238213>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.814184>}
box{<0,0,-0.101600><0.575972,0.035000,0.101600> rotate<0,90.000000,0> translate<54.482997,-1.535000,44.814184> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.397547,-1.535000,44.297600>}
box{<0,0,-0.101600><0.914550,0.035000,0.101600> rotate<0,0.000000,0> translate<54.482997,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.500800>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.398606,-1.535000,44.500800>}
box{<0,0,-0.101600><0.915609,0.035000,0.101600> rotate<0,0.000000,0> translate<54.482997,-1.535000,44.500800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.482997,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.399666,-1.535000,44.704000>}
box{<0,0,-0.101600><0.916669,0.035000,0.101600> rotate<0,0.000000,0> translate<54.482997,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.511425,-1.535000,29.320647>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.592075,-1.535000,29.478938>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,-62.996734,0> translate<54.511425,-1.535000,29.320647> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.536841,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.591663,-1.535000,25.400000>}
box{<0,0,-0.101600><0.054822,0.035000,0.101600> rotate<0,0.000000,0> translate<54.536841,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.561425,-1.535000,25.459350>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.642075,-1.535000,25.301059>}
box{<0,0,-0.101600><0.177652,0.035000,0.101600> rotate<0,62.996734,0> translate<54.561425,-1.535000,25.459350> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.588150,-1.535000,22.070497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.281744,-1.535000,22.070497>}
box{<0,0,-0.101600><0.693594,0.035000,0.101600> rotate<0,0.000000,0> translate<54.588150,-1.535000,22.070497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.588150,-1.535000,52.929500>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.411847,-1.535000,52.929500>}
box{<0,0,-0.101600><0.823697,0.035000,0.101600> rotate<0,0.000000,0> translate<54.588150,-1.535000,52.929500> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.592075,-1.535000,29.478938>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.711925,-1.535000,29.643894>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-53.995920,0> translate<54.592075,-1.535000,29.478938> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.642075,-1.535000,25.301059>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.761925,-1.535000,25.136103>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,53.995920,0> translate<54.642075,-1.535000,25.301059> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.711925,-1.535000,29.643894>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.856103,-1.535000,29.788072>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,-44.997030,0> translate<54.711925,-1.535000,29.643894> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.761925,-1.535000,25.136103>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.906103,-1.535000,24.991925>}
box{<0,0,-0.101600><0.203899,0.035000,0.101600> rotate<0,44.997030,0> translate<54.761925,-1.535000,25.136103> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,39.567556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.019638,-1.535000,39.121803>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,67.495489,0> translate<54.835000,-1.535000,39.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,40.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,39.567556>}
box{<0,0,-0.101600><0.482484,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.835000,-1.535000,39.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.835000,-1.535000,40.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.019638,-1.535000,40.495794>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,-67.495489,0> translate<54.835000,-1.535000,40.050041> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,31.393578>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.142578,-1.535000,31.096000>}
box{<0,0,-0.101600><0.420839,0.035000,0.101600> rotate<0,44.997030,0> translate<54.845000,-1.535000,31.393578> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.224019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,31.393578>}
box{<0,0,-0.101600><1.830441,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.845000,-1.535000,31.393578> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.224019>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.945622,-1.535000,33.324638>}
box{<0,0,-0.101600><0.142299,0.035000,0.101600> rotate<0,-44.996141,0> translate<54.845000,-1.535000,33.224019> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.567556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.945622,-1.535000,33.324638>}
box{<0,0,-0.101600><0.262934,0.035000,0.101600> rotate<0,67.495216,0> translate<54.845000,-1.535000,33.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,34.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,33.567556>}
box{<0,0,-0.101600><0.482484,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.845000,-1.535000,33.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,34.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,34.495794>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,-67.495489,0> translate<54.845000,-1.535000,34.050041> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.067556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,34.621803>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,67.495489,0> translate<54.845000,-1.535000,35.067556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.550041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.067556>}
box{<0,0,-0.101600><0.482484,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.845000,-1.535000,35.067556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,35.550041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,35.995794>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,-67.495489,0> translate<54.845000,-1.535000,35.550041> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,36.567556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,36.121803>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,67.495489,0> translate<54.845000,-1.535000,36.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,37.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,36.567556>}
box{<0,0,-0.101600><0.482484,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.845000,-1.535000,36.567556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,37.050041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,37.495794>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,-67.495489,0> translate<54.845000,-1.535000,37.050041> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.067556>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,37.621803>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,67.495489,0> translate<54.845000,-1.535000,38.067556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.550041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.067556>}
box{<0,0,-0.101600><0.482484,0.035000,0.101600> rotate<0,-90.000000,0> translate<54.845000,-1.535000,38.067556> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.845000,-1.535000,38.550041>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,38.995794>}
box{<0,0,-0.101600><0.482480,0.035000,0.101600> rotate<0,-67.495489,0> translate<54.845000,-1.535000,38.550041> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.856103,-1.535000,29.788072>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.021059,-1.535000,29.907922>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,-35.998140,0> translate<54.856103,-1.535000,29.788072> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<54.906103,-1.535000,24.991925>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.071059,-1.535000,24.872075>}
box{<0,0,-0.101600><0.203898,0.035000,0.101600> rotate<0,35.998140,0> translate<54.906103,-1.535000,24.991925> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.019638,-1.535000,39.121803>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.087644,-1.535000,39.053797>}
box{<0,0,-0.101600><0.096175,0.035000,0.101600> rotate<0,44.997030,0> translate<55.019638,-1.535000,39.121803> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.019638,-1.535000,40.495794>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.360803,-1.535000,40.836959>}
box{<0,0,-0.101600><0.482481,0.035000,0.101600> rotate<0,-44.997030,0> translate<55.019638,-1.535000,40.495794> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.021059,-1.535000,29.907922>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.202738,-1.535000,30.000491>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,-26.997998,0> translate<55.021059,-1.535000,29.907922> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,34.495794>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,34.558797>}
box{<0,0,-0.101600><0.089102,0.035000,0.101600> rotate<0,-44.995609,0> translate<55.029637,-1.535000,34.495794> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,34.621803>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,34.558797>}
box{<0,0,-0.101600><0.089104,0.035000,0.101600> rotate<0,44.997030,0> translate<55.029637,-1.535000,34.621803> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,35.995794>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,36.058800>}
box{<0,0,-0.101600><0.089104,0.035000,0.101600> rotate<0,-44.997030,0> translate<55.029637,-1.535000,35.995794> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,36.121803>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,36.058800>}
box{<0,0,-0.101600><0.089102,0.035000,0.101600> rotate<0,44.995609,0> translate<55.029637,-1.535000,36.121803> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,37.495794>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,37.558797>}
box{<0,0,-0.101600><0.089102,0.035000,0.101600> rotate<0,-44.995609,0> translate<55.029637,-1.535000,37.495794> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,37.621803>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.092644,-1.535000,37.558797>}
box{<0,0,-0.101600><0.089104,0.035000,0.101600> rotate<0,44.997030,0> translate<55.029637,-1.535000,37.621803> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.029637,-1.535000,38.995794>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.087644,-1.535000,39.053797>}
box{<0,0,-0.101600><0.082031,0.035000,0.101600> rotate<0,-44.995487,0> translate<55.029637,-1.535000,38.995794> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.071059,-1.535000,24.872075>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.252738,-1.535000,24.779506>}
box{<0,0,-0.101600><0.203902,0.035000,0.101600> rotate<0,26.997998,0> translate<55.071059,-1.535000,24.872075> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.142578,-1.535000,31.096000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.328766,-1.535000,31.096000>}
box{<0,0,-0.101600><0.186188,0.035000,0.101600> rotate<0,0.000000,0> translate<55.142578,-1.535000,31.096000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.202738,-1.535000,30.000491>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.323263,-1.535000,30.039653>}
box{<0,0,-0.101600><0.126728,0.035000,0.101600> rotate<0,-17.999480,0> translate<55.202738,-1.535000,30.000491> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.252738,-1.535000,24.779506>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.295784,-1.535000,24.765519>}
box{<0,0,-0.101600><0.045262,0.035000,0.101600> rotate<0,17.999682,0> translate<55.252738,-1.535000,24.779506> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.281744,-1.535000,22.070497>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.295784,-1.535000,24.765519>}
box{<0,0,-0.101600><2.695058,0.035000,0.101600> rotate<0,-89.695581,0> translate<55.281744,-1.535000,22.070497> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.323263,-1.535000,30.039653>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.328766,-1.535000,31.096000>}
box{<0,0,-0.101600><1.056361,0.035000,0.101600> rotate<0,-89.695596,0> translate<55.323263,-1.535000,30.039653> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.360803,-1.535000,40.836959>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.379556,-1.535000,40.844725>}
box{<0,0,-0.101600><0.020297,0.035000,0.101600> rotate<0,-22.492847,0> translate<55.360803,-1.535000,40.836959> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.379556,-1.535000,40.844725>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.442584,-1.535000,52.942234>}
box{<0,0,-0.101600><12.097674,0.035000,0.101600> rotate<0,-89.695571,0> translate<55.379556,-1.535000,40.844725> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.411847,-1.535000,52.929500>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<55.442584,-1.535000,52.942234>}
box{<0,0,-0.101600><0.033271,0.035000,0.101600> rotate<0,-22.502469,0> translate<55.411847,-1.535000,52.929500> }
texture{col_pol}
}
#end
union{
cylinder{<21.648100,0.038000,30.700600><21.648100,-1.538000,30.700600>0.508000}
cylinder{<19.108100,0.038000,30.700600><19.108100,-1.538000,30.700600>0.508000}
cylinder{<19.077900,0.038000,40.265500><19.077900,-1.538000,40.265500>0.508000}
cylinder{<24.150000,0.038000,47.590000><24.150000,-1.538000,47.590000>0.508000}
cylinder{<21.610000,0.038000,47.590000><21.610000,-1.538000,47.590000>0.508000}
cylinder{<19.070000,0.038000,47.590000><19.070000,-1.538000,47.590000>0.508000}
cylinder{<50.670000,0.038000,25.980000><50.670000,-1.538000,25.980000>0.508000}
cylinder{<53.210000,0.038000,25.980000><53.210000,-1.538000,25.980000>0.508000}
cylinder{<55.750000,0.038000,25.980000><55.750000,-1.538000,25.980000>0.508000}
cylinder{<31.038800,0.038000,24.079200><31.038800,-1.538000,24.079200>0.508000}
cylinder{<31.038800,0.038000,21.539200><31.038800,-1.538000,21.539200>0.508000}
cylinder{<31.038800,0.038000,18.999200><31.038800,-1.538000,18.999200>0.508000}
cylinder{<28.512700,0.038000,24.080900><28.512700,-1.538000,24.080900>0.508000}
cylinder{<28.512700,0.038000,21.540900><28.512700,-1.538000,21.540900>0.508000}
cylinder{<28.512700,0.038000,19.000900><28.512700,-1.538000,19.000900>0.508000}
cylinder{<36.346700,0.038000,24.042800><36.346700,-1.538000,24.042800>0.508000}
cylinder{<36.346700,0.038000,21.502800><36.346700,-1.538000,21.502800>0.508000}
cylinder{<36.346700,0.038000,18.962800><36.346700,-1.538000,18.962800>0.508000}
cylinder{<33.677800,0.038000,24.080900><33.677800,-1.538000,24.080900>0.508000}
cylinder{<33.677800,0.038000,21.540900><33.677800,-1.538000,21.540900>0.508000}
cylinder{<33.677800,0.038000,19.000900><33.677800,-1.538000,19.000900>0.508000}
cylinder{<18.951100,0.038000,33.575300><18.951100,-1.538000,33.575300>0.508000}
cylinder{<40.335200,0.038000,44.780200><40.335200,-1.538000,44.780200>0.508000}
cylinder{<42.875200,0.038000,44.526200><42.875200,-1.538000,44.526200>0.508000}
cylinder{<45.415200,0.038000,44.780200><45.415200,-1.538000,44.780200>0.508000}
cylinder{<47.955200,0.038000,44.526200><47.955200,-1.538000,44.526200>0.508000}
cylinder{<50.495200,0.038000,44.780200><50.495200,-1.538000,44.780200>0.508000}
cylinder{<53.035200,0.038000,44.526200><53.035200,-1.538000,44.526200>0.508000}
cylinder{<50.620000,0.038000,28.800000><50.620000,-1.538000,28.800000>0.508000}
cylinder{<53.160000,0.038000,28.800000><53.160000,-1.538000,28.800000>0.508000}
cylinder{<55.700000,0.038000,28.800000><55.700000,-1.538000,28.800000>0.508000}
cylinder{<24.170000,0.038000,50.430000><24.170000,-1.538000,50.430000>0.508000}
cylinder{<21.630000,0.038000,50.430000><21.630000,-1.538000,50.430000>0.508000}
cylinder{<19.090000,0.038000,50.430000><19.090000,-1.538000,50.430000>0.508000}
cylinder{<25.992400,0.038000,24.080900><25.992400,-1.538000,24.080900>0.508000}
cylinder{<25.992400,0.038000,21.540900><25.992400,-1.538000,21.540900>0.508000}
cylinder{<25.992400,0.038000,19.000900><25.992400,-1.538000,19.000900>0.508000}
cylinder{<40.093900,0.038000,48.183800><40.093900,-1.538000,48.183800>0.508000}
cylinder{<42.633900,0.038000,47.929800><42.633900,-1.538000,47.929800>0.508000}
cylinder{<45.173900,0.038000,48.183800><45.173900,-1.538000,48.183800>0.508000}
cylinder{<47.713900,0.038000,47.929800><47.713900,-1.538000,47.929800>0.508000}
cylinder{<50.253900,0.038000,48.183800><50.253900,-1.538000,48.183800>0.508000}
cylinder{<52.793900,0.038000,47.929800><52.793900,-1.538000,47.929800>0.508000}
cylinder{<23.475900,0.038000,24.157100><23.475900,-1.538000,24.157100>0.508000}
cylinder{<23.475900,0.038000,21.617100><23.475900,-1.538000,21.617100>0.508000}
cylinder{<23.475900,0.038000,19.077100><23.475900,-1.538000,19.077100>0.508000}
cylinder{<56.057800,0.038000,32.308800><56.057800,-1.538000,32.308800>0.400000}
cylinder{<56.057800,0.038000,33.808800><56.057800,-1.538000,33.808800>0.400000}
cylinder{<56.057800,0.038000,35.308800><56.057800,-1.538000,35.308800>0.400000}
cylinder{<56.057800,0.038000,36.808800><56.057800,-1.538000,36.808800>0.400000}
cylinder{<56.057800,0.038000,38.308800><56.057800,-1.538000,38.308800>0.400000}
cylinder{<56.047800,0.038000,39.808800><56.047800,-1.538000,39.808800>0.400000}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//+ silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.283100,0.000000,29.430600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.013100,0.000000,29.430600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.013100,0.000000,29.430600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.013100,0.000000,29.430600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.378100,0.000000,30.065600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.378100,0.000000,30.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.378100,0.000000,31.335600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.013100,0.000000,31.970600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.378100,0.000000,31.335600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.378100,0.000000,30.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.743100,0.000000,29.430600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.743100,0.000000,29.430600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.743100,0.000000,29.430600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.473100,0.000000,29.430600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.473100,0.000000,29.430600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.473100,0.000000,29.430600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.838100,0.000000,30.065600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.838100,0.000000,30.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.838100,0.000000,31.335600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.473100,0.000000,31.970600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.838100,0.000000,31.335600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.473100,0.000000,31.970600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.743100,0.000000,31.970600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.473100,0.000000,31.970600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.743100,0.000000,31.970600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.378100,0.000000,31.335600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.743100,0.000000,31.970600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.918100,0.000000,30.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.918100,0.000000,31.335600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.918100,0.000000,31.335600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.283100,0.000000,29.430600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.918100,0.000000,30.065600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.283100,0.000000,29.430600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.918100,0.000000,31.335600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.283100,0.000000,31.970600>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.283100,0.000000,31.970600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.013100,0.000000,31.970600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.283100,0.000000,31.970600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.013100,0.000000,31.970600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.838100,0.000000,30.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.838100,0.000000,31.335600>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.838100,0.000000,31.335600> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.108100,0.000000,30.700600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.648100,0.000000,30.700600>}
//5V silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.347900,0.000000,40.900500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.712900,0.000000,41.535500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.712900,0.000000,41.535500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.712900,0.000000,41.535500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.442900,0.000000,41.535500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.442900,0.000000,41.535500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.442900,0.000000,41.535500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.807900,0.000000,40.900500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.807900,0.000000,40.900500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.807900,0.000000,40.900500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.807900,0.000000,39.630500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.807900,0.000000,39.630500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.807900,0.000000,39.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.442900,0.000000,38.995500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.807900,0.000000,39.630500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.442900,0.000000,38.995500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.712900,0.000000,38.995500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.442900,0.000000,38.995500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.712900,0.000000,38.995500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.347900,0.000000,39.630500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.712900,0.000000,38.995500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.347900,0.000000,39.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.347900,0.000000,40.900500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.347900,0.000000,40.900500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.077900,0.000000,40.265500>}
//BSS138-SCL silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,-1.536000,55.765700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.552100,-1.536000,55.765700>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<47.231300,-1.536000,55.765700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.552100,-1.536000,55.765700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.552100,-1.536000,52.920900>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.552100,-1.536000,52.920900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.552100,-1.536000,52.920900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,-1.536000,52.920900>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<47.231300,-1.536000,52.920900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,-1.536000,52.920900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,-1.536000,55.765700>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<47.231300,-1.536000,55.765700> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<46.888400,-1.536000,54.343300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<48.895000,-1.536000,55.283100>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<48.895000,-1.536000,53.403500>}
//BSS138-SDA silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.462200,-1.536000,55.791100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,-1.536000,55.791100>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<40.462200,-1.536000,55.791100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,-1.536000,55.791100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,-1.536000,52.946300>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.783000,-1.536000,52.946300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,-1.536000,52.946300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.462200,-1.536000,52.946300>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<40.462200,-1.536000,52.946300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.462200,-1.536000,52.946300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.462200,-1.536000,55.791100>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<40.462200,-1.536000,55.791100> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<40.119300,-1.536000,54.368700>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<42.125900,-1.536000,55.308500>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<42.125900,-1.536000,53.428900>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.930000,0.000000,44.310100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.218000,0.000000,44.310100>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<20.218000,0.000000,44.310100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.930000,0.000000,45.161100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.218000,0.000000,45.161100>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<20.218000,0.000000,45.161100> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.574000,0.000000,44.711600>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.574000,0.000000,44.772600>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<20.574000,0.000000,44.772600> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<21.162150,0.000000,44.737000>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<19.993750,0.000000,44.737000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.930000,0.000000,42.468600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.218000,0.000000,42.468600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<20.218000,0.000000,42.468600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.930000,0.000000,43.319600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.218000,0.000000,43.319600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<20.218000,0.000000,43.319600> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.574000,0.000000,42.870100>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.574000,0.000000,42.931100>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<20.574000,0.000000,42.931100> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<21.162150,0.000000,42.895500>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<19.993750,0.000000,42.895500>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.235100,-1.536000,54.558800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.235100,-1.536000,55.270800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.235100,-1.536000,55.270800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.384100,-1.536000,54.558800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.384100,-1.536000,55.270800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<24.384100,-1.536000,55.270800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<24.833600,-1.536000,54.914800>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<24.772600,-1.536000,54.914800>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<24.772600,-1.536000,54.914800> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<24.808200,-1.536000,54.326650>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<24.808200,-1.536000,55.495050>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.208100,-1.536000,55.765900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.496100,-1.536000,55.765900>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.496100,-1.536000,55.765900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.208100,-1.536000,54.914900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.496100,-1.536000,54.914900>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.496100,-1.536000,54.914900> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<35.852100,-1.536000,55.364400>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<35.852100,-1.536000,55.303400>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<35.852100,-1.536000,55.303400> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<36.440250,-1.536000,55.339000>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<35.271850,-1.536000,55.339000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.233500,-1.536000,57.074000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.521500,-1.536000,57.074000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.521500,-1.536000,57.074000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.233500,-1.536000,56.223000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.521500,-1.536000,56.223000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.521500,-1.536000,56.223000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<35.877500,-1.536000,56.672500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<35.877500,-1.536000,56.611500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<35.877500,-1.536000,56.611500> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<36.465650,-1.536000,56.647100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<35.297250,-1.536000,56.647100>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.544300,0.000000,29.247700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.544300,0.000000,29.959700>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<38.544300,0.000000,29.959700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.395300,0.000000,29.247700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.395300,0.000000,29.959700>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<39.395300,0.000000,29.959700> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<38.945800,0.000000,29.603700>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<39.006800,0.000000,29.603700>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<38.945800,0.000000,29.603700> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<38.971200,0.000000,29.015550>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<38.971200,0.000000,30.183950>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.869500,0.000000,42.993800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.869500,0.000000,43.705800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<26.869500,0.000000,43.705800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.720500,0.000000,42.993800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.720500,0.000000,43.705800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<27.720500,0.000000,43.705800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<27.271000,0.000000,43.349800>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<27.332000,0.000000,43.349800>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<27.271000,0.000000,43.349800> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<27.296400,0.000000,42.761650>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<27.296400,0.000000,43.930050>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.572300,0.000000,40.883200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.572300,0.000000,41.595200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<24.572300,0.000000,41.595200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.423300,0.000000,40.883200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.423300,0.000000,41.595200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.423300,0.000000,41.595200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<24.973800,0.000000,41.239200>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<25.034800,0.000000,41.239200>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<24.973800,0.000000,41.239200> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<24.999200,0.000000,40.651050>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<24.999200,0.000000,41.819450>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.690100,0.000000,29.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.690100,0.000000,29.947000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<36.690100,0.000000,29.947000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.541100,0.000000,29.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.541100,0.000000,29.947000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<37.541100,0.000000,29.947000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<37.091600,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<37.152600,0.000000,29.591000>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<37.091600,0.000000,29.591000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<37.117000,0.000000,29.002850>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<37.117000,0.000000,30.171250>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,46.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.705000,0.000000,46.320000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.705000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.705000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.435000,0.000000,46.320000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.435000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.435000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.800000,0.000000,46.955000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.800000,0.000000,46.955000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.800000,0.000000,48.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.435000,0.000000,48.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.800000,0.000000,48.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.435000,0.000000,48.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.705000,0.000000,48.860000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.435000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.705000,0.000000,48.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,48.225000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.705000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.785000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.515000,0.000000,46.320000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.515000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.515000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.880000,0.000000,46.955000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.880000,0.000000,46.955000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.880000,0.000000,48.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.515000,0.000000,48.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.880000,0.000000,48.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.880000,0.000000,46.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.245000,0.000000,46.320000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.245000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.245000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.975000,0.000000,46.320000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.975000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.975000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,46.955000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.340000,0.000000,46.955000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,48.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.975000,0.000000,48.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.340000,0.000000,48.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.975000,0.000000,48.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.245000,0.000000,48.860000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.975000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.245000,0.000000,48.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.880000,0.000000,48.225000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.245000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,46.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,48.225000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.420000,0.000000,48.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.785000,0.000000,46.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,46.955000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.785000,0.000000,46.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.420000,0.000000,48.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.785000,0.000000,48.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.785000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.515000,0.000000,48.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.785000,0.000000,48.860000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.515000,0.000000,48.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.800000,0.000000,46.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.800000,0.000000,48.225000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.800000,0.000000,48.225000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.070000,0.000000,47.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.610000,0.000000,47.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.150000,0.000000,47.590000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,26.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.115000,0.000000,27.250000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.480000,0.000000,26.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.115000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.385000,0.000000,27.250000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.115000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.385000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.020000,0.000000,26.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<56.385000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.020000,0.000000,25.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.385000,0.000000,24.710000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<56.385000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.385000,0.000000,24.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.115000,0.000000,24.710000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.115000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.115000,0.000000,24.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,25.345000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<54.480000,0.000000,25.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.035000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.305000,0.000000,27.250000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.035000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.305000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.940000,0.000000,26.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.305000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.940000,0.000000,25.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.305000,0.000000,24.710000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.305000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.940000,0.000000,26.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.575000,0.000000,27.250000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.940000,0.000000,26.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.575000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.845000,0.000000,27.250000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.575000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.845000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,26.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<53.845000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.480000,0.000000,25.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.845000,0.000000,24.710000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<53.845000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.845000,0.000000,24.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.575000,0.000000,24.710000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.575000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.575000,0.000000,24.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.940000,0.000000,25.345000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.940000,0.000000,25.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.400000,0.000000,26.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.400000,0.000000,25.345000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.400000,0.000000,25.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.035000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.400000,0.000000,26.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<49.400000,0.000000,26.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.400000,0.000000,25.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.035000,0.000000,24.710000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<49.400000,0.000000,25.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.305000,0.000000,24.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.035000,0.000000,24.710000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.035000,0.000000,24.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.020000,0.000000,26.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.020000,0.000000,25.345000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.020000,0.000000,25.345000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.750000,0.000000,25.980000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.210000,0.000000,25.980000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.670000,0.000000,25.980000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,20.269200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,19.634200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<31.673800,0.000000,20.269200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,19.634200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,18.364200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.308800,0.000000,18.364200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,18.364200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,17.729200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.673800,0.000000,17.729200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,17.729200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,18.364200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.768800,0.000000,18.364200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,18.364200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,19.634200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.768800,0.000000,19.634200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,19.634200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,20.269200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.768800,0.000000,19.634200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,24.714200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,23.444200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.308800,0.000000,23.444200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,23.444200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,22.809200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.673800,0.000000,22.809200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,22.809200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,23.444200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.768800,0.000000,23.444200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,22.809200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,22.174200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<31.673800,0.000000,22.809200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,22.174200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,20.904200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.308800,0.000000,20.904200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,20.904200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,20.269200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.673800,0.000000,20.269200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,20.269200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,20.904200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.768800,0.000000,20.904200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,20.904200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,22.174200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.768800,0.000000,22.174200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,22.174200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,22.809200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.768800,0.000000,22.174200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,25.349200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,25.349200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.403800,0.000000,25.349200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.308800,0.000000,24.714200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,25.349200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<31.673800,0.000000,25.349200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,25.349200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,24.714200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.768800,0.000000,24.714200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,23.444200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.768800,0.000000,24.714200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.768800,0.000000,24.714200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.673800,0.000000,17.729200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.403800,0.000000,17.729200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.403800,0.000000,17.729200> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.038800,0.000000,18.999200>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.038800,0.000000,21.539200>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.038800,0.000000,24.079200>}
//JP8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,19.635900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.147700,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,18.365900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.782700,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,17.730900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.147700,0.000000,17.730900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,18.365900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.242700,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,19.635900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.242700,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.242700,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,23.445900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.782700,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.147700,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,23.445900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.242700,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,22.175900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.147700,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,20.905900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.782700,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.147700,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,20.905900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.242700,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,22.175900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.242700,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.242700,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,25.350900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.877700,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.782700,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,25.350900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.147700,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,24.715900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.242700,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.242700,0.000000,24.715900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.242700,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.147700,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.877700,0.000000,17.730900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.877700,0.000000,17.730900> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.512700,0.000000,19.000900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.512700,0.000000,21.540900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.512700,0.000000,24.080900>}
//JP9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,20.232800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,19.597800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<36.981700,0.000000,20.232800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,19.597800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,18.327800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.616700,0.000000,18.327800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,18.327800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,17.692800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<36.981700,0.000000,17.692800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,17.692800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,18.327800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.076700,0.000000,18.327800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,18.327800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,19.597800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.076700,0.000000,19.597800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,19.597800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,20.232800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.076700,0.000000,19.597800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,24.677800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,23.407800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.616700,0.000000,23.407800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,23.407800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,22.772800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<36.981700,0.000000,22.772800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,22.772800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,23.407800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.076700,0.000000,23.407800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,22.772800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,22.137800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<36.981700,0.000000,22.772800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,22.137800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,20.867800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.616700,0.000000,20.867800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,20.867800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,20.232800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<36.981700,0.000000,20.232800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,20.232800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,20.867800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.076700,0.000000,20.867800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,20.867800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,22.137800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.076700,0.000000,22.137800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,22.137800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,22.772800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.076700,0.000000,22.137800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,25.312800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,25.312800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.711700,0.000000,25.312800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.616700,0.000000,24.677800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,25.312800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<36.981700,0.000000,25.312800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,25.312800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,24.677800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.076700,0.000000,24.677800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,23.407800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.076700,0.000000,24.677800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.076700,0.000000,24.677800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.981700,0.000000,17.692800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.711700,0.000000,17.692800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.711700,0.000000,17.692800> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<36.346700,0.000000,18.962800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<36.346700,0.000000,21.502800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<36.346700,0.000000,24.042800>}
//JP10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,19.635900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.312800,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,18.365900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.947800,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,17.730900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.312800,0.000000,17.730900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,18.365900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.407800,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,19.635900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.407800,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.407800,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,23.445900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.947800,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.312800,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,23.445900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.407800,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,22.175900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.312800,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,20.905900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.947800,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.312800,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,20.905900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.407800,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,22.175900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.407800,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.407800,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,25.350900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.042800,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947800,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,25.350900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.312800,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,24.715900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.407800,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407800,0.000000,24.715900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.407800,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.312800,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042800,0.000000,17.730900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.042800,0.000000,17.730900> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.677800,0.000000,19.000900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.677800,0.000000,21.540900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.677800,0.000000,24.080900>}
//JP11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.316100,0.000000,34.845300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.586100,0.000000,34.845300>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.316100,0.000000,34.845300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.586100,0.000000,34.845300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.221100,0.000000,34.210300>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.586100,0.000000,34.845300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.221100,0.000000,34.210300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.221100,0.000000,32.940300>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.221100,0.000000,32.940300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.221100,0.000000,32.940300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.586100,0.000000,32.305300>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.586100,0.000000,32.305300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.681100,0.000000,34.210300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.681100,0.000000,32.940300>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.681100,0.000000,32.940300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.316100,0.000000,34.845300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.681100,0.000000,34.210300>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.681100,0.000000,34.210300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.681100,0.000000,32.940300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.316100,0.000000,32.305300>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.681100,0.000000,32.940300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.586100,0.000000,32.305300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.316100,0.000000,32.305300>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.316100,0.000000,32.305300> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.951100,0.000000,33.575300>}
//JP12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.065200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.700200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<39.065200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.700200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.700200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.970200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.240200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<41.605200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.240200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.510200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.240200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.510200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<43.510200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.780200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<44.145200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.780200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.050200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.780200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.050200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.050200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.320200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.685200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.320200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.590200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.320200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.590200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.590200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.860200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<49.225200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.860200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.130200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.860200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.130200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.130200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.400200,0.000000,45.923200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.765200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.400200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.670200,0.000000,45.923200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.400200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.670200,0.000000,45.923200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.305200,0.000000,45.288200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<53.670200,0.000000,45.923200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.305200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.305200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.305200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.305200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.670200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<53.670200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.670200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.400200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.400200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.400200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.765200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.130200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.130200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.130200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.860200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.860200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.860200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<49.225200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.590200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.590200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.590200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.320200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.320200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.320200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.685200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.050200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.050200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.050200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.780200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.780200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.780200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<44.145200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.510200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.510200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.510200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.240200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.240200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.240200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<41.605200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,43.383200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.970200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.700200,0.000000,43.383200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.700200,0.000000,43.383200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.700200,0.000000,43.383200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.065200,0.000000,44.018200>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<39.065200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.065200,0.000000,44.018200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.065200,0.000000,45.288200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<39.065200,0.000000,45.288200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.605200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.605200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.145200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.145200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.685200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.685200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.225200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.225200,0.000000,44.018200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,45.288200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,44.018200>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.765200,0.000000,44.018200> }
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<40.335200,0.000000,44.653200>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<42.875200,0.000000,44.653200>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<45.415200,0.000000,44.653200>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<47.955200,0.000000,44.653200>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<50.495200,0.000000,44.653200>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<53.035200,0.000000,44.653200>}
//JP13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.430000,0.000000,29.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.065000,0.000000,30.070000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.430000,0.000000,29.435000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.065000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.335000,0.000000,30.070000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.065000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.335000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.970000,0.000000,29.435000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<56.335000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.970000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.335000,0.000000,27.530000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<56.335000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.335000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.065000,0.000000,27.530000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.065000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.065000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.430000,0.000000,28.165000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<54.430000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.985000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.255000,0.000000,30.070000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.985000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.255000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.890000,0.000000,29.435000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.255000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.890000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.255000,0.000000,27.530000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.255000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.890000,0.000000,29.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.525000,0.000000,30.070000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.890000,0.000000,29.435000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.525000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.795000,0.000000,30.070000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.525000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.795000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.430000,0.000000,29.435000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<53.795000,0.000000,30.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.430000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.795000,0.000000,27.530000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<53.795000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.795000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.525000,0.000000,27.530000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.525000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.525000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.890000,0.000000,28.165000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.890000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.350000,0.000000,29.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.350000,0.000000,28.165000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.350000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.985000,0.000000,30.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.350000,0.000000,29.435000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<49.350000,0.000000,29.435000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.350000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.985000,0.000000,27.530000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<49.350000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.255000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.985000,0.000000,27.530000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.985000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.970000,0.000000,29.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.970000,0.000000,28.165000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.970000,0.000000,28.165000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.700000,0.000000,28.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.160000,0.000000,28.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.620000,0.000000,28.800000>}
//JP14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.360000,0.000000,49.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.725000,0.000000,49.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.725000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.725000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.455000,0.000000,49.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.455000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.455000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.820000,0.000000,49.795000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.820000,0.000000,49.795000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.820000,0.000000,51.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.455000,0.000000,51.700000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.820000,0.000000,51.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.455000,0.000000,51.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.725000,0.000000,51.700000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.455000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.725000,0.000000,51.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.360000,0.000000,51.065000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.725000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.805000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.535000,0.000000,49.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.535000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.535000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.900000,0.000000,49.795000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.900000,0.000000,49.795000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.900000,0.000000,51.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.535000,0.000000,51.700000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.900000,0.000000,51.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.900000,0.000000,49.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.265000,0.000000,49.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.265000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.265000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.995000,0.000000,49.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.995000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.995000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.360000,0.000000,49.795000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.360000,0.000000,49.795000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.360000,0.000000,51.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.995000,0.000000,51.700000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.360000,0.000000,51.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.995000,0.000000,51.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.265000,0.000000,51.700000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.995000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.265000,0.000000,51.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.900000,0.000000,51.065000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.265000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.440000,0.000000,49.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.440000,0.000000,51.065000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.440000,0.000000,51.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.805000,0.000000,49.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.440000,0.000000,49.795000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.805000,0.000000,49.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.440000,0.000000,51.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.805000,0.000000,51.700000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.805000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.535000,0.000000,51.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.805000,0.000000,51.700000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.535000,0.000000,51.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.820000,0.000000,49.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.820000,0.000000,51.065000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.820000,0.000000,51.065000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.090000,0.000000,50.430000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.630000,0.000000,50.430000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.170000,0.000000,50.430000>}
//JP15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,19.635900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<26.627400,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,18.365900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.262400,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,17.730900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<26.627400,0.000000,17.730900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,18.365900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.722400,0.000000,18.365900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,18.365900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,19.635900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<24.722400,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,19.635900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.722400,0.000000,19.635900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,23.445900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.262400,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<26.627400,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,23.445900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.722400,0.000000,23.445900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,22.810900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,22.175900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<26.627400,0.000000,22.810900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,20.905900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.262400,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,20.270900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<26.627400,0.000000,20.270900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,20.270900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,20.905900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.722400,0.000000,20.905900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,20.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,22.175900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<24.722400,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,22.175900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,22.810900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.722400,0.000000,22.175900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,25.350900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.357400,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.262400,0.000000,24.715900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,25.350900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<26.627400,0.000000,25.350900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,25.350900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,24.715900>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.722400,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,23.445900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.722400,0.000000,24.715900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<24.722400,0.000000,24.715900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.627400,0.000000,17.730900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.357400,0.000000,17.730900>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.357400,0.000000,17.730900> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<25.992400,0.000000,19.000900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<25.992400,0.000000,21.540900>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<25.992400,0.000000,24.080900>}
//JP16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.823900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.458900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.823900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.458900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.728900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.458900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.728900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.728900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.998900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<41.363900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.998900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.268900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.998900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.268900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<43.268900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.538900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.903900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.538900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.808900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.538900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.808900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<45.808900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.078900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.443900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.078900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.348900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.078900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.348900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.348900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.618900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.983900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.618900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.888900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.618900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.888900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<50.888900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.158900,0.000000,49.326800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.523900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.158900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.428900,0.000000,49.326800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.158900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.428900,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.063900,0.000000,48.691800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<53.428900,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.063900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.063900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.063900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.063900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.428900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<53.428900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.428900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.158900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.158900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.158900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<51.523900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.888900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<50.888900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.888900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.618900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.618900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.618900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.983900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.348900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.348900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.348900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.078900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.078900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.078900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.443900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.808900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<45.808900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.808900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.538900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.538900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.538900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<43.903900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.268900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.268900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.268900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.998900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.998900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.998900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<41.363900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.728900,0.000000,46.786800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.728900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.728900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.458900,0.000000,46.786800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.458900,0.000000,46.786800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.458900,0.000000,46.786800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.823900,0.000000,47.421800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<38.823900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.823900,0.000000,47.421800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.823900,0.000000,48.691800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.823900,0.000000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.363900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.363900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.903900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.903900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.443900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.443900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.983900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.983900,0.000000,47.421800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.523900,0.000000,47.421800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.523900,0.000000,47.421800> }
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<40.093900,0.000000,48.056800>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<42.633900,0.000000,48.056800>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<45.173900,0.000000,48.056800>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<47.713900,0.000000,48.056800>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<50.253900,0.000000,48.056800>}
box{<-0.292100,0,-0.292100><0.292100,0.036000,0.292100> rotate<0,-0.000000,0> translate<52.793900,0.000000,48.056800>}
//JP17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,20.347100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,19.712100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.110900,0.000000,20.347100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,19.712100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,18.442100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.745900,0.000000,18.442100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,18.442100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,17.807100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.110900,0.000000,17.807100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,17.807100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,18.442100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.205900,0.000000,18.442100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,18.442100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,19.712100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.205900,0.000000,19.712100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,19.712100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,20.347100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.205900,0.000000,19.712100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,24.792100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,23.522100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.745900,0.000000,23.522100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,23.522100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,22.887100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.110900,0.000000,22.887100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,22.887100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,23.522100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.205900,0.000000,23.522100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,22.887100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,22.252100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.110900,0.000000,22.887100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,22.252100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,20.982100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.745900,0.000000,20.982100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,20.982100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,20.347100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.110900,0.000000,20.347100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,20.347100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,20.982100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.205900,0.000000,20.982100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,20.982100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,22.252100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.205900,0.000000,22.252100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,22.252100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,22.887100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.205900,0.000000,22.252100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,25.427100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,25.427100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.840900,0.000000,25.427100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.745900,0.000000,24.792100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,25.427100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.110900,0.000000,25.427100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,25.427100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,24.792100>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.205900,0.000000,24.792100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,23.522100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.205900,0.000000,24.792100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.205900,0.000000,24.792100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.110900,0.000000,17.807100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.840900,0.000000,17.807100>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.840900,0.000000,17.807100> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<23.475900,0.000000,19.077100>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<23.475900,0.000000,21.617100>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<23.475900,0.000000,24.157100>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,21.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,22.720000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<44.256200,0.000000,22.720000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,22.720000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,22.720000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.256200,0.000000,22.720000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,22.720000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,21.320000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.256200,0.000000,21.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,19.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,17.920000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.256200,0.000000,17.920000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.256200,0.000000,17.920000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,17.920000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.256200,0.000000,17.920000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,17.920000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.256200,0.000000,19.320000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<42.256200,0.000000,19.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.956200,0.000000,20.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256200,0.000000,20.020000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.256200,0.000000,20.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256200,0.000000,20.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.556200,0.000000,20.020000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.556200,0.000000,20.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256200,0.000000,20.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.856200,0.000000,20.620000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.256200,0.000000,20.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.856200,0.000000,20.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.656200,0.000000,20.620000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.656200,0.000000,20.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.656200,0.000000,20.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256200,0.000000,20.020000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<42.656200,0.000000,20.620000> }
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,21.332700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,22.732700>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<47.278800,0.000000,22.732700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,22.732700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,22.732700>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.278800,0.000000,22.732700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,22.732700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,21.332700>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.278800,0.000000,21.332700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,19.332700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,17.932700>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.278800,0.000000,17.932700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.278800,0.000000,17.932700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,17.932700>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.278800,0.000000,17.932700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,17.932700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.278800,0.000000,19.332700>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<45.278800,0.000000,19.332700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.978800,0.000000,20.032700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.278800,0.000000,20.032700>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.278800,0.000000,20.032700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.278800,0.000000,20.032700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.578800,0.000000,20.032700>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.578800,0.000000,20.032700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.278800,0.000000,20.032700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.878800,0.000000,20.632700>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.278800,0.000000,20.032700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.878800,0.000000,20.632700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.678800,0.000000,20.632700>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.678800,0.000000,20.632700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.678800,0.000000,20.632700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.278800,0.000000,20.032700>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<45.678800,0.000000,20.632700> }
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,21.256500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,22.656500>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.182800,0.000000,22.656500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,22.656500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,22.656500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.182800,0.000000,22.656500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,22.656500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,21.256500>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.182800,0.000000,21.256500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,19.256500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,17.856500>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.182800,0.000000,17.856500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.182800,0.000000,17.856500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,17.856500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.182800,0.000000,17.856500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,17.856500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.182800,0.000000,19.256500>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<39.182800,0.000000,19.256500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.882800,0.000000,19.956500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.182800,0.000000,19.956500>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.182800,0.000000,19.956500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.182800,0.000000,19.956500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.482800,0.000000,19.956500>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.482800,0.000000,19.956500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.182800,0.000000,19.956500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.782800,0.000000,20.556500>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.182800,0.000000,19.956500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.782800,0.000000,20.556500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.582800,0.000000,20.556500>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.582800,0.000000,20.556500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.582800,0.000000,20.556500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.182800,0.000000,19.956500>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<39.582800,0.000000,20.556500> }
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,49.501300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,50.901300>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.763200,0.000000,50.901300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,50.901300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,50.901300>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.763200,0.000000,50.901300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,50.901300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,49.501300>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.763200,0.000000,49.501300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,47.501300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,46.101300>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.763200,0.000000,46.101300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.763200,0.000000,46.101300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,46.101300>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.763200,0.000000,46.101300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,46.101300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.763200,0.000000,47.501300>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.763200,0.000000,47.501300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.463200,0.000000,48.201300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.763200,0.000000,48.201300>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.763200,0.000000,48.201300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.763200,0.000000,48.201300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.063200,0.000000,48.201300>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.063200,0.000000,48.201300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.763200,0.000000,48.201300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.363200,0.000000,48.801300>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.763200,0.000000,48.201300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.363200,0.000000,48.801300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.163200,0.000000,48.801300>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.163200,0.000000,48.801300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.163200,0.000000,48.801300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.763200,0.000000,48.201300>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<35.163200,0.000000,48.801300> }
//MCP1825S silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.673300,-1.536000,49.225200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.673300,-1.536000,52.527200>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.673300,-1.536000,52.527200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.673300,-1.536000,52.527200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.226500,-1.536000,52.527200>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,0.000000,0> translate<27.673300,-1.536000,52.527200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.226500,-1.536000,52.527200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.226500,-1.536000,49.225200>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.226500,-1.536000,49.225200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.226500,-1.536000,49.225200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.673300,-1.536000,49.225200>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,0.000000,0> translate<27.673300,-1.536000,49.225200> }
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-180.000000,0> translate<30.949900,0.000000,48.145700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<30.949900,0.000000,53.606700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<33.261300,0.000000,53.606700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<28.638500,0.000000,53.606700>}
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-180.000000,0> translate<30.949900,-1.536000,48.145700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<30.949900,-1.536000,53.606700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<33.261300,-1.536000,53.606700>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-180.000000,0> translate<28.638500,-1.536000,53.606700>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.834100,0.000000,24.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.834100,0.000000,25.286100>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<45.834100,0.000000,25.286100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.685100,0.000000,24.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.685100,0.000000,25.286100>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<46.685100,0.000000,25.286100> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<46.261000,0.000000,24.341950>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<46.261000,0.000000,25.510350>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-90.000000,0> translate<46.266100,0.000000,24.930100>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798800,0.000000,24.383600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798800,0.000000,25.095600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<42.798800,0.000000,25.095600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.649800,0.000000,24.383600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.649800,0.000000,25.095600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<43.649800,0.000000,25.095600> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<43.225700,0.000000,24.151450>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<43.225700,0.000000,25.319850>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-90.000000,0> translate<43.230800,0.000000,24.739600>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.715800,0.000000,42.862700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.427800,0.000000,42.862700>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<40.715800,0.000000,42.862700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.715800,0.000000,42.011700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.427800,0.000000,42.011700>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<40.715800,0.000000,42.011700> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<40.483650,0.000000,42.435800>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<41.652050,0.000000,42.435800>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<41.071800,0.000000,42.430700>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.391600,0.000000,36.439400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.991600,0.000000,36.439400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.391600,0.000000,36.439400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.391600,0.000000,35.239400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.991600,0.000000,35.239400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.391600,0.000000,35.239400> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.621400,0.000000,53.903600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.621400,0.000000,54.503600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.621400,0.000000,54.503600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.821400,0.000000,53.903600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.821400,0.000000,54.503600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.821400,0.000000,54.503600> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.530200,0.000000,54.005200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.530200,0.000000,54.605200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.530200,0.000000,54.605200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.730200,0.000000,54.005200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.730200,0.000000,54.605200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.730200,0.000000,54.605200> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.018500,0.000000,52.255700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.018500,0.000000,51.655700>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.018500,0.000000,51.655700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.818500,0.000000,52.255700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.818500,0.000000,51.655700>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.818500,0.000000,51.655700> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.814300,0.000000,52.255700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.814300,0.000000,51.655700>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.814300,0.000000,51.655700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.614300,0.000000,52.255700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.614300,0.000000,51.655700>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.614300,0.000000,51.655700> }
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.595500,0.000000,24.325300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.595500,0.000000,24.925300>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.595500,0.000000,24.925300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.795500,0.000000,24.325300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.795500,0.000000,24.925300>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.795500,0.000000,24.925300> }
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.074300,0.000000,52.303400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.074300,0.000000,52.903400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.074300,0.000000,52.903400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.274300,0.000000,52.303400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.274300,0.000000,52.903400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.274300,0.000000,52.903400> }
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.410500,0.000000,41.821300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.122500,0.000000,41.821300>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.410500,0.000000,41.821300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.410500,0.000000,40.970300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.122500,0.000000,40.970300>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.410500,0.000000,40.970300> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<36.178350,0.000000,41.394400>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.346750,0.000000,41.394400>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<36.766500,0.000000,41.389300>}
//SJ4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.981400,0.000000,27.546400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.981400,0.000000,29.146400>}
box{<0,0,-0.101600><1.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.981400,0.000000,29.146400> }
object{ARC(0.254950,0.203200,258.690068,348.690068,0.036000) translate<29.731400,0.000000,27.596400>}
object{ARC(0.254950,0.203200,11.309932,101.309932,0.036000) translate<29.731400,0.000000,29.096400>}
object{ARC(0.254950,0.203200,78.690068,168.690068,0.036000) translate<28.231400,0.000000,29.096400>}
object{ARC(0.254950,0.203200,191.309932,281.309932,0.036000) translate<28.231400,0.000000,27.596400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.981400,0.000000,29.146400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.981400,0.000000,27.546400>}
box{<0,0,-0.101600><1.600000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.981400,0.000000,27.546400> }
//SJ5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.000000,0.000000,27.570400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.000000,0.000000,29.170400>}
box{<0,0,-0.101600><1.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.000000,0.000000,29.170400> }
object{ARC(0.254950,0.203200,258.690068,348.690068,0.036000) translate<26.750000,0.000000,27.620400>}
object{ARC(0.254950,0.203200,11.309932,101.309932,0.036000) translate<26.750000,0.000000,29.120400>}
object{ARC(0.254950,0.203200,78.690068,168.690068,0.036000) translate<25.250000,0.000000,29.120400>}
object{ARC(0.254950,0.203200,191.309932,281.309932,0.036000) translate<25.250000,0.000000,27.620400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.000000,0.000000,29.170400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.000000,0.000000,27.570400>}
box{<0,0,-0.101600><1.600000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.000000,0.000000,27.570400> }
//U$11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.057800,0.000000,31.308800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.057800,0.000000,31.308800>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.057800,0.000000,31.308800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.057800,0.000000,31.308800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.057800,0.000000,40.808800>}
box{<0,0,-0.101600><9.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<57.057800,0.000000,40.808800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.057800,0.000000,40.808800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.057800,0.000000,40.808800>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.057800,0.000000,40.808800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.057800,0.000000,40.808800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.057800,0.000000,31.308800>}
box{<0,0,-0.101600><9.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.057800,0.000000,31.308800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.297800,0.000000,32.928800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.297800,0.000000,31.658800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.297800,0.000000,31.658800> }
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.008816,0.000000,36.032300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.052000,0.000000,31.075481>}
box{<0,0,-0.076200><7.009998,0.036000,0.076200> rotate<0,-44.997048,0> translate<31.052000,0.000000,31.075481> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.052000,0.000000,31.075481>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.095181,0.000000,36.032300>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,44.997030,0> translate<26.095181,0.000000,36.032300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.095181,0.000000,36.032300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.800975,0.000000,40.738094>}
box{<0,0,-0.076200><6.654997,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.095181,0.000000,36.032300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.303022,0.000000,40.738094>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.008816,0.000000,36.032300>}
box{<0,0,-0.076200><6.654997,0.036000,0.076200> rotate<0,44.997030,0> translate<31.303022,0.000000,40.738094> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.303022,0.000000,40.738094>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.800975,0.000000,40.738094>}
box{<0,0,-0.076200><0.502047,0.036000,0.076200> rotate<0,0.000000,0> translate<30.800975,0.000000,40.738094> }
difference{
cylinder{<31.052000,0,39.911769><31.052000,0.036000,39.911769>0.435400 translate<0,0.000000,0>}
cylinder{<31.052000,-0.1,39.911769><31.052000,0.135000,39.911769>0.283000 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<30.167197,0.000000,40.876900>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<29.601509,0.000000,40.311213>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<29.035825,0.000000,39.745528>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<28.470141,0.000000,39.179844>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<27.904453,0.000000,38.614156>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<27.338769,0.000000,38.048472>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<26.773084,0.000000,37.482788>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<26.207397,0.000000,36.917100>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<26.207397,0.000000,35.147497>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<26.773084,0.000000,34.581809>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<27.338769,0.000000,34.016125>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<27.904453,0.000000,33.450441>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<28.470141,0.000000,32.884753>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<29.035825,0.000000,32.319069>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<29.601509,0.000000,31.753384>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<30.167197,0.000000,31.187697>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<31.936800,0.000000,31.187697>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<32.502488,0.000000,31.753384>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<33.068172,0.000000,32.319069>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<33.633856,0.000000,32.884753>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<34.199544,0.000000,33.450441>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<34.765228,0.000000,34.016125>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<35.330913,0.000000,34.581809>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-315.000000,0> translate<35.896600,0.000000,35.147497>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<35.896600,0.000000,36.917100>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<35.330913,0.000000,37.482788>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<34.765228,0.000000,38.048472>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<34.199544,0.000000,38.614156>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<33.633856,0.000000,39.179844>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<33.068172,0.000000,39.745528>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<32.502488,0.000000,40.311213>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-315.000000,0> translate<31.936800,0.000000,40.876900>}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.934800,0.000000,37.550200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.634800,0.000000,37.550200>}
box{<0,0,-0.101600><1.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.634800,0.000000,37.550200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.634800,0.000000,41.150200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.934800,0.000000,41.150200>}
box{<0,0,-0.101600><1.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.634800,0.000000,41.150200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.934800,0.000000,40.950200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.934800,0.000000,37.750200>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.934800,0.000000,37.750200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.934800,0.000000,37.750200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634800,0.000000,37.750200>}
box{<0,0,-0.063500><1.300000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.634800,0.000000,37.750200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634800,0.000000,37.750200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634800,0.000000,40.950200>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.634800,0.000000,40.950200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.634800,0.000000,40.950200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.934800,0.000000,40.950200>}
box{<0,0,-0.063500><1.300000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.634800,0.000000,40.950200> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MULTIWIICHASSIS(-37.500000,0,-37.500000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BSS138-SCL	BSS138BOTTOM	SOT23_BOT
//BSS138-SDA	BSS138BOTTOM	SOT23_BOT
//JP12		1X06_LOCK
//JP16		1X06_LOCK
//LED1	Status	LED-1206
//LED2	P-CPU	LED-1206
//LED3	P-ESC	LED-1206
//LED4	P-3V3	LED-1206
//MCP1825S	V_REG_MCP1825S	SOT223_BOT
//SJ4	SOLDERJUMPERNO	SJ_2S-NO
//SJ5	SOLDERJUMPERNO	SJ_2S-NO
//U$11	AVR_MINI_PROGSMD	AVR_MINI_PROG
//Y1		RESONATOR-SMD
