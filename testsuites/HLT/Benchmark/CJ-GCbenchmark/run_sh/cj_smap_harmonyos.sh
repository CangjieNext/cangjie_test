# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

basedir=`pwd`

MonitorPhyMem() {
  processname=$1
  smaps_dir=$2
  gc_version=$3
  cd ${smaps_dir}
  if [ "`ls ./`" != "" ]; then `rm -rf ./*.txt`; fi
  pid=0
  while true
  do
    pid=`pidof ${processname}`
    timeNs=$(date +%s%N)
    timeMs=${timeNs:0:13}
    smaps_file=${gc_version}"_smaps_"${timeMs}.txt
    cat /proc/${pid}/smaps > ${smaps_file} 2>/dev/null || true

    # maps_file=${gc_version}"_maps_"${timeMs}.txt
    # cat /proc/${pid}/maps > ${maps_file} 2>/dev/null || true

    if [ ! -e /proc/${pid}/smaps ]; then rm -f ${smaps_file}; break; fi
  done
}

StatisticMem() {
  smaps_dir=$1
  dump_memory_file="total_mem.txt"
  cd ${smaps_dir}
  testfiles=`ls ${smaps_dir}`
  printf "%-16s%-48s%-12s%-12s%-12s%-12s\n" "timeMs" "smaps_file" "TotalRss" "TotalPss">$dump_memory_file
  for file in $testfiles
  do
      #排除 total_mem.txt
      if [ "$file" != "total_mem.txt" ];  then
        timeMs=$(echo $file | awk -F '[._]' '{print $(NF-1)}')
        RSS=`cat ${file} | grep Rss | awk '{sum+=$2} END {print sum}'`
        PSS=`cat ${file} | grep Pss | awk '{sum+=$2} END {print sum}'`
      if [ ! -n "$RSS" ] && [ ! -n "$PSS" ]; then break; fi
      printf "%-16s%-64s%-12s%-12s%-12s%-12s\n" "$timeMs" "$file" "$RSS" "$PSS" >>$dump_memory_file
      fi
  done
}


testcase=$1
cmd="$testcase $2 &"
smaps_dir=$3/$4/$5_smaps/
echo "MonitorPhyMem testcase: $4 gc_version: $5"
mkdir -p ${smaps_dir}
echo ${cmd} | awk '{run=$0; system(run)}'

MonitorPhyMem ${testcase} ${smaps_dir} $5
StatisticMem ${smaps_dir}

# 使用方法：
# ./cj_smap_harmonyos.sh /data/local/tmp/shy/cj_result/binarytrees.cj.out 15 /data/local/tmp/shy/smaps_data binarytrees cj