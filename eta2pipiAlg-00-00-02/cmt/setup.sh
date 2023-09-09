# echo "setup eta2pipiAlg eta2pipiAlg-00-00-02 in /besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmteta2pipiAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmteta2pipiAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=eta2pipiAlg -version=eta2pipiAlg-00-00-02 -path=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis  -no_cleanup $* >${cmteta2pipiAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=eta2pipiAlg -version=eta2pipiAlg-00-00-02 -path=/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Analysis  -no_cleanup $* >${cmteta2pipiAlgtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmteta2pipiAlgtempfile}
  unset cmteta2pipiAlgtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmteta2pipiAlgtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmteta2pipiAlgtempfile}
unset cmteta2pipiAlgtempfile
return $cmtsetupstatus

