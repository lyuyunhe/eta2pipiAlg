#!/bin/bash
source /besfs5/groups/jpsi/jpsigroup/user/lyuyunhe/bes3/7.0.8/workarea-7.0.8/Generator/BesEvtGen/BesEvtGen-00-04-08/cmt/setup.sh //这里source我们local修改和编译的包
boss.exe jobOptions_sim_eta2pipi_njobs.txt //这里用生成的jobOptions_*.txt的绝对路径
