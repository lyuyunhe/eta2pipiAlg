#!/bin/bash
njobs=2000
for ((i=0; i<${njobs[@]};++i)); do
  hep_sub job_${i}.sh
done
