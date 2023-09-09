#!/bin/bash
njobs=2000
templatefile=template_run_rec_job.sh
#check if template file exist
if [ ! -f ${templatefile} ]
then
  echo "Template file ${templatefile} does not exist"
fi

#create njobs based on the given template file
for ((i=0; i<${njobs[@]};++i)); do 
  ijobname=job_rec_eta2pipi_${i}.sh
  echo ${ijobname}
  cp ${templatefile} ${ijobname}
#replace
  sed -i "s/njobs/${i}/g" ${ijobname}
done
