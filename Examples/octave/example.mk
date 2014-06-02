# Note: as a convention an example must be in a child directory of this.
# These paths are relative to such an example directory

TOP        = ../..
SWIG       = $(TOP)/../preinst-swig
TARGET     = swigexample
INTERFACE  = example.i

ifeq (,$(NOUTFILES))
  NOUTFILES = 3
endif
ifeq (1,$(NOUTFILES))
  ICXXSRCS = example_wrap.cxx
else
  ifeq (2,$(NOUTFILES))
    ICXXSRCS = example_wrap1.cxx example_wrap2.cxx
  else
    ifeq (3,$(NOUTFILES))
      ICXXSRCS = example_wrap1.cxx example_wrap2.cxx example_wrap3.cxx
    else
      $(error Invalid value for NOUTFILES=$(NOUTFILES))
    endif
  endif
endif

BUILDCMD = \
	$(MAKE) -f $(TOP)/Makefile \
	SRCDIR='$(SRCDIR)' \
	SWIG='$(SWIG)' \
	INTERFACE='$(INTERFACE)' \
	ICXXSRCS='$(ICXXSRCS)'

ifneq (,$(SRCS))
  BUILDCMD += SRCS='$(SRCS)'
  BUILDTARGET = octave
else
  BUILDCMD += CXXSRCS='$(CXXSRCS)'
  BUILDTARGET = octave_cpp
endif

check: build
	$(MAKE) -f $(TOP)/Makefile SRCDIR='$(SRCDIR)' octave_run

build:
	$(BUILDCMD) SWIGOPT='$(SWIGOPT)' TARGET='$(TARGET)' $(BUILDTARGET)

ifneq (,$(TARGET2)$(SWIGOPT2))

check: build2

build2:
	$(BUILDCMD) SWIGOPT='$(SWIGOPT2)' TARGET='$(TARGET2)' $(BUILDTARGET)

endif

clean:
	$(MAKE) -f $(TOP)/Makefile SRCDIR='$(SRCDIR)' octave_clean
