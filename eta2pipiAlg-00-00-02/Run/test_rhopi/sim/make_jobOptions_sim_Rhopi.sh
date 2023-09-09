#!/bin/bash


#check if file or directory exists: https://www.golinuxcloud.com/bash-check-if-file-exists/
#bc usage example: x=`echo "12+5" | bc` 



njobs=5

templatefile=template_jobOptions_sim_rhopi.txt
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

  ijobname=jobOptions_sim_rhopi_${i}.txt
  echo ${ijobname}
  
  cp ${templatefile} ${ijobname}
 
  randseed=`echo "${i}+100" | bc`
  outputfilename=${outputpath}/rhopi_${i}.rtraw
 
  #replace the special string in the new file 
  sed -i "s/RNDMSEED/${randseed}/g" ${ijobname}
  # use # for replacement with / 
  sed -i "s#OUTPUTFILE#${outputfilename}#g" ${ijobname}

done
