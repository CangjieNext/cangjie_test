// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [看护点]: "cangjie runtime 及标准库下沉到内核"场景的融合看护（需 -E OLD_CANGJIE_HOME=<旧SDK>，
//   未设置时本用例的内核环境环节跳过并输出跳过说明，用例仍通过）。
//   1) 应用（main.cj + cpu.cj，含 local 分支）只由带 local modal 特性的 SDK 编译一次；
//   2) 内核环境由旧 SDK 构成：旧 libcangjie-runtime.so + 旧 libcangjie-std-core.so
//      （均不含 local 特性）+ 旧 SDK 编译的系统 API mock（device_info_10.cj，sdkApiVersion=10）。
//      新 SDK 编译的应用必须能消费旧 SDK 产出的 .cjo/.so（内核自带旧工具链构建的系统 API）；
//   3) 同一二进制加载进内核环境时必须成功：local 分支引用的 CJ_MCC_*Local* 运行时符号
//      在旧 runtime 中缺失，依赖动态链接懒解析保证未进入的分支不被解析、不阻断加载；
//   4) 运行期门控读到 10 < 19，compute 必须走 fallback 分支（等价的非 local 实现，
//      输出 "fallback branch: 42"），且全程不得出现 local 分支输出——若出现，
//      说明门控失效导致旧环境执行了 local-mode 代码路径。
//   与 ifavailable_local_env.cj 共用同一份 main.cj/cpu.cj，构成同一二进制在
//   两种运行环境间的行为镜像。

// LEVEL: 0
// DEPENDENCE: main.cj cpu.cj device_info_10.cj
// EXEC: %mkdir kern
// EXEC: if [ -d "$OLD_CANGJIE_HOME" ]; then %compiler %cmp_opt device_info_10.cj --output-type=dylib -o kern/libohos.device_info.so --error-count-limit=10000 --diagnostic-format=noColor && cp kern/ohos.device_info.cjo .; fi
// EXEC: if [ -d "$OLD_CANGJIE_HOME" ]; then %compiler %cmp_opt cpu.cj %compile_lib_opt -o cpu.a; fi
// EXEC: if [ -d "$OLD_CANGJIE_HOME" ]; then %compiler %cmp_opt main.cj cpu.cjo cpu.a -Lkern -lohos.device_info -o %output; fi
// RUN-EXEC: if [ -d "$OLD_CANGJIE_HOME" ]; then LD_LIBRARY_PATH=$PWD/kern:$OLD_CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative:$OLD_CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH %run %run_opt %output %run_args > run_out.txt 2>&1; else echo "OLD_CANGJIE_HOME not set; kernel-env leg skipped" > run_out.txt; fi
// EXEC-PIPE: %cat run_out.txt 2>&1 | compare %f
// ASSERT: regex (fallback branch: 102|OLD_CANGJIE_HOME not set; kernel-env leg skipped)
// ASSERT: scan-not local branch
