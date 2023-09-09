#-- start of make_header -----------------

#====================================
#  Library eta2pipiAlg
#
#   Generated Thu Sep  7 08:54:01 2023  by lyuyunhe
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_eta2pipiAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_eta2pipiAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_eta2pipiAlg

eta2pipiAlg_tag = $(tag)

#cmt_local_tagfile_eta2pipiAlg = $(eta2pipiAlg_tag)_eta2pipiAlg.make
cmt_local_tagfile_eta2pipiAlg = $(bin)$(eta2pipiAlg_tag)_eta2pipiAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

eta2pipiAlg_tag = $(tag)

#cmt_local_tagfile_eta2pipiAlg = $(eta2pipiAlg_tag).make
cmt_local_tagfile_eta2pipiAlg = $(bin)$(eta2pipiAlg_tag).make

endif

include $(cmt_local_tagfile_eta2pipiAlg)
#-include $(cmt_local_tagfile_eta2pipiAlg)

ifdef cmt_eta2pipiAlg_has_target_tag

cmt_final_setup_eta2pipiAlg = $(bin)setup_eta2pipiAlg.make
cmt_dependencies_in_eta2pipiAlg = $(bin)dependencies_eta2pipiAlg.in
#cmt_final_setup_eta2pipiAlg = $(bin)eta2pipiAlg_eta2pipiAlgsetup.make
cmt_local_eta2pipiAlg_makefile = $(bin)eta2pipiAlg.make

else

cmt_final_setup_eta2pipiAlg = $(bin)setup.make
cmt_dependencies_in_eta2pipiAlg = $(bin)dependencies.in
#cmt_final_setup_eta2pipiAlg = $(bin)eta2pipiAlgsetup.make
cmt_local_eta2pipiAlg_makefile = $(bin)eta2pipiAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)eta2pipiAlgsetup.make

#eta2pipiAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'eta2pipiAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = eta2pipiAlg/
#eta2pipiAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

eta2pipiAlglibname   = $(bin)$(library_prefix)eta2pipiAlg$(library_suffix)
eta2pipiAlglib       = $(eta2pipiAlglibname).a
eta2pipiAlgstamp     = $(bin)eta2pipiAlg.stamp
eta2pipiAlgshstamp   = $(bin)eta2pipiAlg.shstamp

eta2pipiAlg :: dirs  eta2pipiAlgLIB
	$(echo) "eta2pipiAlg ok"

#-- end of libary_header ----------------

eta2pipiAlgLIB :: $(eta2pipiAlglib) $(eta2pipiAlgshstamp)
	@/bin/echo "------> eta2pipiAlg : library ok"

$(eta2pipiAlglib) :: $(bin)eta2pipi.o $(bin)eta2pipi_load.o $(bin)eta2pipi_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(eta2pipiAlglib) $?
	$(lib_silent) $(ranlib) $(eta2pipiAlglib)
	$(lib_silent) cat /dev/null >$(eta2pipiAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(eta2pipiAlglibname).$(shlibsuffix) :: $(eta2pipiAlglib) $(eta2pipiAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" eta2pipiAlg $(eta2pipiAlg_shlibflags)

$(eta2pipiAlgshstamp) :: $(eta2pipiAlglibname).$(shlibsuffix)
	@if test -f $(eta2pipiAlglibname).$(shlibsuffix) ; then cat /dev/null >$(eta2pipiAlgshstamp) ; fi

eta2pipiAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)eta2pipi.o $(bin)eta2pipi_load.o $(bin)eta2pipi_entries.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
eta2pipiAlginstallname = $(library_prefix)eta2pipiAlg$(library_suffix).$(shlibsuffix)

eta2pipiAlg :: eta2pipiAlginstall

install :: eta2pipiAlginstall

eta2pipiAlginstall :: $(install_dir)/$(eta2pipiAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(eta2pipiAlginstallname) :: $(bin)$(eta2pipiAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(eta2pipiAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(eta2pipiAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(eta2pipiAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(eta2pipiAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(eta2pipiAlginstallname) $(install_dir)/$(eta2pipiAlginstallname); \
	      echo `pwd`/$(eta2pipiAlginstallname) >$(install_dir)/$(eta2pipiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(eta2pipiAlginstallname), no installation directory specified"; \
	  fi; \
	fi

eta2pipiAlgclean :: eta2pipiAlguninstall

uninstall :: eta2pipiAlguninstall

eta2pipiAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(eta2pipiAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(eta2pipiAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(eta2pipiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(eta2pipiAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),eta2pipiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)eta2pipi.d

$(bin)$(binobj)eta2pipi.d :

$(bin)$(binobj)eta2pipi.o : $(cmt_final_setup_eta2pipiAlg)

$(bin)$(binobj)eta2pipi.o : $(src)eta2pipi.cxx
	$(cpp_echo) $(src)eta2pipi.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_cppflags) $(eta2pipi_cxx_cppflags)  $(src)eta2pipi.cxx
endif
endif

else
$(bin)eta2pipiAlg_dependencies.make : $(eta2pipi_cxx_dependencies)

$(bin)eta2pipiAlg_dependencies.make : $(src)eta2pipi.cxx

$(bin)$(binobj)eta2pipi.o : $(eta2pipi_cxx_dependencies)
	$(cpp_echo) $(src)eta2pipi.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_cppflags) $(eta2pipi_cxx_cppflags)  $(src)eta2pipi.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),eta2pipiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)eta2pipi_load.d

$(bin)$(binobj)eta2pipi_load.d :

$(bin)$(binobj)eta2pipi_load.o : $(cmt_final_setup_eta2pipiAlg)

$(bin)$(binobj)eta2pipi_load.o : $(src)components/eta2pipi_load.cxx
	$(cpp_echo) $(src)components/eta2pipi_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_load_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_load_cppflags) $(eta2pipi_load_cxx_cppflags) -I../src/components $(src)components/eta2pipi_load.cxx
endif
endif

else
$(bin)eta2pipiAlg_dependencies.make : $(eta2pipi_load_cxx_dependencies)

$(bin)eta2pipiAlg_dependencies.make : $(src)components/eta2pipi_load.cxx

$(bin)$(binobj)eta2pipi_load.o : $(eta2pipi_load_cxx_dependencies)
	$(cpp_echo) $(src)components/eta2pipi_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_load_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_load_cppflags) $(eta2pipi_load_cxx_cppflags) -I../src/components $(src)components/eta2pipi_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),eta2pipiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)eta2pipi_entries.d

$(bin)$(binobj)eta2pipi_entries.d :

$(bin)$(binobj)eta2pipi_entries.o : $(cmt_final_setup_eta2pipiAlg)

$(bin)$(binobj)eta2pipi_entries.o : $(src)components/eta2pipi_entries.cxx
	$(cpp_echo) $(src)components/eta2pipi_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_entries_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_entries_cppflags) $(eta2pipi_entries_cxx_cppflags) -I../src/components $(src)components/eta2pipi_entries.cxx
endif
endif

else
$(bin)eta2pipiAlg_dependencies.make : $(eta2pipi_entries_cxx_dependencies)

$(bin)eta2pipiAlg_dependencies.make : $(src)components/eta2pipi_entries.cxx

$(bin)$(binobj)eta2pipi_entries.o : $(eta2pipi_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/eta2pipi_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(eta2pipiAlg_pp_cppflags) $(lib_eta2pipiAlg_pp_cppflags) $(eta2pipi_entries_pp_cppflags) $(use_cppflags) $(eta2pipiAlg_cppflags) $(lib_eta2pipiAlg_cppflags) $(eta2pipi_entries_cppflags) $(eta2pipi_entries_cxx_cppflags) -I../src/components $(src)components/eta2pipi_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: eta2pipiAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(eta2pipiAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

eta2pipiAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library eta2pipiAlg
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)eta2pipiAlg$(library_suffix).a $(library_prefix)eta2pipiAlg$(library_suffix).s? eta2pipiAlg.stamp eta2pipiAlg.shstamp
#-- end of cleanup_library ---------------
