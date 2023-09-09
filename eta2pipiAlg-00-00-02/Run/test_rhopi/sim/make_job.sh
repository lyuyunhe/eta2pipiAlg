#!/bin/bash
njobs=5

templatefile=template_make_job.sh
outputpath="/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Run/test_rhopi/sim/rtraw"


#check if template file exist
if [ ! -f ${templatefile} ]
then
  echo "Template file ${templatefile} does not exist"
fi


#check if outputpath exist
if [ ! -d ${outputpath} ]
then
  echo "Output path ${outputpath} does not exist"
fi


#create njobs based on the given template file and specified output path etc.
for ((i=0; i<${njobs[@]};++i)); do

  ijobname=job_${i}.sh
  echo ${ijobname}

  cp ${templatefile} ${ijobname}

  #replace the special string in the new file
  sed -i "s/ijob/${i}/g" ${ijobname}
  chmod +x ${ijobname}
done
                                                   
