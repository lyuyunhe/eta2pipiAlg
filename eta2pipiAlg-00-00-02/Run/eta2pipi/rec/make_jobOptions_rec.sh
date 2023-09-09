#!/bin/bash
njobs=2000

templatefile=template_jobOptions_rec_eta2pipi.txt
inputpath="/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/eta2pipi/sample/mc/raw"
outputpath="/scratchfs/bes/lyuyunhe/bes3/eta2pipi/sample/mc/dst"

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

  ijobname=jobOptions_rec_eta2pipi_${i}.txt
  echo ${ijobname}

  cp ${templatefile} ${ijobname}

  randseed=`echo "${i}+1" | bc`
  inputfilename=${inputpath}/eta2pipi_${i}.rtraw
  outputfilename=${outputpath}/eta2pipi_${i}.dst

  #replace the special string in the new file
  sed -i "s/RNDMSEED/${randseed}/g" ${ijobname}
  # use # for replacement with /
  sed -i "s#INPUTFILE#${inputfilename}#g" ${ijobname}
  sed -i "s#OUTPUTFILE#${outputfilename}#g" ${ijobname}

done
