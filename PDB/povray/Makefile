EAGLE3D_HOME=$(HOME)/Applications/eagle3d/

POVLIB=+L$(EAGLE3D_HOME)/povray  +L/usr/share/fonts/truetype/msttcorefonts +L$(EAGLE3D_HOME)/msttfonts

all:	small
small:
	povray -IMultiWiiChassis_hex_power.pov $(POVLIB) +W1600 +H1200 +Q5  +OMultiWiiChassis_hex.png
	povray -IMultiWiiChassis_quad_power.pov $(POVLIB) +W1600 +H1200 +Q5  +OMultiWiiChassis_quad.png

big: 
	povray -IMultiWiiChassis_hex_power.pov $(POVLIB) +W3200 +H2400 +Q9 +R9 +A0.01 +OMultiWiiChassis_quad-0-big.png
	povray -IMultiWiiChassis_hex_power.pov $(POVLIB) +W3200 +H2400 +Q9 +R9 +A0.01 +OMultiWiiChassis_hex-0-big.png


clean:
	rm *.png
