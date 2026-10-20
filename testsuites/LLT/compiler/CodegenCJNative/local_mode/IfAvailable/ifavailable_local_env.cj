// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [看护点]: 新环境（local-modal-runtime + local-modal-std）下 @IfAvailable 融合链路的正向看护。
//   1) 应用侧全部源码由带 local modal 特性的 SDK 编译：系统 API mock（device_info_19.cj）
//      以动态库形式提供（模拟运行环境向应用暴露 ohos.device_info）；
//   2) cpu 包（computeLocal/computeHeap 双实现）编译进应用；主程序经 @IfAvailable(level:19)
//      在运行期按 DeviceInfo.sdkApiVersion 分派 compute 走哪个分支；
//   3) 本环境 sdkApiVersion=19，门控放行 local 分支：
//      输出必须是 "local branch: 42"（local! 对象在 local region 内分配、local 数组读写、
//      跨函数传递 local! 引用后求和 20+22），且绝不出现 fallback 分支输出。
//   与 ifavailable_kernel_compat.cj 共用同一份 main.cj/cpu.cj，构成同一二进制在
//   两种运行环境间的行为镜像。

// LEVEL: 0
// DEPENDENCE: main.cj cpu.cj device_info_19.cj
// EXEC: %compiler %cmp_opt device_info_19.cj %compile_shared_lib_opt -o libohos.device_info.so
// EXEC: %compiler %cmp_opt cpu.cj %compile_lib_opt -o cpu.a
// EXEC: %compiler %cmp_opt main.cj cpu.cjo cpu.a -L. -lohos.device_info -o %output
// RUN-EXEC: LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH %run %run_opt %output %run_args > run_out.txt 2>&1
// EXEC-PIPE: %cat run_out.txt 2>&1 | compare %f
// ASSERT: scan local branch: 42
// ASSERT: scan-not fallback branch
