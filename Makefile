##############################
# @file Makefile for mecharia
##############################
#
## PROJECT ##############################

SHELL=/bin/sh
PROJECT=mecharia2
VERSION=0.1
ASN=4

## END PROJECT ############################
#
## DIRS ##############################

PREFIX=.
BINDIR=$(PREFIX)/bin
IDIR=$(PREFIX)/include
SRCDIR=$(PREFIX)/src/asn$(ASN)
LIBDIR=$(PREFIX)/lib
CLEAN=$(LIBDIR) 
REQUIRED_DIRS=$(BINDIR) $(LIBDIR)
DATADIR=$(PREFIX)/data/asn$(ASN)

## END DIRS ############################
#
## FILES ##############################
FILETYPE=cpp
DOXYGEN_CONFIG_FILE=$(PREFIX)/doxygen.conf
## END FILES ############################
#
## FLAGS ##############################

LLIBS=Aria ArNetworking dl pthread
LLIBS:=$(patsubst %, -l%, $(LLIBS))

export CC=g++
export CXXFLAGS=-I$(IDIR) -I /usr/local/Aria/include/ -Wall -g -fPIC -D RUNASNx="asn$(ASN)(&robot)" -D ASNxHEADER="asn$(ASN)(ArRobot*)"
export LXXFLAGS=$(LLIBS) -L/usr/local/Aria/lib

SOFLAGS=-shared

## END FLAGS ############################
#
## OBJECTS ##############################

OBJS:=$(patsubst %.$(FILETYPE), %.o, $(wildcard $(SRCDIR)/*$(FILETYPE)))
OBJS+=$(patsubst %.$(FILETYPE), %.o, $(wildcard $(PREFIX)/src/*$(FILETYPE)))
LIBOBJS=
LIBOBJS:=$(patsubst %.o, $(SRCDIR)/%.o, $(LIBOBJS))
LIBOBJECTS=$(filter $(LIBOBJS), $(OBJS))
LIBNAME=#$(PROJECT)
LIBTARGET=#$(LIBDIR)/lib$(LIBNAME).so
OBJECTS:=$(filter-out $(LIBOBJECTS), $(OBJS))

## END OBJECTS ############################
#
## TARGETS ##############################

TARGET=$(BINDIR)/$(PROJECT)

.PHONY: all setup clean package doc

all: setup $(TARGET)

#for debuging this make file
debugmk: 
	@echo $(OBJS)
	@echo $(LIBOBJECTS)

#create directories that are needed before building
setup:
	@mkdir -p $(REQUIRED_DIRS)

$(LIBTARGET): $(LIBOBJECTS)
	$(CC) -o $(LIBTARGET) $(LIBOBJECTS) $(SOFLAGS) $(LXXFLAGS)

$(TARGET): $(LIBTARGET) $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LXXFLAGS) 

#perform a recursive build 
#build: $(SUBDIRS)

#perform a recursive clean
#clean: $(SUBDIRS)
clean: CLEAN += $(OBJECTS) $(LIBOBJECTS)
clean: 
	rm -rf $(CLEAN)

doc:
	doxygen $(DOXYGEN_CONFIG_FILE)

run: all
	clear
	export "LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/usr/local/Aria/lib"; \
	$(TARGET)

dbg: all
	clear
	export "LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/usr/local/Aria/lib"; \
	gdb ./bin/mecharia

pdf:
	cd $(SRCDIR); \
	pdflatex ./*.tex

analyze:
	cd $(DATADIR);\
	octave analyze.m;\
	gnuplot -p graph.gp
## END TARGETS ############################
