 #!/bin/bash
njobs=2000
 templatefile=template_run_job.sh
 outputpath="/besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/eta2pipi/sample/mc/raw"
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
 
    randseed=`echo "${i}" | bc`
    outputfilename=${outputpath}/eta2pipi_${i}.rtraw
 
    #replace the special string in the new file
    sed -i "s/njobs/${i}/g" ${ijobname}
done
