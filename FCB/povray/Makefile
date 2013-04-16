
#EAGLE3D_HOME=/home/poine/work/eagle3d/eagle3d/
EAGLE3D_HOME=$(HOME)/Applications/eagle3d/

POVLIB=+L$(EAGLE3D_HOME)/povray  +L/usr/share/fonts/truetype/msttcorefonts +L/Applications/eagle3d/msttfonts

strip_small:
	#povray -Istrip_scene.pov $(POVLIB) +W800 +H600 +Ostrip.png
	povray -IMultiWiiChassis.pov $(POVLIB) +W3200 +H2400 +Q9 +R2 +A0.3 +Ostrip.png

strip_big:
	#povray -IMain_board_V1_3.pov $(POVLIB)  +W1600 +H1200 +Q9 +A0.3 +R8 +Ostrip_big.png
	povray -IMain_board_V1_3.pov $(POVLIB) +W3200 +H2400 +Q9 +R8 +A0.3 +Ostrip.png

clean:
	rm *~
