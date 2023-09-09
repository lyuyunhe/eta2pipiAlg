#-- start of make_header -----------------

#====================================
#  Document eta2pipiAlg_check_install_runtime
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

cmt_eta2pipiAlg_check_install_runtime_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_eta2pipiAlg_check_install_runtime_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_eta2pipiAlg_check_install_runtime

eta2pipiAlg_tag = $(tag)

#cmt_local_tagfile_eta2pipiAlg_check_install_runtime = $(eta2pipiAlg_tag)_eta2pipiAlg_check_install_runtime.make
cmt_local_tagfile_eta2pipiAlg_check_install_runtime = $(bin)$(eta2pipiAlg_tag)_eta2pipiAlg_check_install_runtime.make

else

tags      = $(tag),$(CMTEXTRATAGS)

eta2pipiAlg_tag = $(tag)

#cmt_local_tagfile_eta2pipiAlg_check_install_runtime = $(eta2pipiAlg_tag).make
cmt_local_tagfile_eta2pipiAlg_check_install_runtime = $(bin)$(eta2pipiAlg_tag).make

endif

include $(cmt_local_tagfile_eta2pipiAlg_check_install_runtime)
#-include $(cmt_local_tagfile_eta2pipiAlg_check_install_runtime)

ifdef cmt_eta2pipiAlg_check_install_runtime_has_target_tag

cmt_final_setup_eta2pipiAlg_check_install_runtime = $(bin)setup_eta2pipiAlg_check_install_runtime.make
cmt_dependencies_in_eta2pipiAlg_check_install_runtime = $(bin)dependencies_eta2pipiAlg_check_install_runtime.in
#cmt_final_setup_eta2pipiAlg_check_install_runtime = $(bin)eta2pipiAlg_eta2pipiAlg_check_install_runtimesetup.make
cmt_local_eta2pipiAlg_check_install_runtime_makefile = $(bin)eta2pipiAlg_check_install_runtime.make

else

cmt_final_setup_eta2pipiAlg_check_install_runtime = $(bin)setup.make
cmt_dependencies_in_eta2pipiAlg_check_install_runtime = $(bin)dependencies.in
#cmt_final_setup_eta2pipiAlg_check_install_runtime = $(bin)eta2pipiAlgsetup.make
cmt_local_eta2pipiAlg_check_install_runtime_makefile = $(bin)eta2pipiAlg_check_install_runtime.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)eta2pipiAlgsetup.make

#eta2pipiAlg_check_install_runtime :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'eta2pipiAlg_check_install_runtime'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = eta2pipiAlg_check_install_runtime/
#eta2pipiAlg_check_install_runtime::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of cmt_action_runner_header ---------------

ifdef ONCE
eta2pipiAlg_check_install_runtime_once = 1
endif

ifdef eta2pipiAlg_check_install_runtime_once

eta2pipiAlg_check_install_runtimeactionstamp = $(bin)eta2pipiAlg_check_install_runtime.actionstamp
#eta2pipiAlg_check_install_runtimeactionstamp = eta2pipiAlg_check_install_runtime.actionstamp

eta2pipiAlg_check_install_runtime :: $(eta2pipiAlg_check_install_runtimeactionstamp)
	$(echo) "eta2pipiAlg_check_install_runtime ok"
#	@echo eta2pipiAlg_check_install_runtime ok

#$(eta2pipiAlg_check_install_runtimeactionstamp) :: $(eta2pipiAlg_check_install_runtime_dependencies)
$(eta2pipiAlg_check_install_runtimeactionstamp) ::
	$(silent) /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/BesPolicy/BesPolicy-01-05-05/cmt/bes_check_installations.sh -files= -s=../share *.txt   -installdir=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/InstallArea/share
	$(silent) cat /dev/null > $(eta2pipiAlg_check_install_runtimeactionstamp)
#	@echo ok > $(eta2pipiAlg_check_install_runtimeactionstamp)

eta2pipiAlg_check_install_runtimeclean ::
	$(cleanup_silent) /bin/rm -f $(eta2pipiAlg_check_install_runtimeactionstamp)

else

#eta2pipiAlg_check_install_runtime :: $(eta2pipiAlg_check_install_runtime_dependencies)
eta2pipiAlg_check_install_runtime ::
	$(silent) /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/BesPolicy/BesPolicy-01-05-05/cmt/bes_check_installations.sh -files= -s=../share *.txt   -installdir=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/InstallArea/share

endif

install ::
uninstall ::

#-- end of cmt_action_runner_header -----------------
#-- start of cleanup_header --------------

clean :: eta2pipiAlg_check_install_runtimeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(eta2pipiAlg_check_install_runtime.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

eta2pipiAlg_check_install_runtimeclean ::
#-- end of cleanup_header ---------------
