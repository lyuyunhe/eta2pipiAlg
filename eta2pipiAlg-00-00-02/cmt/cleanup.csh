# echo "cleanup eta2pipiAlg eta2pipiAlg-00-00-02 in /besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmteta2pipiAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmteta2pipiAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=eta2pipiAlg -version=eta2pipiAlg-00-00-02 -path=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis  $* >${cmteta2pipiAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=eta2pipiAlg -version=eta2pipiAlg-00-00-02 -path=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis  $* >${cmteta2pipiAlgtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmteta2pipiAlgtempfile}
  unset cmteta2pipiAlgtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmteta2pipiAlgtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmteta2pipiAlgtempfile}
unset cmteta2pipiAlgtempfile
exit $cmtcleanupstatus

