#!/bin/bash
source /besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Generator/BesEvtGen/BesEvtGen-00-04-08/cmt/setup.sh

njobs=5

for ((i=0; i<${njobs[@]};++i)); do

./job_${i}.sh
done
