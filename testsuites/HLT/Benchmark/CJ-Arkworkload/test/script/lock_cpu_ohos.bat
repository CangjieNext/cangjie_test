# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# Lock CPU-cores on hos system

# Only open 3 middle cpu-cores on Max_frequency



hdc_std shell "cat /sys/devices/system/cpu/online"



hdc_std shell "echo 0 > sys/devices/system/cpu/cpu0/online" 

hdc_std shell "echo 0 > sys/devices/system/cpu/cpu1/online" 

hdc_std shell "echo 0 > sys/devices/system/cpu/cpu2/online" 

hdc_std shell "echo 0 > sys/devices/system/cpu/cpu3/online" 

hdc_std shell "echo 0 > sys/devices/system/cpu/cpu7/online" 



hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq"



hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq"



hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq"

hdc_std shell "echo 2544000>  /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq"



hdc_std shell "cat /sys/devices/system/cpu/online"