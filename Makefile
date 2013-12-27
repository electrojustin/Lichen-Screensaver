# hacks/glx/Makefile.in --- xscreensaver, Copyright (c) 1999-2010
#  by Jamie Zawinski.
# the `../../configure' script generates `hacks/glx/Makefile' from this file.


.SUFFIXES:
.SUFFIXES: .c .o

srcdir		= .

top_srcdir	= ../..
top_builddir	= ..

install_prefix	=
prefix		= /usr/local
exec_prefix	= ${prefix}
bindir		= ${exec_prefix}/bin
datarootdir	= ${prefix}/share
datadir		= ${datarootdir}
mandir		= ${datarootdir}/man
libexecdir	= ${exec_prefix}/libexec
mansuffix	= 6
manNdir		= $(mandir)/man$(mansuffix)

HACKDIR		= ${libexecdir}/xscreensaver
HACK_CONF_DIR	= ${datadir}/xscreensaver/config

CC		= gcc -pedantic -Wall -Wstrict-prototypes -Wnested-externs -Wmissing-prototypes -Wno-overlength-strings -Wdeclaration-after-statement -std=c89 -U__STRICT_ANSI__
CFLAGS		= -g -O2
LDFLAGS		=  -L${exec_prefix}/lib
DEFS		= -DSTANDALONE -DUSE_GL -DHAVE_CONFIG_H
LIBS		= 

DEPEND		= makedepend
DEPEND_FLAGS	= 
DEPEND_DEFINES	= 

SHELL		= /bin/sh
INSTALL		= /usr/bin/install -c
SUID_FLAGS      = -o root -m 4755
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SETUID  = $(INSTALL_PROGRAM) $(SUID_FLAGS)
INSTALL_DATA	= ${INSTALL} -m 644
INSTALL_DIRS	= ${INSTALL} -d

X_CFLAGS	= 
X_LIBS		= 
X_PRE_LIBS	=  -lSM -lICE
X_EXTRA_LIBS	= 
XMU_LIBS	= -lXmu

# Note: see comment in ../../driver/Makefile.in for explanation of X_LIBS, etc.
#
HACK_PRE	= $(LIBS) $(X_LIBS)
HACK_POST     = $(X_PRE_LIBS) -lXt -lX11 $(XMU_LIBS) -lXext $(X_EXTRA_LIBS) -lm
HACK_POST2	= -lGL -lGLU -lXxf86vm -lpthread  $(HACK_POST)
HACK_LIBS	= $(HACK_PRE)                       $(HACK_POST2)
XPM_LIBS	= $(HACK_PRE)            -pthread -lgdk_pixbuf_xlib-2.0 -lgmodule-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0   $(HACK_POST2)
GLE_LIBS	= $(HACK_PRE)  -pthread -lgdk_pixbuf_xlib-2.0 -lgmodule-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0   $(HACK_POST2)
TEXT_LIBS	= -lutil
MINIXPM		= $(UTILS_BIN)/minixpm.o

HACK_SRC	= $(srcdir)/..
HACK_BIN	= ..
UTILS_SRC	= $(HACK_SRC)/../utils
UTILS_BIN	= $(HACK_BIN)/../utils

INCLUDES_1	= -I. -I$(srcdir) -I$(UTILS_SRC) -I$(HACK_SRC) -I../..
INCLUDES	= $(INCLUDES_1)  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/harfbuzz -I/usr/include/libxml2 -I/usr/include/libglade-2.0   -pthread -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng12 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  

UTIL_SRCS	= $(UTILS_SRC)/colors.c $(UTILS_SRC)/hsv.c \
		  $(UTILS_SRC)/resources.c $(UTILS_SRC)/usleep.c \
		  $(UTILS_SRC)/visual.c $(UTILS_SRC)/visual-gl.c \
		  $(UTILS_SRC)/yarandom.c $(UTILS_SRC)/xshm.c \
		  $(UTILS_SRC)/textclient.c
UTIL_OBJS	= $(UTILS_SRC)/colors.o $(UTILS_SRC)/hsv.o \
		  $(UTILS_SRC)/resources.o $(UTILS_SRC)/usleep.o \
		  $(UTILS_SRC)/visual.o $(UTILS_SRC)/visual-gl.o \
		   $(UTILS_SRC)/yarandom.o $(UTILS_SRC)/xshm.o \
		  $(UTILS_SRC)/textclient.o

SRCS		= xscreensaver-gl-helper.c normals.c glxfonts.c fps-gl.c \
		  atlantis.c b_draw.c b_lockglue.c b_sphere.c bubble3d.c \
		  buildlwo.c cage.c dolphin.c gears.c lament.c moebius.c \
		  morph3d.c pipeobjs.c pipes.c rubik.c s1_1.c s1_2.c s1_3.c \
		  s1_4.c s1_5.c s1_6.c s1_b.c shark.c sproingies.c \
		  sproingiewrap.c stairs.c superquadrics.c swim.c whale.c \
		  xlock-gl-utils.c xpm-ximage.c glplanet.c pulsar.c \
		  extrusion.c extrusion-helix2.c extrusion-helix3.c \
		  extrusion-helix4.c extrusion-joinoffset.c extrusion-screw.c \
		  extrusion-taper.c extrusion-twistoid.c sierpinski3d.c \
		  gflux.c stonerview.c stonerview-move.c stonerview-osc.c \
		  stonerview-view.c starwars.c glut_stroke.c glut_swidth.c \
		  gltext.c molecule.c dangerball.c sphere.c tube.c circuit.c \
		  menger.c engine.c flipscreen3d.c font-ximage.c dnalogo.c \
		  grab-ximage.c glsnake.c boxed.c glforestfire.c sballs.c \
		  cubenetic.c spheremonics.c marching.c lavalite.c rotator.c \
		  trackball.c gltrackball.c queens.c endgame.c chessmodels.c \
		  glblur.c gllist.c flurry.c flurry-smoke.c flurry-spark.c \
		  flurry-star.c flurry-texture.c atunnel.c tunnel_draw.c \
		  flyingtoasters.c toaster.c toaster_base.c toaster_handle.c \
		  toaster_handle2.c toaster_jet.c toaster_knob.c \
		  toaster_slots.c toaster_wing.c toast.c toast2.c \
		  bouncingcow.c cow_face.c cow_hide.c cow_hoofs.c cow_horns.c \
		  cow_tail.c cow_udder.c glslideshow.c jigglypuff.c klein.c \
		  hypertorus.c glmatrix.c cubestorm.c glknots.c blocktube.c \
		  flipflop.c antspotlight.c polytopes.c gleidescope.c \
		  mirrorblob.c blinkbox.c noof.c polyhedra.c polyhedra-gl.c \
		  antinspect.c providence.c pinion.c involute.c boing.c \
		  texfont.c carousel.c fliptext.c antmaze.c tangram.c \
		  tangram_shapes.c crackberg.c glhanoi.c cube21.c \
		  timetunnel.c juggler3d.c topblock.c glschool.c \
		  glschool_gl.c glschool_alg.c glcells.c voronoi.c \
		  moebiusgears.c lockward.c cubicgrid.c hypnowheel.c \
		  skytentacles.c teapot.c sonar.c sonar-sim.c sonar-icmp.c \
		  jigsaw.c photopile.c dropshadow.c rubikblocks.c surfaces.c \
		  hilbert.c companion.c companion_quad.c companion_disc.c \
		  companion_heart.c tronbit.c tronbit_idle1.c tronbit_idle2.c \
		  tronbit_no.c tronbit_yes.c jwzgles.c kaleidocycle.c \
		  quasicrystal.c unknownpleasures.c geodesic.c

OBJS		= xscreensaver-gl-helper.o normals.o glxfonts.o fps-gl.o \
		  atlantis.o b_draw.o b_lockglue.o b_sphere.o bubble3d.o \
		  buildlwo.o cage.o dolphin.o gears.o lament.o moebius.o \
		  morph3d.o pipeobjs.o pipes.o rubik.o s1_1.o s1_2.o s1_3.o \
		  s1_4.o s1_5.o s1_6.o s1_b.o shark.o sproingies.o \
		  sproingiewrap.o stairs.o superquadrics.o swim.o whale.o \
		  xlock-gl-utils.o xpm-ximage.o glplanet.o pulsar.o \
		  extrusion.o extrusion-helix2.o extrusion-helix3.o \
		  extrusion-helix4.o extrusion-joinoffset.o extrusion-screw.o \
		  extrusion-taper.o extrusion-twistoid.o sierpinski3d.o \
		  gflux.o stonerview.o stonerview-move.o stonerview-osc.o \
		  stonerview-view.o starwars.o glut_stroke.o glut_swidth.o \
		  gltext.o molecule.o dangerball.o sphere.o tube.o circuit.o \
		  menger.o engine.o flipscreen3d.o font-ximage.o dnalogo.o \
	          grab-ximage.o glsnake.o boxed.o glforestfire.o sballs.o \
		  cubenetic.o spheremonics.o marching.o lavalite.o rotator.o \
		  trackball.o gltrackball.o queens.o endgame.o chessmodels.o \
		  glblur.o gllist.o flurry.o flurry-smoke.o flurry-spark.o \
		  flurry-star.o flurry-texture.o atunnel.o tunnel_draw.o \
		  flyingtoasters.o toaster.o toaster_base.o toaster_handle.o \
		  toaster_handle2.o toaster_jet.o toaster_knob.o \
		  toaster_slots.o toaster_wing.o toast.o toast2.o \
		  bouncingcow.o cow_face.o cow_hide.o cow_hoofs.o cow_horns.o \
		  cow_tail.o cow_udder.o glslideshow.o jigglypuff.o klein.o \
		  hypertorus.o glmatrix.o cubestorm.o glknots.o blocktube.o \
		  flipflop.o antspotlight.o polytopes.o gleidescope.o \
		  mirrorblob.o blinkbox.o noof.o polyhedra.o polyhedra-gl.o \
		  antinspect.o providence.o pinion.o involute.o boing.o \
		  texfont.o carousel.o fliptext.o antmaze.o tangram.o \
		  tangram_shapes.o crackberg.o glhanoi.o cube21.o \
		  timetunnel.o juggler3d.o topblock.o glschool.o \
		  glschool_gl.o glschool_alg.o glcells.o voronoi.o \
		  moebiusgears.o lockward.o cubicgrid.o hypnowheel.o \
		  skytentacles.o teapot.o sonar.o sonar-sim.o sonar-icmp.o \
		  jigsaw.o photopile.o dropshadow.o rubikblocks.o surfaces.o \
		  hilbert.o companion.o companion_quad.o companion_disc.o \
		  companion_heart.o tronbit.o tronbit_idle1.o tronbit_idle2.o \
		  tronbit_no.o tronbit_yes.o jwzgles.o kaleidocycle.o \
		  quasicrystal.o unknownpleasures.o geodesic.o

GL_EXES		= cage gears moebius pipes sproingies stairs superquadrics \
		  morph3d rubik atlantis lament bubble3d glplanet pulsar \
		  sierpinski3d gflux stonerview starwars gltext molecule \
		  dangerball circuit menger engine flipscreen3d glsnake boxed \
		  sballs cubenetic spheremonics lavalite queens \
		  endgame glblur flurry atunnel flyingtoasters bouncingcow \
		  glslideshow jigglypuff klein hypertorus glmatrix cubestorm \
		  glknots blocktube flipflop antspotlight polytopes \
		  gleidescope mirrorblob blinkbox noof polyhedra \
		  antinspect providence pinion boing carousel fliptext \
		  antmaze tangram crackberg glhanoi cube21 timetunnel \
		  juggler3d topblock glschool glcells voronoi moebiusgears \
		  lockward cubicgrid hypnowheel skytentacles jigsaw photopile \
		  rubikblocks surfaces hilbert companioncube tronbit \
		  kaleidocycle quasicrystal unknownpleasures geodesic
GLE_EXES	= extrusion
SUID_EXES	= sonar
GL_UTIL_EXES	= xscreensaver-gl-helper
JWZGLES_OBJS	= 
HACK_EXES_1	= $(GL_EXES) 
HACK_EXES	= $(HACK_EXES_1) $(SUID_EXES)
XSHM_OBJS	= $(UTILS_BIN)/xshm.o
GRAB_OBJS	= $(UTILS_BIN)/grabclient.o grab-ximage.o $(XSHM_OBJS)
EXES		= $(GL_UTIL_EXES) $(HACK_EXES)

RETIRED_EXES	= $(RETIRED_GL_EXES)
RETIRED_GL_EXES	= glforestfire

FPS_OBJS	= fps-gl.o glxfonts.o $(HACK_BIN)/fps.o
FONT_OBJS	= texfont.o

HACK_OBJS	= $(JWZGLES_OBJS) $(HACK_BIN)/screenhack.o \
		  xlockmore-gl.o xlock-gl-utils.o ${FPS_OBJS} \
		  $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
		  $(UTILS_BIN)/visual-gl.o $(UTILS_BIN)/usleep.o \
		  $(UTILS_BIN)/yarandom.o $(UTILS_BIN)/hsv.o \
		  $(UTILS_BIN)/colors.o

HDRS		= atlantis.h bubble3d.h buildlwo.h e_textures.h xpm-ximage.h \
		  grab-ximage.h font-ximage.h tube.h sphere.h boxed.h \
		  stonerview.h stonerview-move.h stonerview-osc.h \
		  glutstroke.h glut_roman.h marching.h rotator.h trackball.h \
		  gltrackball.h chessmodels.h chessgames.h gllist.h flurry.h \
		  tunnel_draw.h ants.h polyhedra.h normals.h glxfonts.h \
		  texfont.h tangram_shapes.h sproingies.h extrusion.h \
		  glschool.h glschool_gl.h glschool_alg.h topblock.h \
		  involute.h teapot.h sonar.h dropshadow.h starwars.h \
		  jwzgles.h jwzglesI.h teapot2.h dnapizza.h cell.h
GL_MEN		= atlantis.man boxed.man bubble3d.man cage.man circuit.man \
		  cubenetic.man dangerball.man engine.man extrusion.man \
		  flipscreen3d.man gears.man gflux.man \
		  glplanet.man glsnake.man gltext.man lament.man lavalite.man \
		  menger.man moebius.man molecule.man morph3d.man pipes.man \
		  pulsar.man queens.man rubik.man sballs.man sierpinski3d.man \
		  spheremonics.man sproingies.man stairs.man starwars.man \
		  stonerview.man superquadrics.man xscreensaver-gl-helper.man \
		  endgame.man flurry.man glblur.man atunnel.man \
		  flyingtoasters.man bouncingcow.man glslideshow.man \
		  jigglypuff.man klein.man hypertorus.man glmatrix.man \
		  cubestorm.man glknots.man blocktube.man flipflop.man \
		  antspotlight.man polytopes.man gleidescope.man \
		  mirrorblob.man blinkbox.man noof.man polyhedra.man \
		  antinspect.man providence.man pinion.man boing.man \
		  carousel.man fliptext.man antmaze.man tangram.man \
		  crackberg.man glhanoi.man cube21.man timetunnel.man \
		  juggler3d.man topblock.man glschool.man glcells.man \
		  voronoi.man moebiusgears.man lockward.man cubicgrid.man \
		  hypnowheel.man skytentacles.man sonar.man jigsaw.man \
		  photopile.man rubikblocks.man surfaces.man hilbert.man \
		  companioncube.man tronbit.man kaleidocycle.man \
		  quasicrystal.man unknownpleasures.man geodesic.man
MEN		= $(GL_MEN)
RETIRED_MEN	= glforestfire.man
EXTRAS		= README Makefile.in dxf2gl.pl vrml2gl.pl wfront2gl.pl \
		  molecules.sh starwars.txt

TARFILES	= $(SRCS) $(HDRS) $(MEN) $(RETIRED_MEN) $(EXTRAS)


default: all
all: $(EXES) $(RETIRED_EXES)

install:   install-program    install-xml   install-man
uninstall: uninstall-program  uninstall-xml uninstall-man

install-strip:
	$(MAKE) INSTALL_PROGRAM='$(INSTALL_PROGRAM) -s' install

# the hacks, in $HACKDIR
install-program:: $(EXES)
	@exes="$(HACK_EXES_1)" ;					\
	 idir="$(install_prefix)$(HACKDIR)" ;				\
	 if [ "$$exes" != "" ]; then					\
	   if [ ! -d $$idir ]; then					\
	     $(INSTALL_DIRS) $$idir ;					\
	   fi ;								\
	   for program in $$exes; do					\
	     echo $(INSTALL_PROGRAM) $$program $$idir/$$program ;	\
		  $(INSTALL_PROGRAM) $$program $$idir/$$program ;	\
	   done ;							\
									\
	   exes="$(SUID_EXES)" ;					\
	   if [ no = yes ]; then				\
	     sinst="$(INSTALL_SETUID)" ;				\
	   else								\
	     sinst="$(INSTALL_PROGRAM)" ;				\
	   fi ;								\
	   for program in $$exes; do					\
	     echo $$sinst $$program $$idir/$$program ;			\
	     if   $$sinst $$program $$idir/$$program ; then		\
	        true ;							\
	     elif [ no = yes ]; then			\
	       echo $(INSTALL_PROGRAM) $$program $$idir/$$program ;	\
	       if   $(INSTALL_PROGRAM) $$program $$idir/$$program ; then\
	         echo "" ;						\
	         echo "WARNING: unable to install $$program setuid:"	\
	              "installed non-setuid instead." ;			\
	         echo "" ;						\
	       else							\
	         exit 1 ;						\
	       fi ;							\
	     else							\
	       exit 1 ;							\
	     fi ;							\
	   done ;							\
	 fi


# the xscreensaver-gl-helper program, in $bindir
install-program:: $(EXES)
	@exes="$(GL_UTIL_EXES)" ;					\
	 idir="$(install_prefix)$(bindir)" ;				\
	 if [ "$$exes" != "" ]; then					\
	   if [ ! -d $$idir ]; then					\
	     $(INSTALL_DIRS) $$idir ;					\
	   fi ;								\
	   for program in $$exes; do					\
	     echo $(INSTALL_PROGRAM) $$program $$idir/$$program ;	\
		  $(INSTALL_PROGRAM) $$program $$idir/$$program ;	\
	   done ;							\
	 fi

# When installing man pages, we install "foo.man" as "foo.N" and update
# the .TH line in the installed file with one like
#
#     .TH XScreenSaver N "V.VV (DD-MMM-YYYY)" "X Version 11"
#
# where N is the manual section suffix.
#
install-man: $(MEN)
	@men="$(MEN)" ;							\
	U=$(UTILS_SRC)/version.h ;					\
	V=`sed -n 's/.*xscreensaver \([0-9]\.[^)]*)\).*/\1/p' < $$U` ;		\
	T=/tmp/xs$$$$.$(mansuffix) ;					\
	TH=".TH XScreenSaver $(mansuffix) \"$$V\" \"X Version 11\"" ;	\
	echo "installing man pages: $$TH" ;				\
									\
	if [ ! -d $(install_prefix)$(manNdir) ]; then			\
	  $(INSTALL_DIRS) $(install_prefix)$(manNdir) ;			\
	 fi ;								\
									\
	for man in $$men; do						\
	  instname=`echo $$man | sed 's/\.man$$/\.$(mansuffix)/'` ;	\
	  manbase=`echo $$man | sed 's/\.man$$//'` ;    \
	  TH=".TH $$manbase $(mansuffix) \"$$V\" \"X Version 11\" \"XScreenSaver manual\"" ;   \
	  sed -e "s/^\.TH.*/$$TH/"					\
	      -e 's@(MANSUFFIX)@($(mansuffix))@g'			\
	    < $(srcdir)/$$man > $$T ;					\
	  echo $(INSTALL_DATA) $(srcdir)/$$man				\
	   $(install_prefix)$(manNdir)/$$instname ;			\
	  $(INSTALL_DATA) $$T						\
	    $(install_prefix)$(manNdir)/$$instname ;			\
	done ;								\
	rm -f $$T

install-xml:
	@dest=$(install_prefix)$(HACK_CONF_DIR) ;			\
	 if [ ! -d $$dest ]; then					\
	   $(INSTALL_DIRS) $$dest ;					\
	 fi ;								\
	 src=$(srcdir)/../config ;					\
	 for file in $(EXES) $(SCRIPTS) ; do				\
	   if [ -f $$src/$$file.xml ]; then				\
	     echo $(INSTALL_DATA) $$src/$$file.xml $$dest/$$file.xml ;	\
	          $(INSTALL_DATA) $$src/$$file.xml $$dest/$$file.xml ;	\
	   fi ;								\
	done

# the hacks, in $HACKDIR
uninstall-program::
	@exes="$(HACK_EXES) $(RETIRED_EXES)" ;				\
	 idir="$(install_prefix)$(HACKDIR)" ;				\
	 for program in $$exes; do					\
	   echo rm -f $$idir/$$program ;				\
		rm -f $$idir/$$program ;				\
	 done

# the xscreensaver-gl-helper program, in $bindir
uninstall-program::
	@exes="$(GL_UTIL_EXES)" ;					\
	 idir="$(install_prefix)$(bindir)" ;				\
	 for program in $$exes; do					\
	   echo rm -f $$idir/$$program ;				\
		rm -f $$idir/$$program ;				\
	done

uninstall-man:
	@men="$(MEN) $(RETIRED_MEN)" ;					\
	for man in $$men; do						\
	  instname=`echo $$man | sed 's/\.man$$/\.$(mansuffix)/'` ;	\
	  echo rm -f $(install_prefix)$(manNdir)/$$instname* ;		\
	       rm -f $(install_prefix)$(manNdir)/$$instname* ;		\
	done

uninstall-xml:
	@dest=$(install_prefix)$(HACK_CONF_DIR) ;			\
	 for file in $(EXES) $(RETIRED_EXES) $(SCRIPTS) ; do		\
	     echo rm -f $$dest/$$file.xml ;				\
	          rm -f $$dest/$$file.xml ;				\
	done

clean:
	-rm -f *.o a.out core $(EXES) $(RETIRED_EXES) molecules.h

distclean: clean
	-rm -f Makefile TAGS *~ "#"*

# Adds all current dependencies to Makefile
depend:
	$(DEPEND) -s '# DO NOT DELETE: updated by make depend'		    \
	$(DEPEND_FLAGS) --						    \
	$(INCLUDES) $(DEFS) $(DEPEND_DEFINES) $(CFLAGS) $(X_CFLAGS) --	    \
	$(SRCS)

# Adds some dependencies to Makefile.in -- not totally accurate, but pretty
# close.  This excludes dependencies on files in /usr/include, etc.  It tries
# to include only dependencies on files which are themselves a part of this
# package.
distdepend:: molecules.h
	@echo updating dependencies in `pwd`/Makefile.in... ;		    \
	$(DEPEND) -w 0 -f - 						    \
	-s '# DO NOT DELETE: updated by make distdepend' $(DEPEND_FLAGS) -- \
	$(INCLUDES_1) $(DEFS) $(DEPEND_DEFINES) $(CFLAGS) $(X_CFLAGS) --    \
	$(SRCS) 2>/dev/null |						    \
	sort -d |							    \
	(								    \
	  awk '/^# .*Makefile.in ---/,/^# DO .*distdepend/' < Makefile.in ; \
	  sed -e '/^#.*/d'						    \
	      -e 's@ \./@ @g;s@ /[^ ]*@@g;/^.*:$$/d'			    \
	      -e 's@\.\./\.\./utils@$$(UTILS_SRC)@g'			    \
	      -e 's@\.\./glx/@@g'					    \
	      -e 's@ \.\./@ $$(HACK_SRC)/@g'				    \
	      -e 's@ \([^$$]\)@ $$(srcdir)/\1@g'			    \
	      -e 's@ $$(srcdir)/\(.*config.h\)@ \1@g'			    \
	      -e 's@ $$(HACK_SRC)/\(.*config.h\)@ ../\1@g'		    \
	      -e 's@ $$(srcdir)/\(.*molecules.h\)@ \1@g' ;		    \
	  echo ''							    \
	) > /tmp/distdepend.$$$$ &&					    \
	mv Makefile.in Makefile.in.bak &&				    \
	mv /tmp/distdepend.$$$$ Makefile.in


TAGS: tags
tags:
	find $(srcdir) -name '*.[chly]' -print | xargs etags -a

echo_tarfiles:
	@echo $(TARFILES)

check_men:
	@badmen="" ;							\
	 for exe in $(EXES); do						\
	   if ! [ -f $(srcdir)/$$exe.man ]; then			\
	     badmen="$$badmen $$exe" ;					\
	   fi ;								\
	 done ;								\
	 if [ -n "$$badmen" ]; then					\
	   echo "" ;							\
	   echo "Warning: The following programs have no manuals:" ;	\
	   echo "" ;							\
	   for m in $$badmen ; do					\
	     echo "    $$m" ;						\
	   done ;							\
	 fi

validate_xml:
	@echo "Validating XML..." ; \
	cd $(HACK_SRC) ; ./check-configs.pl $(EXES)

distdepend:: check_men validate_xml



# Rules for noticing when the objects from the utils directory are out of
# date with respect to their sources, and going and building them according
# to the rules in their own Makefile...
#
$(UTILS_BIN)/colors.o:		$(UTILS_SRC)/colors.c
$(UTILS_BIN)/grabclient.o:	$(UTILS_SRC)/grabclient.c
$(UTILS_BIN)/hsv.o:		$(UTILS_SRC)/hsv.c
$(UTILS_BIN)/resources.o:	$(UTILS_SRC)/resources.c
$(UTILS_BIN)/usleep.o:		$(UTILS_SRC)/usleep.c
$(UTILS_BIN)/visual.o:		$(UTILS_SRC)/visual.c
$(UTILS_BIN)/visual-gl.o:	$(UTILS_SRC)/visual-gl.c
$(UTILS_BIN)/yarandom.o:	$(UTILS_SRC)/yarandom.c
$(UTILS_BIN)/xshm.o:		$(UTILS_SRC)/xshm.c
$(UTILS_BIN)/textclient.o:	$(UTILS_SRC)/textclient.c

$(UTIL_OBJS):
	$(MAKE) -C $(UTILS_BIN) $(@F) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"

$(HACK_BIN)/xlockmore.o: $(HACK_SRC)/xlockmore.c
	$(MAKE) -C $(HACK_BIN) $(@F) CC="$(CC)" CFLAGS="$(CFLAGS)"


# How we build object files in this directory.
.c.o:
	$(CC) -c $(INCLUDES) $(DEFS) $(CFLAGS) $(X_CFLAGS) $<


# How to build the "xscreensaver-gl-helper" program, that lets the daemon
# know which visual is the right one for GL programs.
#
HELPER_OBJS = xscreensaver-gl-helper.o $(UTILS_BIN)/visual-gl.o \
	      $(UTILS_BIN)/visual.o $(UTILS_BIN)/resources.o
xscreensaver-gl-helper: $(HELPER_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(HELPER_OBJS) $(LIBS) $(X_LIBS) $(HACK_POST2)


# These hacks use a slightly-differently-compiled variant of xlockmore.c.
# This is how to make the the other .o file from it.
#
XLM_CFLAGS=-DUSE_GL $(INCLUDES) $(DEFS) $(CFLAGS) $(X_CFLAGS)
xlockmore-gl.o: $(HACK_SRC)/xlockmore.c
	$(CC) -o $@ -c $(XLM_CFLAGS) $(HACK_SRC)/xlockmore.c

CC_HACK		= $(CC) $(LDFLAGS)

TRACK_OBJS=rotator.o trackball.o gltrackball.o
HACK_TRACK_OBJS=$(HACK_OBJS) $(TRACK_OBJS)
HACK_GRAB_OBJS=$(HACK_OBJS) $(GRAB_OBJS)
HACK_TRACK_GRAB_OBJS=$(HACK_TRACK_OBJS) $(GRAB_OBJS)
TEXT=$(UTILS_BIN)/textclient.o

ATLANTIS_OBJS = $(HACK_OBJS) dolphin.o shark.o swim.o whale.o xpm-ximage.o
atlantis:	atlantis.o	$(ATLANTIS_OBJS)
	$(CC_HACK) -o $@ $@.o	$(ATLANTIS_OBJS) $(XPM_LIBS)

ATUNNEL_OBJS = $(HACK_OBJS) tunnel_draw.o xpm-ximage.o
atunnel:	atunnel.o	$(ATUNNEL_OBJS)
	$(CC_HACK) -o $@ $@.o   $(ATUNNEL_OBJS) $(XPM_LIBS)

cage:		cage.o		xpm-ximage.o $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_OBJS) $(XPM_LIBS)

FLURRY_OBJS_1 = flurry-smoke.o flurry-spark.o flurry-star.o flurry-texture.o
FLURRY_OBJS = $(FLURRY_OBJS_1) $(HACK_OBJS)

flurry:		flurry.o	$(FLURRY_OBJS)
	$(CC_HACK) -o $@ $@.o	$(FLURRY_OBJS) $(HACK_LIBS) -lm

GEARS_OBJS=normals.o involute.o $(HACK_TRACK_OBJS)
gears:		gears.o		tube.o $(GEARS_OBJS)
	$(CC_HACK) -o $@ $@.o	tube.o $(GEARS_OBJS) $(HACK_LIBS)

MOEBIUS_OBJS=sphere.o tube.o xpm-ximage.o $(HACK_TRACK_OBJS)
moebius:	moebius.o	$(MOEBIUS_OBJS)
	$(CC_HACK) -o $@ $@.o	$(MOEBIUS_OBJS) $(HACK_LIBS) $(XPM_LIBS)

PIPE_OBJS=pipeobjs.o buildlwo.o sphere.o teapot.o normals.o
pipes:		pipes.o		$(PIPE_OBJS) $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(PIPE_OBJS) $(HACK_TRACK_OBJS) $(HACK_LIBS)

superquadrics:	superquadrics.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

morph3d:	morph3d.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

rubik:		rubik.o		$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

stairs:		stairs.o	sphere.o xpm-ximage.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o xpm-ximage.o $(HACK_TRACK_OBJS) \
				$(HACK_LIBS) $(XPM_LIBS)

SPROINGIES = sproingiewrap.o gllist.o \
	     s1_1.o s1_2.o s1_3.o s1_4.o s1_5.o s1_6.o s1_b.o
sproingies: sproingies.o	$(HACK_OBJS) $(SPROINGIES)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SPROINGIES) $(HACK_LIBS)

LAMENTOBJS = $(HACK_TRACK_OBJS) xpm-ximage.o normals.o
lament:		lament.o	$(LAMENTOBJS)
	$(CC_HACK) -o $@ $@.o	$(LAMENTOBJS) $(XPM_LIBS)

B3D_OBJS = b_sphere.o b_draw.o b_lockglue.o $(HACK_OBJS)
bubble3d:	bubble3d.o	$(B3D_OBJS)
	$(CC_HACK) -o $@ $@.o	$(B3D_OBJS) $(HACK_LIBS)

PLANET_OBJS=sphere.o xpm-ximage.o $(HACK_TRACK_OBJS)
glplanet:	glplanet.o	$(PLANET_OBJS)
	$(CC_HACK) -o $@ $@.o   $(PLANET_OBJS) $(XPM_LIBS)

pulsar:		pulsar.o	$(HACK_OBJS) xpm-ximage.o
	$(CC_HACK) -o $@ $@.o   $(HACK_OBJS) xpm-ximage.o $(XPM_LIBS)

EXTRUSION_OBJS=extrusion.o extrusion-helix2.o extrusion-helix3.o    \
	extrusion-helix4.o extrusion-joinoffset.o extrusion-screw.o \
	extrusion-taper.o extrusion-twistoid.o xpm-ximage.o \
	$(HACK_TRACK_OBJS)
extrusion:			$(EXTRUSION_OBJS)
	$(CC_HACK) -o $@	$(EXTRUSION_OBJS) $(XPM_LIBS) $(GLE_LIBS)

sierpinski3d:	sierpinski3d.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o   $(HACK_TRACK_OBJS) $(HACK_LIBS)

gflux:		gflux.o		$(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o   $(HACK_TRACK_GRAB_OBJS) $(HACK_LIBS)

SW_OBJS=starwars.o glut_stroke.o glut_swidth.o \
        $(TEXT) ${FONT_OBJS} $(HACK_OBJS)
starwars:			$(SW_OBJS)
	$(CC_HACK) -o $@	$(SW_OBJS) $(HACK_LIBS) $(TEXT_LIBS)

GLT_OBJS=gltext.o glut_stroke.o glut_swidth.o tube.o sphere.o \
	 $(TEXT) $(HACK_TRACK_OBJS)
gltext:				$(GLT_OBJS)
	$(CC_HACK) -o $@	$(GLT_OBJS) $(HACK_LIBS) $(TEXT_LIBS)

DB_OBJS=sphere.o tube.o $(HACK_TRACK_OBJS)
dangerball:	dangerball.o	$(DB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(DB_OBJS) $(HACK_LIBS)

lichen:		lichen.o	$(DB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(DB_OBJS) $(HACK_LIBS)

circuit:	circuit.o	font-ximage.o $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o   font-ximage.o $(HACK_OBJS) $(HACK_LIBS)

menger:		menger.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o   $(HACK_TRACK_OBJS) $(HACK_LIBS)

engine:		engine.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o   $(HACK_TRACK_OBJS) $(HACK_LIBS)

flipscreen3d:	flipscreen3d.o	$(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_GRAB_OBJS) $(HACK_LIBS)

glsnake:	glsnake.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

boxed:		boxed.o		$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

glforestfire:	glforestfire.o	xpm-ximage.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_TRACK_OBJS) $(XPM_LIBS)

sballs:		sballs.o	xpm-ximage.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_TRACK_OBJS) $(XPM_LIBS)

cubenetic:	cubenetic.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

spheremonics:	spheremonics.o	normals.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	normals.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

LL_OBJS=marching.o xpm-ximage.o normals.o $(HACK_TRACK_OBJS)
lavalite:	lavalite.o	$(LL_OBJS)
	$(CC_HACK) -o $@ $@.o	$(LL_OBJS) $(XPM_LIBS)

queens:		queens.o	chessmodels.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o   chessmodels.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

endgame:	endgame.o	chessmodels.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o   chessmodels.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

glblur:	glblur.o		$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

TOAST_OBJS=\
  toaster.o toaster_base.o toaster_handle.o toaster_handle2.o \
  toaster_jet.o toaster_knob.o toaster_slots.o toaster_wing.o \
  toast.o toast2.o \
  flyingtoasters.o gllist.o xpm-ximage.o $(HACK_TRACK_OBJS)
flyingtoasters:			$(TOAST_OBJS)
	$(CC_HACK) -o $@	$(TOAST_OBJS) $(XPM_LIBS)

COW_OBJS=\
  cow_face.o cow_hide.o cow_hoofs.o cow_horns.o cow_tail.o cow_udder.o \
  bouncingcow.o gllist.o xpm-ximage.o $(HACK_TRACK_OBJS)
bouncingcow:			$(COW_OBJS)	    
	$(CC_HACK) -o $@	$(COW_OBJS) $(XPM_LIBS)

glslideshow:	glslideshow.o	$(HACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_GRAB_OBJS) $(HACK_LIBS)

jigglypuff:	jigglypuff.o	xpm-ximage.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_TRACK_OBJS) $(XPM_LIBS)

klein:		klein.o		$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

surfaces:	surfaces.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

hypertorus:	hypertorus.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

glmatrix:	glmatrix.o	xpm-ximage.o $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_OBJS) $(XPM_LIBS)

cubestorm:	cubestorm.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

glknots:	glknots.o	tube.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	tube.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

blocktube:	blocktube.o	xpm-ximage.o $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_OBJS) $(XPM_LIBS)

flipflop:	flipflop.o	$(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_GRAB_OBJS) $(HACK_LIBS)

antspotlight:	antspotlight.o	sphere.o $(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o $(HACK_TRACK_GRAB_OBJS) $(HACK_LIBS)

polytopes:	polytopes.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

STONER_OBJS=stonerview-move.o stonerview-osc.o stonerview-view.o
stonerview:	stonerview.o	$(STONER_OBJS) $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(STONER_OBJS) $(HACK_TRACK_OBJS) $(HACK_LIBS)


molecules.h:
	@echo "building molecules.h from $(HACK_SRC)/images/molecules/*.pdb"; \
	UTILS_SRC="$(UTILS_SRC)" \
	$(srcdir)/molecules.sh molecules.h $(HACK_SRC)/images/molecules/*.pdb

MOLECULE_OBJS=sphere.o tube.o $(HACK_TRACK_OBJS)
molecule.o:	molecules.h
molecule:	molecule.o	$(MOLECULE_OBJS)
	$(CC_HACK) -o $@ $@.o   $(MOLECULE_OBJS) $(HACK_LIBS)

gleidescope:	gleidescope.o	xpm-ximage.o $(HACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	xpm-ximage.o $(HACK_GRAB_OBJS) $(XPM_LIBS)

mirrorblob:	mirrorblob.o	$(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_GRAB_OBJS) $(XPM_LIBS)

blinkbox:	blinkbox.o	sphere.o $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o $(HACK_OBJS) $(HACK_LIBS)

noof:	noof.o			$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

PH_OBJS=polyhedra-gl.o normals.o teapot.o $(HACK_TRACK_OBJS)
polyhedra:	polyhedra.o 	$(PH_OBJS)
	$(CC_HACK) -o $@ $@.o	$(PH_OBJS) $(HACK_LIBS)

antinspect:	antinspect.o	sphere.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

providence:	providence.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

pinion:		pinion.o	$(GEARS_OBJS)
	$(CC_HACK) -o $@ $@.o	$(GEARS_OBJS) $(HACK_LIBS)

moebiusgears:	moebiusgears.o	$(GEARS_OBJS)
	$(CC_HACK) -o $@ $@.o	$(GEARS_OBJS) $(HACK_LIBS)

boing:		boing.o		normals.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	normals.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

carousel:	carousel.o	${FONT_OBJS} $(HACK_TRACK_GRAB_OBJS)
	$(CC_HACK) -o $@ $@.o	${FONT_OBJS} $(HACK_TRACK_GRAB_OBJS) $(HACK_LIBS)

fliptext:	fliptext.o	$(TEXT) ${FONT_OBJS} $(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(TEXT) ${FONT_OBJS} $(HACK_OBJS) $(HACK_LIBS) $(TEXT_LIBS)

antmaze:	antmaze.o	sphere.o tube.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o tube.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

TANGRAM_OBJS=tangram_shapes.o $(HACK_OBJS)
tangram:	tangram.o	$(TANGRAM_OBJS)
	$(CC_HACK) -o $@ $@.o	$(TANGRAM_OBJS) $(HACK_LIBS)

crackberg:	crackberg.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

glhanoi:	glhanoi.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

cube21:		cube21.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

TIMETUNNEL_OBJS = xpm-ximage.o  $(HACK_TRACK_OBJS)
timetunnel:	timetunnel.o	$(TIMETUNNEL_OBJS)
	$(CC_HACK) -o $@ $@.o   $(TIMETUNNEL_OBJS) $(XPM_LIBS)

JUGG_OBJS=sphere.o tube.o $(HACK_TRACK_OBJS)
juggler3d:	juggler3d.o	$(JUGG_OBJS)
	$(CC_HACK) -o $@ $@.o	$(JUGG_OBJS) $(HACK_LIBS)

dnalogo:	dnalogo.o      tube.o normals.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o  tube.o normals.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

topblock:	topblock.o	sphere.o tube.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	sphere.o tube.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

SCHOOL_OBJS=glschool.o glschool_alg.o glschool_gl.o \
	    sphere.o tube.o normals.o $(HACK_OBJS)
glschool: $(SCHOOL_OBJS)
	$(CC_HACK) -o $@ $(SCHOOL_OBJS) $(HACK_LIBS)

glcells:	glcells.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

voronoi:	voronoi.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

lockward:	lockward.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

cubicgrid:	cubicgrid.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

hypnowheel:	hypnowheel.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

TENTACLE_OBJS=normals.o xpm-ximage.o $(HACK_TRACK_OBJS)
skytentacles:	skytentacles.o	$(TENTACLE_OBJS)
	$(CC_HACK) -o $@ $@.o	$(TENTACLE_OBJS) $(XPM_LIBS)

SONAR_OBJS=sonar-sim.o sonar-icmp.o ${FONT_OBJS} $(HACK_TRACK_OBJS)
sonar:		sonar.o		$(SONAR_OBJS)
	$(CC_HACK) -o $@ $@.o	$(SONAR_OBJS) $(HACK_LIBS)

JIGSAW_OBJS=normals.o $(UTILS_BIN)/spline.o \
	${FONT_OBJS} $(HACK_TRACK_GRAB_OBJS)
jigsaw:		jigsaw.o	$(JIGSAW_OBJS)
	$(CC_HACK) -o $@ $@.o	$(JIGSAW_OBJS) $(HACK_LIBS)

PHOTOPILE_OBJS=${FONT_OBJS} dropshadow.o  $(HACK_GRAB_OBJS)
photopile:	photopile.o	$(PHOTOPILE_OBJS)
	$(CC_HACK) -o $@ $@.o	$(PHOTOPILE_OBJS) $(HACK_LIBS)

rubikblocks:	rubikblocks.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

HILB_OBJS=sphere.o tube.o $(HACK_TRACK_OBJS)
hilbert:	hilbert.o	$(HILB_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HILB_OBJS) $(HACK_LIBS)

CCUBE_OBJS=companion.o companion_quad.o companion_disc.o companion_heart.o \
 gllist.o $(HACK_TRACK_OBJS)
companioncube:			$(CCUBE_OBJS)
	$(CC_HACK) -o $@	$(CCUBE_OBJS) $(HACK_LIBS)

TBIT_OBJS=tronbit.o tronbit_idle1.o tronbit_idle2.o tronbit_no.o tronbit_yes.o\
 gllist.o $(HACK_TRACK_OBJS)
tronbit:			$(TBIT_OBJS)
	$(CC_HACK) -o $@	$(TBIT_OBJS) $(HACK_LIBS)

KALEIDOCYCLE_OBJS=kaleidocycle.o normals.o $(HACK_TRACK_OBJS)
kaleidocycle:			$(KALEIDOCYCLE_OBJS)
	$(CC_HACK) -o $@	$(KALEIDOCYCLE_OBJS) $(HACK_LIBS)

quasicrystal:	quasicrystal.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

unknownpleasures: unknownpleasures.o	$(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_TRACK_OBJS) $(HACK_LIBS)

geodesic: geodesic.o		 normals.o $(HACK_TRACK_OBJS)
	$(CC_HACK) -o $@ $@.o	 normals.o $(HACK_TRACK_OBJS) $(HACK_LIBS)

##############################################################################
#
# DO NOT DELETE: updated by make distdepend

antinspect.o: ../../config.h
antinspect.o: $(HACK_SRC)/fps.h
antinspect.o: $(srcdir)/gltrackball.h
antinspect.o: $(HACK_SRC)/screenhackI.h
antinspect.o: $(srcdir)/sphere.h
antinspect.o: $(UTILS_SRC)/colors.h
antinspect.o: $(UTILS_SRC)/grabscreen.h
antinspect.o: $(UTILS_SRC)/hsv.h
antinspect.o: $(UTILS_SRC)/resources.h
antinspect.o: $(UTILS_SRC)/usleep.h
antinspect.o: $(UTILS_SRC)/visual.h
antinspect.o: $(UTILS_SRC)/xshm.h
antinspect.o: $(UTILS_SRC)/yarandom.h
antinspect.o: $(HACK_SRC)/xlockmore.h
antinspect.o: $(HACK_SRC)/xlockmoreI.h
antmaze.o: $(srcdir)/ants.h
antmaze.o: ../../config.h
antmaze.o: $(HACK_SRC)/fps.h
antmaze.o: $(srcdir)/gltrackball.h
antmaze.o: $(srcdir)/rotator.h
antmaze.o: $(HACK_SRC)/screenhackI.h
antmaze.o: $(srcdir)/sphere.h
antmaze.o: $(srcdir)/tube.h
antmaze.o: $(UTILS_SRC)/colors.h
antmaze.o: $(UTILS_SRC)/grabscreen.h
antmaze.o: $(UTILS_SRC)/hsv.h
antmaze.o: $(UTILS_SRC)/resources.h
antmaze.o: $(UTILS_SRC)/usleep.h
antmaze.o: $(UTILS_SRC)/visual.h
antmaze.o: $(UTILS_SRC)/xshm.h
antmaze.o: $(UTILS_SRC)/yarandom.h
antmaze.o: $(HACK_SRC)/xlockmore.h
antmaze.o: $(HACK_SRC)/xlockmoreI.h
antspotlight.o: $(srcdir)/ants.h
antspotlight.o: ../../config.h
antspotlight.o: $(HACK_SRC)/fps.h
antspotlight.o: $(srcdir)/gltrackball.h
antspotlight.o: $(srcdir)/grab-ximage.h
antspotlight.o: $(srcdir)/rotator.h
antspotlight.o: $(HACK_SRC)/screenhackI.h
antspotlight.o: $(srcdir)/sphere.h
antspotlight.o: $(srcdir)/tube.h
antspotlight.o: $(UTILS_SRC)/colors.h
antspotlight.o: $(UTILS_SRC)/grabscreen.h
antspotlight.o: $(UTILS_SRC)/hsv.h
antspotlight.o: $(UTILS_SRC)/resources.h
antspotlight.o: $(UTILS_SRC)/usleep.h
antspotlight.o: $(UTILS_SRC)/visual.h
antspotlight.o: $(UTILS_SRC)/xshm.h
antspotlight.o: $(UTILS_SRC)/yarandom.h
antspotlight.o: $(HACK_SRC)/xlockmore.h
antspotlight.o: $(HACK_SRC)/xlockmoreI.h
atlantis.o: $(srcdir)/atlantis.h
atlantis.o: ../../config.h
atlantis.o: $(HACK_SRC)/fps.h
atlantis.o: $(HACK_SRC)/images/sea-texture.xpm
atlantis.o: $(HACK_SRC)/screenhackI.h
atlantis.o: $(UTILS_SRC)/colors.h
atlantis.o: $(UTILS_SRC)/grabscreen.h
atlantis.o: $(UTILS_SRC)/hsv.h
atlantis.o: $(UTILS_SRC)/resources.h
atlantis.o: $(UTILS_SRC)/usleep.h
atlantis.o: $(UTILS_SRC)/visual.h
atlantis.o: $(UTILS_SRC)/xshm.h
atlantis.o: $(UTILS_SRC)/yarandom.h
atlantis.o: $(HACK_SRC)/xlockmore.h
atlantis.o: $(HACK_SRC)/xlockmoreI.h
atlantis.o: $(srcdir)/xpm-ximage.h
atunnel.o: ../../config.h
atunnel.o: $(HACK_SRC)/fps.h
atunnel.o: $(HACK_SRC)/images/tunnel0.xpm
atunnel.o: $(HACK_SRC)/images/tunnel1.xpm
atunnel.o: $(HACK_SRC)/images/tunnel2.xpm
atunnel.o: $(HACK_SRC)/images/tunnel3.xpm
atunnel.o: $(HACK_SRC)/images/tunnel4.xpm
atunnel.o: $(HACK_SRC)/images/tunnel5.xpm
atunnel.o: $(HACK_SRC)/screenhackI.h
atunnel.o: $(srcdir)/tunnel_draw.h
atunnel.o: $(UTILS_SRC)/colors.h
atunnel.o: $(UTILS_SRC)/grabscreen.h
atunnel.o: $(UTILS_SRC)/hsv.h
atunnel.o: $(UTILS_SRC)/resources.h
atunnel.o: $(UTILS_SRC)/usleep.h
atunnel.o: $(UTILS_SRC)/visual.h
atunnel.o: $(UTILS_SRC)/xshm.h
atunnel.o: $(UTILS_SRC)/yarandom.h
atunnel.o: $(HACK_SRC)/xlockmore.h
atunnel.o: $(HACK_SRC)/xlockmoreI.h
atunnel.o: $(srcdir)/xpm-ximage.h
b_draw.o: $(srcdir)/bubble3d.h
b_draw.o: ../../config.h
b_draw.o: $(HACK_SRC)/fps.h
b_draw.o: $(HACK_SRC)/screenhackI.h
b_draw.o: $(UTILS_SRC)/colors.h
b_draw.o: $(UTILS_SRC)/grabscreen.h
b_draw.o: $(UTILS_SRC)/hsv.h
b_draw.o: $(UTILS_SRC)/resources.h
b_draw.o: $(UTILS_SRC)/usleep.h
b_draw.o: $(UTILS_SRC)/visual.h
b_draw.o: $(UTILS_SRC)/xshm.h
b_draw.o: $(UTILS_SRC)/yarandom.h
b_draw.o: $(HACK_SRC)/xlockmoreI.h
blinkbox.o: ../../config.h
blinkbox.o: $(HACK_SRC)/fps.h
blinkbox.o: $(HACK_SRC)/screenhackI.h
blinkbox.o: $(srcdir)/sphere.h
blinkbox.o: $(UTILS_SRC)/colors.h
blinkbox.o: $(UTILS_SRC)/grabscreen.h
blinkbox.o: $(UTILS_SRC)/hsv.h
blinkbox.o: $(UTILS_SRC)/resources.h
blinkbox.o: $(UTILS_SRC)/usleep.h
blinkbox.o: $(UTILS_SRC)/visual.h
blinkbox.o: $(UTILS_SRC)/xshm.h
blinkbox.o: $(UTILS_SRC)/yarandom.h
blinkbox.o: $(HACK_SRC)/xlockmore.h
blinkbox.o: $(HACK_SRC)/xlockmoreI.h
b_lockglue.o: $(srcdir)/bubble3d.h
b_lockglue.o: ../../config.h
b_lockglue.o: $(HACK_SRC)/fps.h
b_lockglue.o: $(HACK_SRC)/screenhackI.h
b_lockglue.o: $(UTILS_SRC)/colors.h
b_lockglue.o: $(UTILS_SRC)/grabscreen.h
b_lockglue.o: $(UTILS_SRC)/hsv.h
b_lockglue.o: $(UTILS_SRC)/resources.h
b_lockglue.o: $(UTILS_SRC)/usleep.h
b_lockglue.o: $(UTILS_SRC)/visual.h
b_lockglue.o: $(UTILS_SRC)/xshm.h
b_lockglue.o: $(UTILS_SRC)/yarandom.h
b_lockglue.o: $(HACK_SRC)/xlockmore.h
b_lockglue.o: $(HACK_SRC)/xlockmoreI.h
blocktube.o: ../../config.h
blocktube.o: $(HACK_SRC)/fps.h
blocktube.o: $(HACK_SRC)/images/blocktube.xpm
blocktube.o: $(HACK_SRC)/screenhackI.h
blocktube.o: $(UTILS_SRC)/colors.h
blocktube.o: $(UTILS_SRC)/grabscreen.h
blocktube.o: $(UTILS_SRC)/hsv.h
blocktube.o: $(UTILS_SRC)/resources.h
blocktube.o: $(UTILS_SRC)/usleep.h
blocktube.o: $(UTILS_SRC)/visual.h
blocktube.o: $(UTILS_SRC)/xshm.h
blocktube.o: $(UTILS_SRC)/yarandom.h
blocktube.o: $(HACK_SRC)/xlockmore.h
blocktube.o: $(HACK_SRC)/xlockmoreI.h
blocktube.o: $(srcdir)/xpm-ximage.h
boing.o: ../../config.h
boing.o: $(HACK_SRC)/fps.h
boing.o: $(srcdir)/gltrackball.h
boing.o: $(HACK_SRC)/screenhackI.h
boing.o: $(UTILS_SRC)/colors.h
boing.o: $(UTILS_SRC)/grabscreen.h
boing.o: $(UTILS_SRC)/hsv.h
boing.o: $(UTILS_SRC)/resources.h
boing.o: $(UTILS_SRC)/usleep.h
boing.o: $(UTILS_SRC)/visual.h
boing.o: $(UTILS_SRC)/xshm.h
boing.o: $(UTILS_SRC)/yarandom.h
boing.o: $(HACK_SRC)/xlockmore.h
boing.o: $(HACK_SRC)/xlockmoreI.h
bouncingcow.o: ../../config.h
bouncingcow.o: $(HACK_SRC)/fps.h
bouncingcow.o: $(srcdir)/gllist.h
bouncingcow.o: $(srcdir)/gltrackball.h
bouncingcow.o: $(srcdir)/rotator.h
bouncingcow.o: $(HACK_SRC)/screenhackI.h
bouncingcow.o: $(UTILS_SRC)/colors.h
bouncingcow.o: $(UTILS_SRC)/grabscreen.h
bouncingcow.o: $(UTILS_SRC)/hsv.h
bouncingcow.o: $(UTILS_SRC)/resources.h
bouncingcow.o: $(UTILS_SRC)/usleep.h
bouncingcow.o: $(UTILS_SRC)/visual.h
bouncingcow.o: $(UTILS_SRC)/xshm.h
bouncingcow.o: $(UTILS_SRC)/yarandom.h
bouncingcow.o: $(HACK_SRC)/xlockmore.h
bouncingcow.o: $(HACK_SRC)/xlockmoreI.h
bouncingcow.o: $(srcdir)/xpm-ximage.h
boxed.o: $(srcdir)/boxed.h
boxed.o: ../../config.h
boxed.o: $(HACK_SRC)/fps.h
boxed.o: $(HACK_SRC)/screenhackI.h
boxed.o: $(UTILS_SRC)/colors.h
boxed.o: $(UTILS_SRC)/grabscreen.h
boxed.o: $(UTILS_SRC)/hsv.h
boxed.o: $(UTILS_SRC)/resources.h
boxed.o: $(UTILS_SRC)/usleep.h
boxed.o: $(UTILS_SRC)/visual.h
boxed.o: $(UTILS_SRC)/xshm.h
boxed.o: $(UTILS_SRC)/yarandom.h
boxed.o: $(HACK_SRC)/xlockmore.h
boxed.o: $(HACK_SRC)/xlockmoreI.h
b_sphere.o: $(srcdir)/bubble3d.h
b_sphere.o: ../../config.h
b_sphere.o: $(HACK_SRC)/fps.h
b_sphere.o: $(HACK_SRC)/screenhackI.h
b_sphere.o: $(UTILS_SRC)/colors.h
b_sphere.o: $(UTILS_SRC)/grabscreen.h
b_sphere.o: $(UTILS_SRC)/hsv.h
b_sphere.o: $(UTILS_SRC)/resources.h
b_sphere.o: $(UTILS_SRC)/usleep.h
b_sphere.o: $(UTILS_SRC)/visual.h
b_sphere.o: $(UTILS_SRC)/xshm.h
b_sphere.o: $(UTILS_SRC)/yarandom.h
b_sphere.o: $(HACK_SRC)/xlockmoreI.h
bubble3d.o: $(srcdir)/bubble3d.h
bubble3d.o: ../../config.h
bubble3d.o: $(HACK_SRC)/fps.h
bubble3d.o: $(HACK_SRC)/screenhackI.h
bubble3d.o: $(UTILS_SRC)/colors.h
bubble3d.o: $(UTILS_SRC)/grabscreen.h
bubble3d.o: $(UTILS_SRC)/hsv.h
bubble3d.o: $(UTILS_SRC)/resources.h
bubble3d.o: $(UTILS_SRC)/usleep.h
bubble3d.o: $(UTILS_SRC)/visual.h
bubble3d.o: $(UTILS_SRC)/xshm.h
bubble3d.o: $(UTILS_SRC)/yarandom.h
bubble3d.o: $(HACK_SRC)/xlockmoreI.h
buildlwo.o: $(srcdir)/buildlwo.h
buildlwo.o: ../../config.h
cage.o: ../../config.h
cage.o: $(HACK_SRC)/fps.h
cage.o: $(HACK_SRC)/images/wood.xpm
cage.o: $(HACK_SRC)/screenhackI.h
cage.o: $(UTILS_SRC)/colors.h
cage.o: $(UTILS_SRC)/grabscreen.h
cage.o: $(UTILS_SRC)/hsv.h
cage.o: $(UTILS_SRC)/resources.h
cage.o: $(UTILS_SRC)/usleep.h
cage.o: $(UTILS_SRC)/visual.h
cage.o: $(UTILS_SRC)/xshm.h
cage.o: $(UTILS_SRC)/yarandom.h
cage.o: $(HACK_SRC)/xlockmore.h
cage.o: $(HACK_SRC)/xlockmoreI.h
cage.o: $(srcdir)/xpm-ximage.h
carousel.o: ../../config.h
carousel.o: $(HACK_SRC)/fps.h
carousel.o: $(srcdir)/gltrackball.h
carousel.o: $(srcdir)/grab-ximage.h
carousel.o: $(srcdir)/rotator.h
carousel.o: $(HACK_SRC)/screenhackI.h
carousel.o: $(srcdir)/texfont.h
carousel.o: $(UTILS_SRC)/colors.h
carousel.o: $(UTILS_SRC)/grabscreen.h
carousel.o: $(UTILS_SRC)/hsv.h
carousel.o: $(UTILS_SRC)/resources.h
carousel.o: $(UTILS_SRC)/usleep.h
carousel.o: $(UTILS_SRC)/visual.h
carousel.o: $(UTILS_SRC)/xshm.h
carousel.o: $(UTILS_SRC)/yarandom.h
carousel.o: $(HACK_SRC)/xlockmore.h
carousel.o: $(HACK_SRC)/xlockmoreI.h
chessmodels.o: $(srcdir)/chessmodels.h
chessmodels.o: ../../config.h
circuit.o: ../../config.h
circuit.o: $(srcdir)/font-ximage.h
circuit.o: $(HACK_SRC)/fps.h
circuit.o: $(HACK_SRC)/screenhackI.h
circuit.o: $(UTILS_SRC)/colors.h
circuit.o: $(UTILS_SRC)/grabscreen.h
circuit.o: $(UTILS_SRC)/hsv.h
circuit.o: $(UTILS_SRC)/resources.h
circuit.o: $(UTILS_SRC)/usleep.h
circuit.o: $(UTILS_SRC)/visual.h
circuit.o: $(UTILS_SRC)/xshm.h
circuit.o: $(UTILS_SRC)/yarandom.h
circuit.o: $(HACK_SRC)/xlockmore.h
circuit.o: $(HACK_SRC)/xlockmoreI.h
companion_disc.o: ../../config.h
companion_disc.o: $(srcdir)/gllist.h
companion_heart.o: ../../config.h
companion_heart.o: $(srcdir)/gllist.h
companion.o: ../../config.h
companion.o: $(HACK_SRC)/fps.h
companion.o: $(srcdir)/gllist.h
companion.o: $(srcdir)/gltrackball.h
companion.o: $(srcdir)/rotator.h
companion.o: $(HACK_SRC)/screenhackI.h
companion.o: $(UTILS_SRC)/colors.h
companion.o: $(UTILS_SRC)/grabscreen.h
companion.o: $(UTILS_SRC)/hsv.h
companion.o: $(UTILS_SRC)/resources.h
companion.o: $(UTILS_SRC)/usleep.h
companion.o: $(UTILS_SRC)/visual.h
companion.o: $(UTILS_SRC)/xshm.h
companion.o: $(UTILS_SRC)/yarandom.h
companion.o: $(HACK_SRC)/xlockmore.h
companion.o: $(HACK_SRC)/xlockmoreI.h
companion.o: $(srcdir)/xpm-ximage.h
companion_quad.o: ../../config.h
companion_quad.o: $(srcdir)/gllist.h
cow_face.o: ../../config.h
cow_face.o: $(srcdir)/gllist.h
cow_hide.o: ../../config.h
cow_hide.o: $(srcdir)/gllist.h
cow_hoofs.o: ../../config.h
cow_hoofs.o: $(srcdir)/gllist.h
cow_horns.o: ../../config.h
cow_horns.o: $(srcdir)/gllist.h
cow_tail.o: ../../config.h
cow_tail.o: $(srcdir)/gllist.h
cow_udder.o: ../../config.h
cow_udder.o: $(srcdir)/gllist.h
crackberg.o: ../../config.h
crackberg.o: $(HACK_SRC)/fps.h
crackberg.o: $(HACK_SRC)/screenhackI.h
crackberg.o: $(UTILS_SRC)/colors.h
crackberg.o: $(UTILS_SRC)/grabscreen.h
crackberg.o: $(UTILS_SRC)/hsv.h
crackberg.o: $(UTILS_SRC)/resources.h
crackberg.o: $(UTILS_SRC)/usleep.h
crackberg.o: $(UTILS_SRC)/visual.h
crackberg.o: $(UTILS_SRC)/xshm.h
crackberg.o: $(UTILS_SRC)/yarandom.h
crackberg.o: $(HACK_SRC)/xlockmore.h
crackberg.o: $(HACK_SRC)/xlockmoreI.h
cube21.o: ../../config.h
cube21.o: $(HACK_SRC)/fps.h
cube21.o: $(srcdir)/gltrackball.h
cube21.o: $(HACK_SRC)/screenhackI.h
cube21.o: $(UTILS_SRC)/colors.h
cube21.o: $(UTILS_SRC)/grabscreen.h
cube21.o: $(UTILS_SRC)/hsv.h
cube21.o: $(UTILS_SRC)/resources.h
cube21.o: $(UTILS_SRC)/usleep.h
cube21.o: $(UTILS_SRC)/visual.h
cube21.o: $(UTILS_SRC)/xshm.h
cube21.o: $(UTILS_SRC)/yarandom.h
cube21.o: $(HACK_SRC)/xlockmore.h
cube21.o: $(HACK_SRC)/xlockmoreI.h
cubenetic.o: ../../config.h
cubenetic.o: $(HACK_SRC)/fps.h
cubenetic.o: $(srcdir)/gltrackball.h
cubenetic.o: $(srcdir)/rotator.h
cubenetic.o: $(HACK_SRC)/screenhackI.h
cubenetic.o: $(UTILS_SRC)/colors.h
cubenetic.o: $(UTILS_SRC)/grabscreen.h
cubenetic.o: $(UTILS_SRC)/hsv.h
cubenetic.o: $(UTILS_SRC)/resources.h
cubenetic.o: $(UTILS_SRC)/usleep.h
cubenetic.o: $(UTILS_SRC)/visual.h
cubenetic.o: $(UTILS_SRC)/xshm.h
cubenetic.o: $(UTILS_SRC)/yarandom.h
cubenetic.o: $(HACK_SRC)/xlockmore.h
cubenetic.o: $(HACK_SRC)/xlockmoreI.h
cubestorm.o: ../../config.h
cubestorm.o: $(HACK_SRC)/fps.h
cubestorm.o: $(srcdir)/gltrackball.h
cubestorm.o: $(srcdir)/rotator.h
cubestorm.o: $(HACK_SRC)/screenhackI.h
cubestorm.o: $(UTILS_SRC)/colors.h
cubestorm.o: $(UTILS_SRC)/grabscreen.h
cubestorm.o: $(UTILS_SRC)/hsv.h
cubestorm.o: $(UTILS_SRC)/resources.h
cubestorm.o: $(UTILS_SRC)/usleep.h
cubestorm.o: $(UTILS_SRC)/visual.h
cubestorm.o: $(UTILS_SRC)/xshm.h
cubestorm.o: $(UTILS_SRC)/yarandom.h
cubestorm.o: $(HACK_SRC)/xlockmore.h
cubestorm.o: $(HACK_SRC)/xlockmoreI.h
cubicgrid.o: ../../config.h
cubicgrid.o: $(HACK_SRC)/fps.h
cubicgrid.o: $(srcdir)/gltrackball.h
cubicgrid.o: $(srcdir)/rotator.h
cubicgrid.o: $(HACK_SRC)/screenhackI.h
cubicgrid.o: $(UTILS_SRC)/colors.h
cubicgrid.o: $(UTILS_SRC)/grabscreen.h
cubicgrid.o: $(UTILS_SRC)/hsv.h
cubicgrid.o: $(UTILS_SRC)/resources.h
cubicgrid.o: $(UTILS_SRC)/usleep.h
cubicgrid.o: $(UTILS_SRC)/visual.h
cubicgrid.o: $(UTILS_SRC)/xshm.h
cubicgrid.o: $(UTILS_SRC)/yarandom.h
cubicgrid.o: $(HACK_SRC)/xlockmore.h
cubicgrid.o: $(HACK_SRC)/xlockmoreI.h
dangerball.o: ../../config.h
dangerball.o: $(HACK_SRC)/fps.h
dangerball.o: $(srcdir)/gltrackball.h
dangerball.o: $(srcdir)/rotator.h
dangerball.o: $(HACK_SRC)/screenhackI.h
dangerball.o: $(srcdir)/sphere.h
dangerball.o: $(srcdir)/tube.h
dangerball.o: $(UTILS_SRC)/colors.h
dangerball.o: $(UTILS_SRC)/grabscreen.h
dangerball.o: $(UTILS_SRC)/hsv.h
dangerball.o: $(UTILS_SRC)/resources.h
dangerball.o: $(UTILS_SRC)/usleep.h
dangerball.o: $(UTILS_SRC)/visual.h
dangerball.o: $(UTILS_SRC)/xshm.h
dangerball.o: $(UTILS_SRC)/yarandom.h
dangerball.o: $(HACK_SRC)/xlockmore.h
dangerball.o: $(HACK_SRC)/xlockmoreI.h
dnalogo.o: ../../config.h
dnalogo.o: $(HACK_SRC)/fps.h
dnalogo.o: $(srcdir)/gltrackball.h
dnalogo.o: $(srcdir)/normals.h
dnalogo.o: $(srcdir)/rotator.h
dnalogo.o: $(HACK_SRC)/screenhackI.h
dnalogo.o: $(srcdir)/tube.h
dnalogo.o: $(UTILS_SRC)/colors.h
dnalogo.o: $(UTILS_SRC)/grabscreen.h
dnalogo.o: $(UTILS_SRC)/hsv.h
dnalogo.o: $(UTILS_SRC)/resources.h
dnalogo.o: $(UTILS_SRC)/usleep.h
dnalogo.o: $(UTILS_SRC)/visual.h
dnalogo.o: $(UTILS_SRC)/xshm.h
dnalogo.o: $(UTILS_SRC)/yarandom.h
dnalogo.o: $(HACK_SRC)/xlockmore.h
dnalogo.o: $(HACK_SRC)/xlockmoreI.h
dolphin.o: $(srcdir)/atlantis.h
dolphin.o: ../../config.h
dolphin.o: $(HACK_SRC)/fps.h
dolphin.o: $(HACK_SRC)/screenhackI.h
dolphin.o: $(UTILS_SRC)/colors.h
dolphin.o: $(UTILS_SRC)/grabscreen.h
dolphin.o: $(UTILS_SRC)/hsv.h
dolphin.o: $(UTILS_SRC)/resources.h
dolphin.o: $(UTILS_SRC)/usleep.h
dolphin.o: $(UTILS_SRC)/visual.h
dolphin.o: $(UTILS_SRC)/yarandom.h
dropshadow.o: ../../config.h
dropshadow.o: $(srcdir)/dropshadow.h
endgame.o: $(srcdir)/chessgames.h
endgame.o: $(srcdir)/chessmodels.h
endgame.o: ../../config.h
endgame.o: $(HACK_SRC)/fps.h
endgame.o: $(srcdir)/gltrackball.h
endgame.o: $(HACK_SRC)/screenhackI.h
endgame.o: $(UTILS_SRC)/colors.h
endgame.o: $(UTILS_SRC)/grabscreen.h
endgame.o: $(UTILS_SRC)/hsv.h
endgame.o: $(UTILS_SRC)/resources.h
endgame.o: $(UTILS_SRC)/usleep.h
endgame.o: $(UTILS_SRC)/visual.h
endgame.o: $(UTILS_SRC)/xshm.h
endgame.o: $(UTILS_SRC)/yarandom.h
endgame.o: $(HACK_SRC)/xlockmore.h
endgame.o: $(HACK_SRC)/xlockmoreI.h
engine.o: ../../config.h
engine.o: $(HACK_SRC)/fps.h
engine.o: $(srcdir)/gltrackball.h
engine.o: $(srcdir)/glxfonts.h
engine.o: $(srcdir)/rotator.h
engine.o: $(HACK_SRC)/screenhackI.h
engine.o: $(UTILS_SRC)/colors.h
engine.o: $(UTILS_SRC)/grabscreen.h
engine.o: $(UTILS_SRC)/hsv.h
engine.o: $(UTILS_SRC)/resources.h
engine.o: $(UTILS_SRC)/usleep.h
engine.o: $(UTILS_SRC)/visual.h
engine.o: $(UTILS_SRC)/xshm.h
engine.o: $(UTILS_SRC)/yarandom.h
engine.o: $(HACK_SRC)/xlockmore.h
engine.o: $(HACK_SRC)/xlockmoreI.h
extrusion-helix2.o: ../../config.h
extrusion-helix2.o: $(srcdir)/extrusion.h
extrusion-helix3.o: ../../config.h
extrusion-helix3.o: $(srcdir)/extrusion.h
extrusion-helix4.o: ../../config.h
extrusion-helix4.o: $(srcdir)/extrusion.h
extrusion-joinoffset.o: ../../config.h
extrusion-joinoffset.o: $(srcdir)/extrusion.h
extrusion.o: ../../config.h
extrusion.o: $(srcdir)/extrusion.h
extrusion.o: $(HACK_SRC)/fps.h
extrusion.o: $(srcdir)/gltrackball.h
extrusion.o: $(srcdir)/rotator.h
extrusion.o: $(HACK_SRC)/screenhackI.h
extrusion.o: $(UTILS_SRC)/colors.h
extrusion.o: $(UTILS_SRC)/grabscreen.h
extrusion.o: $(UTILS_SRC)/hsv.h
extrusion.o: $(UTILS_SRC)/resources.h
extrusion.o: $(UTILS_SRC)/usleep.h
extrusion.o: $(UTILS_SRC)/visual.h
extrusion.o: $(UTILS_SRC)/xshm.h
extrusion.o: $(UTILS_SRC)/yarandom.h
extrusion.o: $(HACK_SRC)/xlockmore.h
extrusion.o: $(HACK_SRC)/xlockmoreI.h
extrusion.o: $(srcdir)/xpm-ximage.h
extrusion-screw.o: ../../config.h
extrusion-screw.o: $(srcdir)/extrusion.h
extrusion-taper.o: ../../config.h
extrusion-taper.o: $(srcdir)/extrusion.h
extrusion-twistoid.o: ../../config.h
extrusion-twistoid.o: $(srcdir)/extrusion.h
flipflop.o: ../../config.h
flipflop.o: $(HACK_SRC)/fps.h
flipflop.o: $(srcdir)/gltrackball.h
flipflop.o: $(srcdir)/grab-ximage.h
flipflop.o: $(HACK_SRC)/screenhackI.h
flipflop.o: $(UTILS_SRC)/colors.h
flipflop.o: $(UTILS_SRC)/grabscreen.h
flipflop.o: $(UTILS_SRC)/hsv.h
flipflop.o: $(UTILS_SRC)/resources.h
flipflop.o: $(UTILS_SRC)/usleep.h
flipflop.o: $(UTILS_SRC)/visual.h
flipflop.o: $(UTILS_SRC)/xshm.h
flipflop.o: $(UTILS_SRC)/yarandom.h
flipflop.o: $(HACK_SRC)/xlockmore.h
flipflop.o: $(HACK_SRC)/xlockmoreI.h
flipscreen3d.o: ../../config.h
flipscreen3d.o: $(HACK_SRC)/fps.h
flipscreen3d.o: $(srcdir)/gltrackball.h
flipscreen3d.o: $(srcdir)/grab-ximage.h
flipscreen3d.o: $(HACK_SRC)/screenhackI.h
flipscreen3d.o: $(UTILS_SRC)/colors.h
flipscreen3d.o: $(UTILS_SRC)/grabscreen.h
flipscreen3d.o: $(UTILS_SRC)/hsv.h
flipscreen3d.o: $(UTILS_SRC)/resources.h
flipscreen3d.o: $(UTILS_SRC)/usleep.h
flipscreen3d.o: $(UTILS_SRC)/visual.h
flipscreen3d.o: $(UTILS_SRC)/xshm.h
flipscreen3d.o: $(UTILS_SRC)/yarandom.h
flipscreen3d.o: $(HACK_SRC)/xlockmore.h
flipscreen3d.o: $(HACK_SRC)/xlockmoreI.h
fliptext.o: ../../config.h
fliptext.o: $(HACK_SRC)/fps.h
fliptext.o: $(HACK_SRC)/screenhackI.h
fliptext.o: $(srcdir)/texfont.h
fliptext.o: $(UTILS_SRC)/colors.h
fliptext.o: $(UTILS_SRC)/grabscreen.h
fliptext.o: $(UTILS_SRC)/hsv.h
fliptext.o: $(UTILS_SRC)/resources.h
fliptext.o: $(UTILS_SRC)/textclient.h
fliptext.o: $(UTILS_SRC)/usleep.h
fliptext.o: $(UTILS_SRC)/visual.h
fliptext.o: $(UTILS_SRC)/xshm.h
fliptext.o: $(UTILS_SRC)/yarandom.h
fliptext.o: $(HACK_SRC)/xlockmore.h
fliptext.o: $(HACK_SRC)/xlockmoreI.h
flurry.o: ../../config.h
flurry.o: $(srcdir)/flurry.h
flurry.o: $(HACK_SRC)/fps.h
flurry.o: $(srcdir)/gltrackball.h
flurry.o: $(srcdir)/rotator.h
flurry.o: $(HACK_SRC)/screenhackI.h
flurry.o: $(UTILS_SRC)/colors.h
flurry.o: $(UTILS_SRC)/grabscreen.h
flurry.o: $(UTILS_SRC)/hsv.h
flurry.o: $(UTILS_SRC)/resources.h
flurry.o: $(UTILS_SRC)/usleep.h
flurry.o: $(UTILS_SRC)/visual.h
flurry.o: $(UTILS_SRC)/xshm.h
flurry.o: $(UTILS_SRC)/yarandom.h
flurry.o: $(HACK_SRC)/xlockmore.h
flurry.o: $(HACK_SRC)/xlockmoreI.h
flurry-smoke.o: ../../config.h
flurry-smoke.o: $(srcdir)/flurry.h
flurry-smoke.o: $(srcdir)/gltrackball.h
flurry-smoke.o: $(srcdir)/rotator.h
flurry-smoke.o: $(UTILS_SRC)/yarandom.h
flurry-spark.o: ../../config.h
flurry-spark.o: $(srcdir)/flurry.h
flurry-spark.o: $(srcdir)/gltrackball.h
flurry-spark.o: $(srcdir)/rotator.h
flurry-spark.o: $(UTILS_SRC)/yarandom.h
flurry-star.o: ../../config.h
flurry-star.o: $(srcdir)/flurry.h
flurry-star.o: $(srcdir)/gltrackball.h
flurry-star.o: $(srcdir)/rotator.h
flurry-star.o: $(UTILS_SRC)/yarandom.h
flurry-texture.o: ../../config.h
flurry-texture.o: $(srcdir)/flurry.h
flurry-texture.o: $(srcdir)/gltrackball.h
flurry-texture.o: $(srcdir)/rotator.h
flurry-texture.o: $(UTILS_SRC)/yarandom.h
flyingtoasters.o: ../../config.h
flyingtoasters.o: $(HACK_SRC)/fps.h
flyingtoasters.o: $(srcdir)/gllist.h
flyingtoasters.o: $(srcdir)/gltrackball.h
flyingtoasters.o: $(HACK_SRC)/images/chromesphere.xpm
flyingtoasters.o: $(HACK_SRC)/images/toast.xpm
flyingtoasters.o: $(HACK_SRC)/screenhackI.h
flyingtoasters.o: $(UTILS_SRC)/colors.h
flyingtoasters.o: $(UTILS_SRC)/grabscreen.h
flyingtoasters.o: $(UTILS_SRC)/hsv.h
flyingtoasters.o: $(UTILS_SRC)/resources.h
flyingtoasters.o: $(UTILS_SRC)/usleep.h
flyingtoasters.o: $(UTILS_SRC)/visual.h
flyingtoasters.o: $(UTILS_SRC)/xshm.h
flyingtoasters.o: $(UTILS_SRC)/yarandom.h
flyingtoasters.o: $(HACK_SRC)/xlockmore.h
flyingtoasters.o: $(HACK_SRC)/xlockmoreI.h
flyingtoasters.o: $(srcdir)/xpm-ximage.h
font-ximage.o: ../../config.h
font-ximage.o: $(srcdir)/font-ximage.h
fps-gl.o: ../../config.h
fps-gl.o: $(HACK_SRC)/fps.h
fps-gl.o: $(HACK_SRC)/fpsI.h
fps-gl.o: $(srcdir)/glxfonts.h
fps-gl.o: $(HACK_SRC)/screenhackI.h
fps-gl.o: $(UTILS_SRC)/colors.h
fps-gl.o: $(UTILS_SRC)/grabscreen.h
fps-gl.o: $(UTILS_SRC)/hsv.h
fps-gl.o: $(UTILS_SRC)/resources.h
fps-gl.o: $(UTILS_SRC)/usleep.h
fps-gl.o: $(UTILS_SRC)/visual.h
fps-gl.o: $(UTILS_SRC)/xshm.h
fps-gl.o: $(UTILS_SRC)/yarandom.h
fps-gl.o: $(HACK_SRC)/xlockmoreI.h
gears.o: ../../config.h
gears.o: $(HACK_SRC)/fps.h
gears.o: $(srcdir)/gltrackball.h
gears.o: $(srcdir)/involute.h
gears.o: $(srcdir)/normals.h
gears.o: $(srcdir)/rotator.h
gears.o: $(HACK_SRC)/screenhackI.h
gears.o: $(srcdir)/tube.h
gears.o: $(UTILS_SRC)/colors.h
gears.o: $(UTILS_SRC)/grabscreen.h
gears.o: $(UTILS_SRC)/hsv.h
gears.o: $(UTILS_SRC)/resources.h
gears.o: $(UTILS_SRC)/usleep.h
gears.o: $(UTILS_SRC)/visual.h
gears.o: $(UTILS_SRC)/xshm.h
gears.o: $(UTILS_SRC)/yarandom.h
gears.o: $(HACK_SRC)/xlockmore.h
gears.o: $(HACK_SRC)/xlockmoreI.h
geodesic.o: ../../config.h
geodesic.o: $(HACK_SRC)/fps.h
geodesic.o: $(srcdir)/gllist.h
geodesic.o: $(srcdir)/gltrackball.h
geodesic.o: $(srcdir)/normals.h
geodesic.o: $(srcdir)/rotator.h
geodesic.o: $(HACK_SRC)/screenhackI.h
geodesic.o: $(UTILS_SRC)/colors.h
geodesic.o: $(UTILS_SRC)/grabscreen.h
geodesic.o: $(UTILS_SRC)/hsv.h
geodesic.o: $(UTILS_SRC)/resources.h
geodesic.o: $(UTILS_SRC)/usleep.h
geodesic.o: $(UTILS_SRC)/visual.h
geodesic.o: $(UTILS_SRC)/xshm.h
geodesic.o: $(UTILS_SRC)/yarandom.h
geodesic.o: $(HACK_SRC)/xlockmore.h
geodesic.o: $(HACK_SRC)/xlockmoreI.h
gflux.o: ../../config.h
gflux.o: $(HACK_SRC)/fps.h
gflux.o: $(srcdir)/gltrackball.h
gflux.o: $(srcdir)/grab-ximage.h
gflux.o: $(HACK_SRC)/screenhackI.h
gflux.o: $(UTILS_SRC)/colors.h
gflux.o: $(UTILS_SRC)/grabscreen.h
gflux.o: $(UTILS_SRC)/hsv.h
gflux.o: $(UTILS_SRC)/resources.h
gflux.o: $(UTILS_SRC)/usleep.h
gflux.o: $(UTILS_SRC)/visual.h
gflux.o: $(UTILS_SRC)/xshm.h
gflux.o: $(UTILS_SRC)/yarandom.h
gflux.o: $(HACK_SRC)/xlockmore.h
gflux.o: $(HACK_SRC)/xlockmoreI.h
glblur.o: ../../config.h
glblur.o: $(HACK_SRC)/fps.h
glblur.o: $(srcdir)/gltrackball.h
glblur.o: $(srcdir)/rotator.h
glblur.o: $(HACK_SRC)/screenhackI.h
glblur.o: $(UTILS_SRC)/colors.h
glblur.o: $(UTILS_SRC)/grabscreen.h
glblur.o: $(UTILS_SRC)/hsv.h
glblur.o: $(UTILS_SRC)/resources.h
glblur.o: $(UTILS_SRC)/usleep.h
glblur.o: $(UTILS_SRC)/visual.h
glblur.o: $(UTILS_SRC)/xshm.h
glblur.o: $(UTILS_SRC)/yarandom.h
glblur.o: $(HACK_SRC)/xlockmore.h
glblur.o: $(HACK_SRC)/xlockmoreI.h
glcells.o: ../../config.h
glcells.o: $(HACK_SRC)/fps.h
glcells.o: $(HACK_SRC)/screenhackI.h
glcells.o: $(UTILS_SRC)/colors.h
glcells.o: $(UTILS_SRC)/grabscreen.h
glcells.o: $(UTILS_SRC)/hsv.h
glcells.o: $(UTILS_SRC)/resources.h
glcells.o: $(UTILS_SRC)/usleep.h
glcells.o: $(UTILS_SRC)/visual.h
glcells.o: $(UTILS_SRC)/xshm.h
glcells.o: $(UTILS_SRC)/yarandom.h
glcells.o: $(HACK_SRC)/xlockmore.h
glcells.o: $(HACK_SRC)/xlockmoreI.h
gleidescope.o: ../../config.h
gleidescope.o: $(HACK_SRC)/fps.h
gleidescope.o: $(srcdir)/grab-ximage.h
gleidescope.o: $(HACK_SRC)/screenhackI.h
gleidescope.o: $(UTILS_SRC)/colors.h
gleidescope.o: $(UTILS_SRC)/grabscreen.h
gleidescope.o: $(UTILS_SRC)/hsv.h
gleidescope.o: $(UTILS_SRC)/resources.h
gleidescope.o: $(UTILS_SRC)/usleep.h
gleidescope.o: $(UTILS_SRC)/visual.h
gleidescope.o: $(UTILS_SRC)/xshm.h
gleidescope.o: $(UTILS_SRC)/yarandom.h
gleidescope.o: $(HACK_SRC)/xlockmore.h
gleidescope.o: $(HACK_SRC)/xlockmoreI.h
gleidescope.o: $(srcdir)/xpm-ximage.h
glforestfire.o: ../../config.h
glforestfire.o: $(HACK_SRC)/fps.h
glforestfire.o: $(srcdir)/gltrackball.h
glforestfire.o: $(HACK_SRC)/images/ground.xpm
glforestfire.o: $(HACK_SRC)/images/tree.xpm
glforestfire.o: $(HACK_SRC)/screenhackI.h
glforestfire.o: $(UTILS_SRC)/colors.h
glforestfire.o: $(UTILS_SRC)/grabscreen.h
glforestfire.o: $(UTILS_SRC)/hsv.h
glforestfire.o: $(UTILS_SRC)/resources.h
glforestfire.o: $(UTILS_SRC)/usleep.h
glforestfire.o: $(UTILS_SRC)/visual.h
glforestfire.o: $(UTILS_SRC)/xshm.h
glforestfire.o: $(UTILS_SRC)/yarandom.h
glforestfire.o: $(HACK_SRC)/xlockmore.h
glforestfire.o: $(HACK_SRC)/xlockmoreI.h
glforestfire.o: $(srcdir)/xpm-ximage.h
glhanoi.o: ../../config.h
glhanoi.o: $(HACK_SRC)/fps.h
glhanoi.o: $(srcdir)/rotator.h
glhanoi.o: $(HACK_SRC)/screenhackI.h
glhanoi.o: $(UTILS_SRC)/colors.h
glhanoi.o: $(UTILS_SRC)/grabscreen.h
glhanoi.o: $(UTILS_SRC)/hsv.h
glhanoi.o: $(UTILS_SRC)/resources.h
glhanoi.o: $(UTILS_SRC)/usleep.h
glhanoi.o: $(UTILS_SRC)/visual.h
glhanoi.o: $(UTILS_SRC)/xshm.h
glhanoi.o: $(UTILS_SRC)/yarandom.h
glhanoi.o: $(HACK_SRC)/xlockmore.h
glhanoi.o: $(HACK_SRC)/xlockmoreI.h
glknots.o: ../../config.h
glknots.o: $(HACK_SRC)/fps.h
glknots.o: $(srcdir)/gltrackball.h
glknots.o: $(srcdir)/rotator.h
glknots.o: $(HACK_SRC)/screenhackI.h
glknots.o: $(srcdir)/tube.h
glknots.o: $(UTILS_SRC)/colors.h
glknots.o: $(UTILS_SRC)/grabscreen.h
glknots.o: $(UTILS_SRC)/hsv.h
glknots.o: $(UTILS_SRC)/resources.h
glknots.o: $(UTILS_SRC)/usleep.h
glknots.o: $(UTILS_SRC)/visual.h
glknots.o: $(UTILS_SRC)/xshm.h
glknots.o: $(UTILS_SRC)/yarandom.h
glknots.o: $(HACK_SRC)/xlockmore.h
glknots.o: $(HACK_SRC)/xlockmoreI.h
gllist.o: ../../config.h
gllist.o: $(srcdir)/gllist.h
glmatrix.o: ../../config.h
glmatrix.o: $(HACK_SRC)/fps.h
glmatrix.o: $(HACK_SRC)/images/matrix3.xpm
glmatrix.o: $(HACK_SRC)/screenhackI.h
glmatrix.o: $(UTILS_SRC)/colors.h
glmatrix.o: $(UTILS_SRC)/grabscreen.h
glmatrix.o: $(UTILS_SRC)/hsv.h
glmatrix.o: $(UTILS_SRC)/resources.h
glmatrix.o: $(UTILS_SRC)/usleep.h
glmatrix.o: $(UTILS_SRC)/visual.h
glmatrix.o: $(UTILS_SRC)/xshm.h
glmatrix.o: $(UTILS_SRC)/yarandom.h
glmatrix.o: $(HACK_SRC)/xlockmore.h
glmatrix.o: $(HACK_SRC)/xlockmoreI.h
glmatrix.o: $(srcdir)/xpm-ximage.h
glplanet.o: ../../config.h
glplanet.o: $(HACK_SRC)/fps.h
glplanet.o: $(srcdir)/gltrackball.h
glplanet.o: $(HACK_SRC)/images/earth.xpm
glplanet.o: $(srcdir)/rotator.h
glplanet.o: $(HACK_SRC)/screenhackI.h
glplanet.o: $(srcdir)/sphere.h
glplanet.o: $(UTILS_SRC)/colors.h
glplanet.o: $(UTILS_SRC)/grabscreen.h
glplanet.o: $(UTILS_SRC)/hsv.h
glplanet.o: $(UTILS_SRC)/resources.h
glplanet.o: $(UTILS_SRC)/usleep.h
glplanet.o: $(UTILS_SRC)/visual.h
glplanet.o: $(UTILS_SRC)/xshm.h
glplanet.o: $(UTILS_SRC)/yarandom.h
glplanet.o: $(HACK_SRC)/xlockmore.h
glplanet.o: $(HACK_SRC)/xlockmoreI.h
glplanet.o: $(srcdir)/xpm-ximage.h
glschool_alg.o: ../../config.h
glschool_alg.o: $(srcdir)/glschool_alg.h
glschool_alg.o: $(UTILS_SRC)/yarandom.h
glschool_gl.o: ../../config.h
glschool_gl.o: $(srcdir)/glschool_alg.h
glschool_gl.o: $(srcdir)/glschool_gl.h
glschool_gl.o: $(srcdir)/sphere.h
glschool_gl.o: $(srcdir)/tube.h
glschool.o: ../../config.h
glschool.o: $(HACK_SRC)/fps.h
glschool.o: $(srcdir)/glschool_alg.h
glschool.o: $(srcdir)/glschool_gl.h
glschool.o: $(srcdir)/glschool.h
glschool.o: $(HACK_SRC)/screenhackI.h
glschool.o: $(UTILS_SRC)/colors.h
glschool.o: $(UTILS_SRC)/grabscreen.h
glschool.o: $(UTILS_SRC)/hsv.h
glschool.o: $(UTILS_SRC)/resources.h
glschool.o: $(UTILS_SRC)/usleep.h
glschool.o: $(UTILS_SRC)/visual.h
glschool.o: $(UTILS_SRC)/xshm.h
glschool.o: $(UTILS_SRC)/yarandom.h
glschool.o: $(HACK_SRC)/xlockmore.h
glschool.o: $(HACK_SRC)/xlockmoreI.h
glslideshow.o: ../../config.h
glslideshow.o: $(HACK_SRC)/fps.h
glslideshow.o: $(srcdir)/glxfonts.h
glslideshow.o: $(srcdir)/grab-ximage.h
glslideshow.o: $(HACK_SRC)/screenhackI.h
glslideshow.o: $(UTILS_SRC)/colors.h
glslideshow.o: $(UTILS_SRC)/grabscreen.h
glslideshow.o: $(UTILS_SRC)/hsv.h
glslideshow.o: $(UTILS_SRC)/resources.h
glslideshow.o: $(UTILS_SRC)/usleep.h
glslideshow.o: $(UTILS_SRC)/visual.h
glslideshow.o: $(UTILS_SRC)/xshm.h
glslideshow.o: $(UTILS_SRC)/yarandom.h
glslideshow.o: $(HACK_SRC)/xlockmore.h
glslideshow.o: $(HACK_SRC)/xlockmoreI.h
glsnake.o: ../../config.h
glsnake.o: $(HACK_SRC)/fps.h
glsnake.o: $(srcdir)/glxfonts.h
glsnake.o: $(HACK_SRC)/screenhackI.h
glsnake.o: $(UTILS_SRC)/colors.h
glsnake.o: $(UTILS_SRC)/grabscreen.h
glsnake.o: $(UTILS_SRC)/hsv.h
glsnake.o: $(UTILS_SRC)/resources.h
glsnake.o: $(UTILS_SRC)/usleep.h
glsnake.o: $(UTILS_SRC)/visual.h
glsnake.o: $(UTILS_SRC)/xshm.h
glsnake.o: $(UTILS_SRC)/yarandom.h
glsnake.o: $(HACK_SRC)/xlockmore.h
glsnake.o: $(HACK_SRC)/xlockmoreI.h
gltext.o: ../../config.h
gltext.o: $(HACK_SRC)/fps.h
gltext.o: $(srcdir)/gltrackball.h
gltext.o: $(srcdir)/glut_roman.h
gltext.o: $(srcdir)/glutstroke.h
gltext.o: $(srcdir)/rotator.h
gltext.o: $(HACK_SRC)/screenhackI.h
gltext.o: $(srcdir)/sphere.h
gltext.o: $(srcdir)/tube.h
gltext.o: $(UTILS_SRC)/colors.h
gltext.o: $(UTILS_SRC)/grabscreen.h
gltext.o: $(UTILS_SRC)/hsv.h
gltext.o: $(UTILS_SRC)/resources.h
gltext.o: $(UTILS_SRC)/textclient.h
gltext.o: $(UTILS_SRC)/usleep.h
gltext.o: $(UTILS_SRC)/visual.h
gltext.o: $(UTILS_SRC)/xshm.h
gltext.o: $(UTILS_SRC)/yarandom.h
gltext.o: $(HACK_SRC)/xlockmore.h
gltext.o: $(HACK_SRC)/xlockmoreI.h
gltrackball.o: ../../config.h
gltrackball.o: $(srcdir)/gltrackball.h
gltrackball.o: $(srcdir)/trackball.h
glut_stroke.o: ../../config.h
glut_stroke.o: $(srcdir)/glutstroke.h
glut_swidth.o: ../../config.h
glut_swidth.o: $(srcdir)/glutstroke.h
glxfonts.o: ../../config.h
glxfonts.o: $(HACK_SRC)/fps.h
glxfonts.o: $(srcdir)/glxfonts.h
glxfonts.o: $(UTILS_SRC)/resources.h
grab-ximage.o: ../../config.h
grab-ximage.o: $(srcdir)/grab-ximage.h
grab-ximage.o: $(UTILS_SRC)/grabscreen.h
grab-ximage.o: $(UTILS_SRC)/resources.h
grab-ximage.o: $(UTILS_SRC)/visual.h
grab-ximage.o: $(UTILS_SRC)/xshm.h
hilbert.o: ../../config.h
hilbert.o: $(HACK_SRC)/fps.h
hilbert.o: $(srcdir)/gltrackball.h
hilbert.o: $(srcdir)/rotator.h
hilbert.o: $(HACK_SRC)/screenhackI.h
hilbert.o: $(srcdir)/sphere.h
hilbert.o: $(srcdir)/tube.h
hilbert.o: $(UTILS_SRC)/colors.h
hilbert.o: $(UTILS_SRC)/grabscreen.h
hilbert.o: $(UTILS_SRC)/hsv.h
hilbert.o: $(UTILS_SRC)/resources.h
hilbert.o: $(UTILS_SRC)/usleep.h
hilbert.o: $(UTILS_SRC)/visual.h
hilbert.o: $(UTILS_SRC)/xshm.h
hilbert.o: $(UTILS_SRC)/yarandom.h
hilbert.o: $(HACK_SRC)/xlockmore.h
hilbert.o: $(HACK_SRC)/xlockmoreI.h
hypertorus.o: ../../config.h
hypertorus.o: $(HACK_SRC)/fps.h
hypertorus.o: $(srcdir)/gltrackball.h
hypertorus.o: $(HACK_SRC)/screenhackI.h
hypertorus.o: $(UTILS_SRC)/colors.h
hypertorus.o: $(UTILS_SRC)/grabscreen.h
hypertorus.o: $(UTILS_SRC)/hsv.h
hypertorus.o: $(UTILS_SRC)/resources.h
hypertorus.o: $(UTILS_SRC)/usleep.h
hypertorus.o: $(UTILS_SRC)/visual.h
hypertorus.o: $(UTILS_SRC)/xshm.h
hypertorus.o: $(UTILS_SRC)/yarandom.h
hypertorus.o: $(HACK_SRC)/xlockmore.h
hypertorus.o: $(HACK_SRC)/xlockmoreI.h
hypnowheel.o: ../../config.h
hypnowheel.o: $(HACK_SRC)/fps.h
hypnowheel.o: $(srcdir)/rotator.h
hypnowheel.o: $(HACK_SRC)/screenhackI.h
hypnowheel.o: $(UTILS_SRC)/colors.h
hypnowheel.o: $(UTILS_SRC)/grabscreen.h
hypnowheel.o: $(UTILS_SRC)/hsv.h
hypnowheel.o: $(UTILS_SRC)/resources.h
hypnowheel.o: $(UTILS_SRC)/usleep.h
hypnowheel.o: $(UTILS_SRC)/visual.h
hypnowheel.o: $(UTILS_SRC)/xshm.h
hypnowheel.o: $(UTILS_SRC)/yarandom.h
hypnowheel.o: $(HACK_SRC)/xlockmore.h
hypnowheel.o: $(HACK_SRC)/xlockmoreI.h
involute.o: ../../config.h
involute.o: $(HACK_SRC)/fps.h
involute.o: $(srcdir)/involute.h
involute.o: $(srcdir)/normals.h
involute.o: $(HACK_SRC)/screenhackI.h
involute.o: $(UTILS_SRC)/colors.h
involute.o: $(UTILS_SRC)/grabscreen.h
involute.o: $(UTILS_SRC)/hsv.h
involute.o: $(UTILS_SRC)/resources.h
involute.o: $(UTILS_SRC)/usleep.h
involute.o: $(UTILS_SRC)/visual.h
involute.o: $(UTILS_SRC)/yarandom.h
jigglypuff.o: ../../config.h
jigglypuff.o: $(HACK_SRC)/fps.h
jigglypuff.o: $(srcdir)/gltrackball.h
jigglypuff.o: $(HACK_SRC)/images/jigglymap.xpm
jigglypuff.o: $(HACK_SRC)/screenhackI.h
jigglypuff.o: $(UTILS_SRC)/colors.h
jigglypuff.o: $(UTILS_SRC)/grabscreen.h
jigglypuff.o: $(UTILS_SRC)/hsv.h
jigglypuff.o: $(UTILS_SRC)/resources.h
jigglypuff.o: $(UTILS_SRC)/usleep.h
jigglypuff.o: $(UTILS_SRC)/visual.h
jigglypuff.o: $(UTILS_SRC)/xshm.h
jigglypuff.o: $(UTILS_SRC)/yarandom.h
jigglypuff.o: $(HACK_SRC)/xlockmore.h
jigglypuff.o: $(HACK_SRC)/xlockmoreI.h
jigglypuff.o: $(srcdir)/xpm-ximage.h
jigsaw.o: ../../config.h
jigsaw.o: $(HACK_SRC)/fps.h
jigsaw.o: $(srcdir)/gltrackball.h
jigsaw.o: $(srcdir)/grab-ximage.h
jigsaw.o: $(srcdir)/normals.h
jigsaw.o: $(srcdir)/rotator.h
jigsaw.o: $(HACK_SRC)/screenhackI.h
jigsaw.o: $(srcdir)/texfont.h
jigsaw.o: $(UTILS_SRC)/colors.h
jigsaw.o: $(UTILS_SRC)/grabscreen.h
jigsaw.o: $(UTILS_SRC)/hsv.h
jigsaw.o: $(UTILS_SRC)/resources.h
jigsaw.o: $(UTILS_SRC)/spline.h
jigsaw.o: $(UTILS_SRC)/usleep.h
jigsaw.o: $(UTILS_SRC)/visual.h
jigsaw.o: $(UTILS_SRC)/xshm.h
jigsaw.o: $(UTILS_SRC)/yarandom.h
jigsaw.o: $(HACK_SRC)/xlockmore.h
jigsaw.o: $(HACK_SRC)/xlockmoreI.h
juggler3d.o: ../../config.h
juggler3d.o: $(HACK_SRC)/fps.h
juggler3d.o: $(srcdir)/gltrackball.h
juggler3d.o: $(srcdir)/glxfonts.h
juggler3d.o: $(srcdir)/rotator.h
juggler3d.o: $(HACK_SRC)/screenhackI.h
juggler3d.o: $(srcdir)/sphere.h
juggler3d.o: $(srcdir)/tube.h
juggler3d.o: $(UTILS_SRC)/colors.h
juggler3d.o: $(UTILS_SRC)/grabscreen.h
juggler3d.o: $(UTILS_SRC)/hsv.h
juggler3d.o: $(UTILS_SRC)/resources.h
juggler3d.o: $(UTILS_SRC)/usleep.h
juggler3d.o: $(UTILS_SRC)/visual.h
juggler3d.o: $(UTILS_SRC)/xshm.h
juggler3d.o: $(UTILS_SRC)/yarandom.h
juggler3d.o: $(HACK_SRC)/xlockmore.h
juggler3d.o: $(HACK_SRC)/xlockmoreI.h
jwzgles.o: ../../config.h
kaleidocycle.o: ../../config.h
kaleidocycle.o: $(HACK_SRC)/fps.h
kaleidocycle.o: $(srcdir)/gltrackball.h
kaleidocycle.o: $(srcdir)/normals.h
kaleidocycle.o: $(srcdir)/rotator.h
kaleidocycle.o: $(HACK_SRC)/screenhackI.h
kaleidocycle.o: $(UTILS_SRC)/colors.h
kaleidocycle.o: $(UTILS_SRC)/grabscreen.h
kaleidocycle.o: $(UTILS_SRC)/hsv.h
kaleidocycle.o: $(UTILS_SRC)/resources.h
kaleidocycle.o: $(UTILS_SRC)/usleep.h
kaleidocycle.o: $(UTILS_SRC)/visual.h
kaleidocycle.o: $(UTILS_SRC)/xshm.h
kaleidocycle.o: $(UTILS_SRC)/yarandom.h
kaleidocycle.o: $(HACK_SRC)/xlockmore.h
kaleidocycle.o: $(HACK_SRC)/xlockmoreI.h
klein.o: ../../config.h
klein.o: $(HACK_SRC)/fps.h
klein.o: $(srcdir)/gltrackball.h
klein.o: $(HACK_SRC)/screenhackI.h
klein.o: $(UTILS_SRC)/colors.h
klein.o: $(UTILS_SRC)/grabscreen.h
klein.o: $(UTILS_SRC)/hsv.h
klein.o: $(UTILS_SRC)/resources.h
klein.o: $(UTILS_SRC)/usleep.h
klein.o: $(UTILS_SRC)/visual.h
klein.o: $(UTILS_SRC)/xshm.h
klein.o: $(UTILS_SRC)/yarandom.h
klein.o: $(HACK_SRC)/xlockmore.h
klein.o: $(HACK_SRC)/xlockmoreI.h
lament.o: ../../config.h
lament.o: $(HACK_SRC)/fps.h
lament.o: $(srcdir)/gltrackball.h
lament.o: $(HACK_SRC)/images/lament512.xpm
lament.o: $(srcdir)/normals.h
lament.o: $(srcdir)/rotator.h
lament.o: $(HACK_SRC)/screenhackI.h
lament.o: $(UTILS_SRC)/colors.h
lament.o: $(UTILS_SRC)/grabscreen.h
lament.o: $(UTILS_SRC)/hsv.h
lament.o: $(UTILS_SRC)/resources.h
lament.o: $(UTILS_SRC)/usleep.h
lament.o: $(UTILS_SRC)/visual.h
lament.o: $(UTILS_SRC)/xshm.h
lament.o: $(UTILS_SRC)/yarandom.h
lament.o: $(HACK_SRC)/xlockmore.h
lament.o: $(HACK_SRC)/xlockmoreI.h
lament.o: $(srcdir)/xpm-ximage.h
lavalite.o: ../../config.h
lavalite.o: $(HACK_SRC)/fps.h
lavalite.o: $(srcdir)/gltrackball.h
lavalite.o: $(srcdir)/marching.h
lavalite.o: $(srcdir)/rotator.h
lavalite.o: $(HACK_SRC)/screenhackI.h
lavalite.o: $(UTILS_SRC)/colors.h
lavalite.o: $(UTILS_SRC)/grabscreen.h
lavalite.o: $(UTILS_SRC)/hsv.h
lavalite.o: $(UTILS_SRC)/resources.h
lavalite.o: $(UTILS_SRC)/usleep.h
lavalite.o: $(UTILS_SRC)/visual.h
lavalite.o: $(UTILS_SRC)/xshm.h
lavalite.o: $(UTILS_SRC)/yarandom.h
lavalite.o: $(HACK_SRC)/xlockmore.h
lavalite.o: $(HACK_SRC)/xlockmoreI.h
lavalite.o: $(srcdir)/xpm-ximage.h
lockward.o: ../../config.h
lockward.o: $(HACK_SRC)/fps.h
lockward.o: $(HACK_SRC)/screenhackI.h
lockward.o: $(UTILS_SRC)/colors.h
lockward.o: $(UTILS_SRC)/grabscreen.h
lockward.o: $(UTILS_SRC)/hsv.h
lockward.o: $(UTILS_SRC)/resources.h
lockward.o: $(UTILS_SRC)/usleep.h
lockward.o: $(UTILS_SRC)/visual.h
lockward.o: $(UTILS_SRC)/xshm.h
lockward.o: $(UTILS_SRC)/yarandom.h
lockward.o: $(HACK_SRC)/xlockmore.h
lockward.o: $(HACK_SRC)/xlockmoreI.h
marching.o: ../../config.h
marching.o: $(srcdir)/marching.h
marching.o: $(srcdir)/normals.h
menger.o: ../../config.h
menger.o: $(HACK_SRC)/fps.h
menger.o: $(srcdir)/gltrackball.h
menger.o: $(srcdir)/rotator.h
menger.o: $(HACK_SRC)/screenhackI.h
menger.o: $(UTILS_SRC)/colors.h
menger.o: $(UTILS_SRC)/grabscreen.h
menger.o: $(UTILS_SRC)/hsv.h
menger.o: $(UTILS_SRC)/resources.h
menger.o: $(UTILS_SRC)/usleep.h
menger.o: $(UTILS_SRC)/visual.h
menger.o: $(UTILS_SRC)/xshm.h
menger.o: $(UTILS_SRC)/yarandom.h
menger.o: $(HACK_SRC)/xlockmore.h
menger.o: $(HACK_SRC)/xlockmoreI.h
mirrorblob.o: ../../config.h
mirrorblob.o: $(HACK_SRC)/fps.h
mirrorblob.o: $(srcdir)/gltrackball.h
mirrorblob.o: $(srcdir)/grab-ximage.h
mirrorblob.o: $(HACK_SRC)/screenhackI.h
mirrorblob.o: $(UTILS_SRC)/colors.h
mirrorblob.o: $(UTILS_SRC)/grabscreen.h
mirrorblob.o: $(UTILS_SRC)/hsv.h
mirrorblob.o: $(UTILS_SRC)/resources.h
mirrorblob.o: $(UTILS_SRC)/usleep.h
mirrorblob.o: $(UTILS_SRC)/visual.h
mirrorblob.o: $(UTILS_SRC)/xshm.h
mirrorblob.o: $(UTILS_SRC)/yarandom.h
mirrorblob.o: $(HACK_SRC)/xlockmore.h
mirrorblob.o: $(HACK_SRC)/xlockmoreI.h
moebiusgears.o: ../../config.h
moebiusgears.o: $(HACK_SRC)/fps.h
moebiusgears.o: $(srcdir)/gltrackball.h
moebiusgears.o: $(srcdir)/involute.h
moebiusgears.o: $(srcdir)/normals.h
moebiusgears.o: $(srcdir)/rotator.h
moebiusgears.o: $(HACK_SRC)/screenhackI.h
moebiusgears.o: $(UTILS_SRC)/colors.h
moebiusgears.o: $(UTILS_SRC)/grabscreen.h
moebiusgears.o: $(UTILS_SRC)/hsv.h
moebiusgears.o: $(UTILS_SRC)/resources.h
moebiusgears.o: $(UTILS_SRC)/usleep.h
moebiusgears.o: $(UTILS_SRC)/visual.h
moebiusgears.o: $(UTILS_SRC)/xshm.h
moebiusgears.o: $(UTILS_SRC)/yarandom.h
moebiusgears.o: $(HACK_SRC)/xlockmore.h
moebiusgears.o: $(HACK_SRC)/xlockmoreI.h
moebius.o: ../../config.h
moebius.o: $(HACK_SRC)/fps.h
moebius.o: $(srcdir)/gltrackball.h
moebius.o: $(srcdir)/rotator.h
moebius.o: $(HACK_SRC)/screenhackI.h
moebius.o: $(srcdir)/sphere.h
moebius.o: $(srcdir)/tube.h
moebius.o: $(UTILS_SRC)/colors.h
moebius.o: $(UTILS_SRC)/grabscreen.h
moebius.o: $(UTILS_SRC)/hsv.h
moebius.o: $(UTILS_SRC)/resources.h
moebius.o: $(UTILS_SRC)/usleep.h
moebius.o: $(UTILS_SRC)/visual.h
moebius.o: $(UTILS_SRC)/xshm.h
moebius.o: $(UTILS_SRC)/yarandom.h
moebius.o: $(HACK_SRC)/xlockmore.h
moebius.o: $(HACK_SRC)/xlockmoreI.h
molecule.o: ../../config.h
molecule.o: $(HACK_SRC)/fps.h
molecule.o: $(srcdir)/gltrackball.h
molecule.o: $(srcdir)/glxfonts.h
molecule.o: molecules.h
molecule.o: $(srcdir)/rotator.h
molecule.o: $(HACK_SRC)/screenhackI.h
molecule.o: $(srcdir)/sphere.h
molecule.o: $(srcdir)/tube.h
molecule.o: $(UTILS_SRC)/colors.h
molecule.o: $(UTILS_SRC)/grabscreen.h
molecule.o: $(UTILS_SRC)/hsv.h
molecule.o: $(UTILS_SRC)/resources.h
molecule.o: $(UTILS_SRC)/usleep.h
molecule.o: $(UTILS_SRC)/visual.h
molecule.o: $(UTILS_SRC)/xshm.h
molecule.o: $(UTILS_SRC)/yarandom.h
molecule.o: $(HACK_SRC)/xlockmore.h
molecule.o: $(HACK_SRC)/xlockmoreI.h
morph3d.o: ../../config.h
morph3d.o: $(HACK_SRC)/fps.h
morph3d.o: $(HACK_SRC)/screenhackI.h
morph3d.o: $(UTILS_SRC)/colors.h
morph3d.o: $(UTILS_SRC)/grabscreen.h
morph3d.o: $(UTILS_SRC)/hsv.h
morph3d.o: $(UTILS_SRC)/resources.h
morph3d.o: $(UTILS_SRC)/usleep.h
morph3d.o: $(UTILS_SRC)/visual.h
morph3d.o: $(UTILS_SRC)/xshm.h
morph3d.o: $(UTILS_SRC)/yarandom.h
morph3d.o: $(HACK_SRC)/xlockmore.h
morph3d.o: $(HACK_SRC)/xlockmoreI.h
noof.o: ../../config.h
noof.o: $(HACK_SRC)/fps.h
noof.o: $(HACK_SRC)/screenhackI.h
noof.o: $(UTILS_SRC)/colors.h
noof.o: $(UTILS_SRC)/grabscreen.h
noof.o: $(UTILS_SRC)/hsv.h
noof.o: $(UTILS_SRC)/resources.h
noof.o: $(UTILS_SRC)/usleep.h
noof.o: $(UTILS_SRC)/visual.h
noof.o: $(UTILS_SRC)/xshm.h
noof.o: $(UTILS_SRC)/yarandom.h
noof.o: $(HACK_SRC)/xlockmore.h
noof.o: $(HACK_SRC)/xlockmoreI.h
normals.o: ../../config.h
normals.o: $(srcdir)/normals.h
photopile.o: ../../config.h
photopile.o: $(srcdir)/dropshadow.h
photopile.o: $(HACK_SRC)/fps.h
photopile.o: $(srcdir)/grab-ximage.h
photopile.o: $(HACK_SRC)/screenhackI.h
photopile.o: $(srcdir)/texfont.h
photopile.o: $(UTILS_SRC)/colors.h
photopile.o: $(UTILS_SRC)/grabscreen.h
photopile.o: $(UTILS_SRC)/hsv.h
photopile.o: $(UTILS_SRC)/resources.h
photopile.o: $(UTILS_SRC)/usleep.h
photopile.o: $(UTILS_SRC)/visual.h
photopile.o: $(UTILS_SRC)/xshm.h
photopile.o: $(UTILS_SRC)/yarandom.h
photopile.o: $(HACK_SRC)/xlockmore.h
photopile.o: $(HACK_SRC)/xlockmoreI.h
pinion.o: ../../config.h
pinion.o: $(HACK_SRC)/fps.h
pinion.o: $(srcdir)/gltrackball.h
pinion.o: $(srcdir)/glxfonts.h
pinion.o: $(srcdir)/involute.h
pinion.o: $(srcdir)/normals.h
pinion.o: $(HACK_SRC)/screenhackI.h
pinion.o: $(UTILS_SRC)/colors.h
pinion.o: $(UTILS_SRC)/grabscreen.h
pinion.o: $(UTILS_SRC)/hsv.h
pinion.o: $(UTILS_SRC)/resources.h
pinion.o: $(UTILS_SRC)/usleep.h
pinion.o: $(UTILS_SRC)/visual.h
pinion.o: $(UTILS_SRC)/xshm.h
pinion.o: $(UTILS_SRC)/yarandom.h
pinion.o: $(HACK_SRC)/xlockmore.h
pinion.o: $(HACK_SRC)/xlockmoreI.h
pipeobjs.o: $(srcdir)/buildlwo.h
pipeobjs.o: ../../config.h
pipes.o: $(srcdir)/buildlwo.h
pipes.o: ../../config.h
pipes.o: $(HACK_SRC)/fps.h
pipes.o: $(srcdir)/gltrackball.h
pipes.o: $(HACK_SRC)/screenhackI.h
pipes.o: $(srcdir)/sphere.h
pipes.o: $(srcdir)/teapot.h
pipes.o: $(UTILS_SRC)/colors.h
pipes.o: $(UTILS_SRC)/grabscreen.h
pipes.o: $(UTILS_SRC)/hsv.h
pipes.o: $(UTILS_SRC)/resources.h
pipes.o: $(UTILS_SRC)/usleep.h
pipes.o: $(UTILS_SRC)/visual.h
pipes.o: $(UTILS_SRC)/xshm.h
pipes.o: $(UTILS_SRC)/yarandom.h
pipes.o: $(HACK_SRC)/xlockmore.h
pipes.o: $(HACK_SRC)/xlockmoreI.h
polyhedra-gl.o: ../../config.h
polyhedra-gl.o: $(HACK_SRC)/fps.h
polyhedra-gl.o: $(srcdir)/gltrackball.h
polyhedra-gl.o: $(srcdir)/glxfonts.h
polyhedra-gl.o: $(srcdir)/normals.h
polyhedra-gl.o: $(srcdir)/polyhedra.h
polyhedra-gl.o: $(srcdir)/rotator.h
polyhedra-gl.o: $(HACK_SRC)/screenhackI.h
polyhedra-gl.o: $(srcdir)/teapot.h
polyhedra-gl.o: $(UTILS_SRC)/colors.h
polyhedra-gl.o: $(UTILS_SRC)/grabscreen.h
polyhedra-gl.o: $(UTILS_SRC)/hsv.h
polyhedra-gl.o: $(UTILS_SRC)/resources.h
polyhedra-gl.o: $(UTILS_SRC)/usleep.h
polyhedra-gl.o: $(UTILS_SRC)/visual.h
polyhedra-gl.o: $(UTILS_SRC)/xshm.h
polyhedra-gl.o: $(UTILS_SRC)/yarandom.h
polyhedra-gl.o: $(HACK_SRC)/xlockmore.h
polyhedra-gl.o: $(HACK_SRC)/xlockmoreI.h
polyhedra.o: ../../config.h
polyhedra.o: $(srcdir)/polyhedra.h
polytopes.o: ../../config.h
polytopes.o: $(HACK_SRC)/fps.h
polytopes.o: $(srcdir)/gltrackball.h
polytopes.o: $(HACK_SRC)/screenhackI.h
polytopes.o: $(UTILS_SRC)/colors.h
polytopes.o: $(UTILS_SRC)/grabscreen.h
polytopes.o: $(UTILS_SRC)/hsv.h
polytopes.o: $(UTILS_SRC)/resources.h
polytopes.o: $(UTILS_SRC)/usleep.h
polytopes.o: $(UTILS_SRC)/visual.h
polytopes.o: $(UTILS_SRC)/xshm.h
polytopes.o: $(UTILS_SRC)/yarandom.h
polytopes.o: $(HACK_SRC)/xlockmore.h
polytopes.o: $(HACK_SRC)/xlockmoreI.h
providence.o: ../../config.h
providence.o: $(HACK_SRC)/fps.h
providence.o: $(srcdir)/gltrackball.h
providence.o: $(HACK_SRC)/screenhackI.h
providence.o: $(UTILS_SRC)/colors.h
providence.o: $(UTILS_SRC)/grabscreen.h
providence.o: $(UTILS_SRC)/hsv.h
providence.o: $(UTILS_SRC)/resources.h
providence.o: $(UTILS_SRC)/usleep.h
providence.o: $(UTILS_SRC)/visual.h
providence.o: $(UTILS_SRC)/xshm.h
providence.o: $(UTILS_SRC)/yarandom.h
providence.o: $(HACK_SRC)/xlockmore.h
providence.o: $(HACK_SRC)/xlockmoreI.h
pulsar.o: ../../config.h
pulsar.o: $(HACK_SRC)/fps.h
pulsar.o: $(HACK_SRC)/screenhackI.h
pulsar.o: $(UTILS_SRC)/colors.h
pulsar.o: $(UTILS_SRC)/grabscreen.h
pulsar.o: $(UTILS_SRC)/hsv.h
pulsar.o: $(UTILS_SRC)/resources.h
pulsar.o: $(UTILS_SRC)/usleep.h
pulsar.o: $(UTILS_SRC)/visual.h
pulsar.o: $(UTILS_SRC)/xshm.h
pulsar.o: $(UTILS_SRC)/yarandom.h
pulsar.o: $(HACK_SRC)/xlockmore.h
pulsar.o: $(HACK_SRC)/xlockmoreI.h
pulsar.o: $(srcdir)/xpm-ximage.h
quasicrystal.o: ../../config.h
quasicrystal.o: $(HACK_SRC)/fps.h
quasicrystal.o: $(srcdir)/rotator.h
quasicrystal.o: $(HACK_SRC)/screenhackI.h
quasicrystal.o: $(UTILS_SRC)/colors.h
quasicrystal.o: $(UTILS_SRC)/grabscreen.h
quasicrystal.o: $(UTILS_SRC)/hsv.h
quasicrystal.o: $(UTILS_SRC)/resources.h
quasicrystal.o: $(UTILS_SRC)/usleep.h
quasicrystal.o: $(UTILS_SRC)/visual.h
quasicrystal.o: $(UTILS_SRC)/xshm.h
quasicrystal.o: $(UTILS_SRC)/yarandom.h
quasicrystal.o: $(HACK_SRC)/xlockmore.h
quasicrystal.o: $(HACK_SRC)/xlockmoreI.h
queens.o: $(srcdir)/chessmodels.h
queens.o: ../../config.h
queens.o: $(HACK_SRC)/fps.h
queens.o: $(srcdir)/gltrackball.h
queens.o: $(HACK_SRC)/screenhackI.h
queens.o: $(UTILS_SRC)/colors.h
queens.o: $(UTILS_SRC)/grabscreen.h
queens.o: $(UTILS_SRC)/hsv.h
queens.o: $(UTILS_SRC)/resources.h
queens.o: $(UTILS_SRC)/usleep.h
queens.o: $(UTILS_SRC)/visual.h
queens.o: $(UTILS_SRC)/xshm.h
queens.o: $(UTILS_SRC)/yarandom.h
queens.o: $(HACK_SRC)/xlockmore.h
queens.o: $(HACK_SRC)/xlockmoreI.h
rotator.o: ../../config.h
rotator.o: $(srcdir)/rotator.h
rotator.o: $(UTILS_SRC)/yarandom.h
rubikblocks.o: ../../config.h
rubikblocks.o: $(HACK_SRC)/fps.h
rubikblocks.o: $(srcdir)/gltrackball.h
rubikblocks.o: $(srcdir)/rotator.h
rubikblocks.o: $(HACK_SRC)/screenhackI.h
rubikblocks.o: $(UTILS_SRC)/colors.h
rubikblocks.o: $(UTILS_SRC)/grabscreen.h
rubikblocks.o: $(UTILS_SRC)/hsv.h
rubikblocks.o: $(UTILS_SRC)/resources.h
rubikblocks.o: $(UTILS_SRC)/usleep.h
rubikblocks.o: $(UTILS_SRC)/visual.h
rubikblocks.o: $(UTILS_SRC)/xshm.h
rubikblocks.o: $(UTILS_SRC)/yarandom.h
rubikblocks.o: $(HACK_SRC)/xlockmore.h
rubikblocks.o: $(HACK_SRC)/xlockmoreI.h
rubik.o: ../../config.h
rubik.o: $(HACK_SRC)/fps.h
rubik.o: $(srcdir)/gltrackball.h
rubik.o: $(HACK_SRC)/screenhackI.h
rubik.o: $(UTILS_SRC)/colors.h
rubik.o: $(UTILS_SRC)/grabscreen.h
rubik.o: $(UTILS_SRC)/hsv.h
rubik.o: $(UTILS_SRC)/resources.h
rubik.o: $(UTILS_SRC)/usleep.h
rubik.o: $(UTILS_SRC)/visual.h
rubik.o: $(UTILS_SRC)/xshm.h
rubik.o: $(UTILS_SRC)/yarandom.h
rubik.o: $(HACK_SRC)/xlockmore.h
rubik.o: $(HACK_SRC)/xlockmoreI.h
s1_1.o: ../../config.h
s1_1.o: $(srcdir)/gllist.h
s1_2.o: ../../config.h
s1_2.o: $(srcdir)/gllist.h
s1_3.o: ../../config.h
s1_3.o: $(srcdir)/gllist.h
s1_4.o: ../../config.h
s1_4.o: $(srcdir)/gllist.h
s1_5.o: ../../config.h
s1_5.o: $(srcdir)/gllist.h
s1_6.o: ../../config.h
s1_6.o: $(srcdir)/gllist.h
s1_b.o: ../../config.h
s1_b.o: $(srcdir)/gllist.h
sballs.o: ../../config.h
sballs.o: $(HACK_SRC)/fps.h
sballs.o: $(srcdir)/gltrackball.h
sballs.o: $(HACK_SRC)/images/sball-bg.xpm
sballs.o: $(HACK_SRC)/images/sball.xpm
sballs.o: $(HACK_SRC)/screenhackI.h
sballs.o: $(UTILS_SRC)/colors.h
sballs.o: $(UTILS_SRC)/grabscreen.h
sballs.o: $(UTILS_SRC)/hsv.h
sballs.o: $(UTILS_SRC)/resources.h
sballs.o: $(UTILS_SRC)/usleep.h
sballs.o: $(UTILS_SRC)/visual.h
sballs.o: $(UTILS_SRC)/xshm.h
sballs.o: $(UTILS_SRC)/yarandom.h
sballs.o: $(HACK_SRC)/xlockmore.h
sballs.o: $(HACK_SRC)/xlockmoreI.h
sballs.o: $(srcdir)/xpm-ximage.h
shark.o: $(srcdir)/atlantis.h
shark.o: ../../config.h
shark.o: $(HACK_SRC)/fps.h
shark.o: $(HACK_SRC)/screenhackI.h
shark.o: $(UTILS_SRC)/colors.h
shark.o: $(UTILS_SRC)/grabscreen.h
shark.o: $(UTILS_SRC)/hsv.h
shark.o: $(UTILS_SRC)/resources.h
shark.o: $(UTILS_SRC)/usleep.h
shark.o: $(UTILS_SRC)/visual.h
shark.o: $(UTILS_SRC)/yarandom.h
sierpinski3d.o: ../../config.h
sierpinski3d.o: $(HACK_SRC)/fps.h
sierpinski3d.o: $(srcdir)/gltrackball.h
sierpinski3d.o: $(srcdir)/rotator.h
sierpinski3d.o: $(HACK_SRC)/screenhackI.h
sierpinski3d.o: $(UTILS_SRC)/colors.h
sierpinski3d.o: $(UTILS_SRC)/grabscreen.h
sierpinski3d.o: $(UTILS_SRC)/hsv.h
sierpinski3d.o: $(UTILS_SRC)/resources.h
sierpinski3d.o: $(UTILS_SRC)/usleep.h
sierpinski3d.o: $(UTILS_SRC)/visual.h
sierpinski3d.o: $(UTILS_SRC)/xshm.h
sierpinski3d.o: $(UTILS_SRC)/yarandom.h
sierpinski3d.o: $(HACK_SRC)/xlockmore.h
sierpinski3d.o: $(HACK_SRC)/xlockmoreI.h
skytentacles.o: ../../config.h
skytentacles.o: $(HACK_SRC)/fps.h
skytentacles.o: $(srcdir)/gltrackball.h
skytentacles.o: $(HACK_SRC)/images/scales.xpm
skytentacles.o: $(srcdir)/normals.h
skytentacles.o: $(srcdir)/rotator.h
skytentacles.o: $(HACK_SRC)/screenhackI.h
skytentacles.o: $(UTILS_SRC)/colors.h
skytentacles.o: $(UTILS_SRC)/grabscreen.h
skytentacles.o: $(UTILS_SRC)/hsv.h
skytentacles.o: $(UTILS_SRC)/resources.h
skytentacles.o: $(UTILS_SRC)/usleep.h
skytentacles.o: $(UTILS_SRC)/visual.h
skytentacles.o: $(UTILS_SRC)/xshm.h
skytentacles.o: $(UTILS_SRC)/yarandom.h
skytentacles.o: $(HACK_SRC)/xlockmore.h
skytentacles.o: $(HACK_SRC)/xlockmoreI.h
skytentacles.o: $(srcdir)/xpm-ximage.h
sonar-icmp.o: ../../config.h
sonar-icmp.o: $(HACK_SRC)/fps.h
sonar-icmp.o: $(HACK_SRC)/screenhackI.h
sonar-icmp.o: $(srcdir)/sonar.h
sonar-icmp.o: $(UTILS_SRC)/colors.h
sonar-icmp.o: $(UTILS_SRC)/grabscreen.h
sonar-icmp.o: $(UTILS_SRC)/hsv.h
sonar-icmp.o: $(UTILS_SRC)/resources.h
sonar-icmp.o: $(UTILS_SRC)/usleep.h
sonar-icmp.o: $(UTILS_SRC)/version.h
sonar-icmp.o: $(UTILS_SRC)/visual.h
sonar-icmp.o: $(UTILS_SRC)/yarandom.h
sonar.o: ../../config.h
sonar.o: $(HACK_SRC)/fps.h
sonar.o: $(srcdir)/gltrackball.h
sonar.o: $(srcdir)/rotator.h
sonar.o: $(HACK_SRC)/screenhackI.h
sonar.o: $(srcdir)/sonar.h
sonar.o: $(srcdir)/texfont.h
sonar.o: $(UTILS_SRC)/colors.h
sonar.o: $(UTILS_SRC)/grabscreen.h
sonar.o: $(UTILS_SRC)/hsv.h
sonar.o: $(UTILS_SRC)/resources.h
sonar.o: $(UTILS_SRC)/usleep.h
sonar.o: $(UTILS_SRC)/visual.h
sonar.o: $(UTILS_SRC)/xshm.h
sonar.o: $(UTILS_SRC)/yarandom.h
sonar.o: $(HACK_SRC)/xlockmore.h
sonar.o: $(HACK_SRC)/xlockmoreI.h
sonar-sim.o: ../../config.h
sonar-sim.o: $(HACK_SRC)/fps.h
sonar-sim.o: $(HACK_SRC)/screenhackI.h
sonar-sim.o: $(srcdir)/sonar.h
sonar-sim.o: $(UTILS_SRC)/colors.h
sonar-sim.o: $(UTILS_SRC)/grabscreen.h
sonar-sim.o: $(UTILS_SRC)/hsv.h
sonar-sim.o: $(UTILS_SRC)/resources.h
sonar-sim.o: $(UTILS_SRC)/usleep.h
sonar-sim.o: $(UTILS_SRC)/visual.h
sonar-sim.o: $(UTILS_SRC)/yarandom.h
spheremonics.o: ../../config.h
spheremonics.o: $(HACK_SRC)/fps.h
spheremonics.o: $(srcdir)/gltrackball.h
spheremonics.o: $(srcdir)/glxfonts.h
spheremonics.o: $(srcdir)/normals.h
spheremonics.o: $(srcdir)/rotator.h
spheremonics.o: $(HACK_SRC)/screenhackI.h
spheremonics.o: $(UTILS_SRC)/colors.h
spheremonics.o: $(UTILS_SRC)/grabscreen.h
spheremonics.o: $(UTILS_SRC)/hsv.h
spheremonics.o: $(UTILS_SRC)/resources.h
spheremonics.o: $(UTILS_SRC)/usleep.h
spheremonics.o: $(UTILS_SRC)/visual.h
spheremonics.o: $(UTILS_SRC)/xshm.h
spheremonics.o: $(UTILS_SRC)/yarandom.h
spheremonics.o: $(HACK_SRC)/xlockmore.h
spheremonics.o: $(HACK_SRC)/xlockmoreI.h
sphere.o: ../../config.h
sphere.o: $(srcdir)/sphere.h
sproingies.o: ../../config.h
sproingies.o: $(HACK_SRC)/fps.h
sproingies.o: $(srcdir)/gllist.h
sproingies.o: $(HACK_SRC)/screenhackI.h
sproingies.o: $(srcdir)/sproingies.h
sproingies.o: $(UTILS_SRC)/colors.h
sproingies.o: $(UTILS_SRC)/grabscreen.h
sproingies.o: $(UTILS_SRC)/hsv.h
sproingies.o: $(UTILS_SRC)/resources.h
sproingies.o: $(UTILS_SRC)/usleep.h
sproingies.o: $(UTILS_SRC)/visual.h
sproingies.o: $(UTILS_SRC)/xshm.h
sproingies.o: $(UTILS_SRC)/yarandom.h
sproingies.o: $(HACK_SRC)/xlockmoreI.h
sproingiewrap.o: ../../config.h
sproingiewrap.o: $(HACK_SRC)/fps.h
sproingiewrap.o: $(HACK_SRC)/screenhackI.h
sproingiewrap.o: $(srcdir)/sproingies.h
sproingiewrap.o: $(UTILS_SRC)/colors.h
sproingiewrap.o: $(UTILS_SRC)/grabscreen.h
sproingiewrap.o: $(UTILS_SRC)/hsv.h
sproingiewrap.o: $(UTILS_SRC)/resources.h
sproingiewrap.o: $(UTILS_SRC)/usleep.h
sproingiewrap.o: $(UTILS_SRC)/visual.h
sproingiewrap.o: $(UTILS_SRC)/xshm.h
sproingiewrap.o: $(UTILS_SRC)/yarandom.h
sproingiewrap.o: $(HACK_SRC)/xlockmore.h
sproingiewrap.o: $(HACK_SRC)/xlockmoreI.h
stairs.o: ../../config.h
stairs.o: $(HACK_SRC)/fps.h
stairs.o: $(srcdir)/gltrackball.h
stairs.o: $(HACK_SRC)/images/wood.xpm
stairs.o: $(HACK_SRC)/screenhackI.h
stairs.o: $(srcdir)/sphere.h
stairs.o: $(UTILS_SRC)/colors.h
stairs.o: $(UTILS_SRC)/grabscreen.h
stairs.o: $(UTILS_SRC)/hsv.h
stairs.o: $(UTILS_SRC)/resources.h
stairs.o: $(UTILS_SRC)/usleep.h
stairs.o: $(UTILS_SRC)/visual.h
stairs.o: $(UTILS_SRC)/xshm.h
stairs.o: $(UTILS_SRC)/yarandom.h
stairs.o: $(HACK_SRC)/xlockmore.h
stairs.o: $(HACK_SRC)/xlockmoreI.h
stairs.o: $(srcdir)/xpm-ximage.h
starwars.o: ../../config.h
starwars.o: $(HACK_SRC)/fps.h
starwars.o: $(srcdir)/glut_roman.h
starwars.o: $(srcdir)/glutstroke.h
starwars.o: $(HACK_SRC)/screenhackI.h
starwars.o: $(srcdir)/starwars.h
starwars.o: $(srcdir)/texfont.h
starwars.o: $(UTILS_SRC)/colors.h
starwars.o: $(UTILS_SRC)/grabscreen.h
starwars.o: $(UTILS_SRC)/hsv.h
starwars.o: $(UTILS_SRC)/resources.h
starwars.o: $(UTILS_SRC)/textclient.h
starwars.o: $(UTILS_SRC)/usleep.h
starwars.o: $(UTILS_SRC)/visual.h
starwars.o: $(UTILS_SRC)/xshm.h
starwars.o: $(UTILS_SRC)/yarandom.h
starwars.o: $(HACK_SRC)/xlockmore.h
starwars.o: $(HACK_SRC)/xlockmoreI.h
stonerview-move.o: ../../config.h
stonerview-move.o: $(srcdir)/stonerview.h
stonerview-move.o: $(srcdir)/stonerview-move.h
stonerview-move.o: $(srcdir)/stonerview-osc.h
stonerview-move.o: $(UTILS_SRC)/yarandom.h
stonerview.o: ../../config.h
stonerview.o: $(HACK_SRC)/fps.h
stonerview.o: $(srcdir)/gltrackball.h
stonerview-osc.o: ../../config.h
stonerview-osc.o: $(srcdir)/stonerview.h
stonerview-osc.o: $(srcdir)/stonerview-move.h
stonerview-osc.o: $(srcdir)/stonerview-osc.h
stonerview-osc.o: $(UTILS_SRC)/yarandom.h
stonerview.o: $(HACK_SRC)/screenhackI.h
stonerview.o: $(srcdir)/stonerview.h
stonerview.o: $(srcdir)/stonerview-move.h
stonerview.o: $(srcdir)/stonerview-osc.h
stonerview.o: $(UTILS_SRC)/colors.h
stonerview.o: $(UTILS_SRC)/grabscreen.h
stonerview.o: $(UTILS_SRC)/hsv.h
stonerview.o: $(UTILS_SRC)/resources.h
stonerview.o: $(UTILS_SRC)/usleep.h
stonerview.o: $(UTILS_SRC)/visual.h
stonerview.o: $(UTILS_SRC)/xshm.h
stonerview.o: $(UTILS_SRC)/yarandom.h
stonerview.o: $(HACK_SRC)/xlockmore.h
stonerview.o: $(HACK_SRC)/xlockmoreI.h
stonerview-view.o: ../../config.h
stonerview-view.o: $(srcdir)/stonerview.h
stonerview-view.o: $(srcdir)/stonerview-move.h
stonerview-view.o: $(srcdir)/stonerview-osc.h
superquadrics.o: ../../config.h
superquadrics.o: $(HACK_SRC)/fps.h
superquadrics.o: $(HACK_SRC)/screenhackI.h
superquadrics.o: $(UTILS_SRC)/colors.h
superquadrics.o: $(UTILS_SRC)/grabscreen.h
superquadrics.o: $(UTILS_SRC)/hsv.h
superquadrics.o: $(UTILS_SRC)/resources.h
superquadrics.o: $(UTILS_SRC)/usleep.h
superquadrics.o: $(UTILS_SRC)/visual.h
superquadrics.o: $(UTILS_SRC)/xshm.h
superquadrics.o: $(UTILS_SRC)/yarandom.h
superquadrics.o: $(HACK_SRC)/xlockmore.h
superquadrics.o: $(HACK_SRC)/xlockmoreI.h
surfaces.o: ../../config.h
surfaces.o: $(HACK_SRC)/fps.h
surfaces.o: $(srcdir)/gltrackball.h
surfaces.o: $(srcdir)/rotator.h
surfaces.o: $(HACK_SRC)/screenhackI.h
surfaces.o: $(UTILS_SRC)/colors.h
surfaces.o: $(UTILS_SRC)/grabscreen.h
surfaces.o: $(UTILS_SRC)/hsv.h
surfaces.o: $(UTILS_SRC)/resources.h
surfaces.o: $(UTILS_SRC)/usleep.h
surfaces.o: $(UTILS_SRC)/visual.h
surfaces.o: $(UTILS_SRC)/xshm.h
surfaces.o: $(UTILS_SRC)/yarandom.h
surfaces.o: $(HACK_SRC)/xlockmore.h
surfaces.o: $(HACK_SRC)/xlockmoreI.h
swim.o: $(srcdir)/atlantis.h
swim.o: ../../config.h
swim.o: $(HACK_SRC)/fps.h
swim.o: $(HACK_SRC)/screenhackI.h
swim.o: $(UTILS_SRC)/colors.h
swim.o: $(UTILS_SRC)/grabscreen.h
swim.o: $(UTILS_SRC)/hsv.h
swim.o: $(UTILS_SRC)/resources.h
swim.o: $(UTILS_SRC)/usleep.h
swim.o: $(UTILS_SRC)/visual.h
swim.o: $(UTILS_SRC)/xshm.h
swim.o: $(UTILS_SRC)/yarandom.h
swim.o: $(HACK_SRC)/xlockmoreI.h
tangram.o: ../../config.h
tangram.o: $(HACK_SRC)/fps.h
tangram.o: $(srcdir)/glxfonts.h
tangram.o: $(HACK_SRC)/screenhackI.h
tangram.o: $(srcdir)/tangram_shapes.h
tangram.o: $(UTILS_SRC)/colors.h
tangram.o: $(UTILS_SRC)/grabscreen.h
tangram.o: $(UTILS_SRC)/hsv.h
tangram.o: $(UTILS_SRC)/resources.h
tangram.o: $(UTILS_SRC)/usleep.h
tangram.o: $(UTILS_SRC)/visual.h
tangram.o: $(UTILS_SRC)/xshm.h
tangram.o: $(UTILS_SRC)/yarandom.h
tangram.o: $(HACK_SRC)/xlockmore.h
tangram.o: $(HACK_SRC)/xlockmoreI.h
tangram_shapes.o: ../../config.h
tangram_shapes.o: $(srcdir)/tangram_shapes.h
teapot.o: ../../config.h
teapot.o: $(srcdir)/teapot.h
texfont.o: ../../config.h
texfont.o: $(srcdir)/texfont.h
texfont.o: $(UTILS_SRC)/resources.h
timetunnel.o: ../../config.h
timetunnel.o: $(HACK_SRC)/fps.h
timetunnel.o: $(srcdir)/gltrackball.h
timetunnel.o: $(HACK_SRC)/images/timetunnel0.xpm
timetunnel.o: $(HACK_SRC)/images/timetunnel1.xpm
timetunnel.o: $(HACK_SRC)/images/timetunnel2.xpm
timetunnel.o: $(HACK_SRC)/images/tunnelstar.xpm
timetunnel.o: $(srcdir)/rotator.h
timetunnel.o: $(HACK_SRC)/screenhackI.h
timetunnel.o: $(UTILS_SRC)/colors.h
timetunnel.o: $(UTILS_SRC)/grabscreen.h
timetunnel.o: $(UTILS_SRC)/hsv.h
timetunnel.o: $(UTILS_SRC)/images/logo-180.xpm
timetunnel.o: $(UTILS_SRC)/resources.h
timetunnel.o: $(UTILS_SRC)/usleep.h
timetunnel.o: $(UTILS_SRC)/visual.h
timetunnel.o: $(UTILS_SRC)/xshm.h
timetunnel.o: $(UTILS_SRC)/yarandom.h
timetunnel.o: $(HACK_SRC)/xlockmore.h
timetunnel.o: $(HACK_SRC)/xlockmoreI.h
timetunnel.o: $(srcdir)/xpm-ximage.h
toast2.o: ../../config.h
toast2.o: $(srcdir)/gllist.h
toaster_base.o: ../../config.h
toaster_base.o: $(srcdir)/gllist.h
toaster_handle2.o: ../../config.h
toaster_handle2.o: $(srcdir)/gllist.h
toaster_handle.o: ../../config.h
toaster_handle.o: $(srcdir)/gllist.h
toaster_jet.o: ../../config.h
toaster_jet.o: $(srcdir)/gllist.h
toaster_knob.o: ../../config.h
toaster_knob.o: $(srcdir)/gllist.h
toaster.o: ../../config.h
toaster.o: $(srcdir)/gllist.h
toaster_slots.o: ../../config.h
toaster_slots.o: $(srcdir)/gllist.h
toaster_wing.o: ../../config.h
toaster_wing.o: $(srcdir)/gllist.h
toast.o: ../../config.h
toast.o: $(srcdir)/gllist.h
topblock.o: ../../config.h
topblock.o: $(HACK_SRC)/fps.h
topblock.o: $(srcdir)/gltrackball.h
topblock.o: $(HACK_SRC)/screenhackI.h
topblock.o: $(srcdir)/sphere.h
topblock.o: $(srcdir)/topblock.h
topblock.o: $(srcdir)/tube.h
topblock.o: $(UTILS_SRC)/colors.h
topblock.o: $(UTILS_SRC)/grabscreen.h
topblock.o: $(UTILS_SRC)/hsv.h
topblock.o: $(UTILS_SRC)/resources.h
topblock.o: $(UTILS_SRC)/usleep.h
topblock.o: $(UTILS_SRC)/visual.h
topblock.o: $(UTILS_SRC)/xshm.h
topblock.o: $(UTILS_SRC)/yarandom.h
topblock.o: $(HACK_SRC)/xlockmore.h
topblock.o: $(HACK_SRC)/xlockmoreI.h
trackball.o: ../../config.h
trackball.o: $(srcdir)/trackball.h
tronbit_idle1.o: ../../config.h
tronbit_idle1.o: $(srcdir)/gllist.h
tronbit_idle2.o: ../../config.h
tronbit_idle2.o: $(srcdir)/gllist.h
tronbit_no.o: ../../config.h
tronbit_no.o: $(srcdir)/gllist.h
tronbit.o: ../../config.h
tronbit.o: $(HACK_SRC)/fps.h
tronbit.o: $(srcdir)/gllist.h
tronbit.o: $(srcdir)/gltrackball.h
tronbit.o: $(srcdir)/rotator.h
tronbit.o: $(HACK_SRC)/screenhackI.h
tronbit.o: $(srcdir)/sphere.h
tronbit.o: $(UTILS_SRC)/colors.h
tronbit.o: $(UTILS_SRC)/grabscreen.h
tronbit.o: $(UTILS_SRC)/hsv.h
tronbit.o: $(UTILS_SRC)/resources.h
tronbit.o: $(UTILS_SRC)/usleep.h
tronbit.o: $(UTILS_SRC)/visual.h
tronbit.o: $(UTILS_SRC)/xshm.h
tronbit.o: $(UTILS_SRC)/yarandom.h
tronbit.o: $(HACK_SRC)/xlockmore.h
tronbit.o: $(HACK_SRC)/xlockmoreI.h
tronbit_yes.o: ../../config.h
tronbit_yes.o: $(srcdir)/gllist.h
tube.o: ../../config.h
tube.o: $(srcdir)/tube.h
tunnel_draw.o: ../../config.h
tunnel_draw.o: $(HACK_SRC)/fps.h
tunnel_draw.o: $(HACK_SRC)/screenhackI.h
tunnel_draw.o: $(srcdir)/tunnel_draw.h
tunnel_draw.o: $(UTILS_SRC)/colors.h
tunnel_draw.o: $(UTILS_SRC)/grabscreen.h
tunnel_draw.o: $(UTILS_SRC)/hsv.h
tunnel_draw.o: $(UTILS_SRC)/resources.h
tunnel_draw.o: $(UTILS_SRC)/usleep.h
tunnel_draw.o: $(UTILS_SRC)/visual.h
tunnel_draw.o: $(UTILS_SRC)/xshm.h
tunnel_draw.o: $(UTILS_SRC)/yarandom.h
tunnel_draw.o: $(HACK_SRC)/xlockmoreI.h
unknownpleasures.o: ../../config.h
unknownpleasures.o: $(HACK_SRC)/fps.h
unknownpleasures.o: $(srcdir)/gltrackball.h
unknownpleasures.o: $(HACK_SRC)/screenhackI.h
unknownpleasures.o: $(UTILS_SRC)/colors.h
unknownpleasures.o: $(UTILS_SRC)/grabscreen.h
unknownpleasures.o: $(UTILS_SRC)/hsv.h
unknownpleasures.o: $(UTILS_SRC)/resources.h
unknownpleasures.o: $(UTILS_SRC)/usleep.h
unknownpleasures.o: $(UTILS_SRC)/visual.h
unknownpleasures.o: $(UTILS_SRC)/xshm.h
unknownpleasures.o: $(UTILS_SRC)/yarandom.h
unknownpleasures.o: $(HACK_SRC)/xlockmore.h
unknownpleasures.o: $(HACK_SRC)/xlockmoreI.h
voronoi.o: ../../config.h
voronoi.o: $(HACK_SRC)/fps.h
voronoi.o: $(HACK_SRC)/screenhackI.h
voronoi.o: $(UTILS_SRC)/colors.h
voronoi.o: $(UTILS_SRC)/grabscreen.h
voronoi.o: $(UTILS_SRC)/hsv.h
voronoi.o: $(UTILS_SRC)/resources.h
voronoi.o: $(UTILS_SRC)/usleep.h
voronoi.o: $(UTILS_SRC)/visual.h
voronoi.o: $(UTILS_SRC)/xshm.h
voronoi.o: $(UTILS_SRC)/yarandom.h
voronoi.o: $(HACK_SRC)/xlockmore.h
voronoi.o: $(HACK_SRC)/xlockmoreI.h
whale.o: $(srcdir)/atlantis.h
whale.o: ../../config.h
whale.o: $(HACK_SRC)/fps.h
whale.o: $(HACK_SRC)/screenhackI.h
whale.o: $(UTILS_SRC)/colors.h
whale.o: $(UTILS_SRC)/grabscreen.h
whale.o: $(UTILS_SRC)/hsv.h
whale.o: $(UTILS_SRC)/resources.h
whale.o: $(UTILS_SRC)/usleep.h
whale.o: $(UTILS_SRC)/visual.h
whale.o: $(UTILS_SRC)/yarandom.h
xlock-gl-utils.o: ../../config.h
xlock-gl-utils.o: $(HACK_SRC)/fps.h
xlock-gl-utils.o: $(srcdir)/glxfonts.h
xlock-gl-utils.o: $(HACK_SRC)/screenhackI.h
xlock-gl-utils.o: $(UTILS_SRC)/colors.h
xlock-gl-utils.o: $(UTILS_SRC)/grabscreen.h
xlock-gl-utils.o: $(UTILS_SRC)/hsv.h
xlock-gl-utils.o: $(UTILS_SRC)/resources.h
xlock-gl-utils.o: $(UTILS_SRC)/usleep.h
xlock-gl-utils.o: $(UTILS_SRC)/visual.h
xlock-gl-utils.o: $(UTILS_SRC)/xshm.h
xlock-gl-utils.o: $(UTILS_SRC)/yarandom.h
xlock-gl-utils.o: $(HACK_SRC)/xlockmoreI.h
xpm-ximage.o: ../../config.h
xpm-ximage.o: $(srcdir)/xpm-ximage.h
xscreensaver-gl-helper.o: ../../config.h
xscreensaver-gl-helper.o: $(UTILS_SRC)/utils.h
xscreensaver-gl-helper.o: $(UTILS_SRC)/visual.h

