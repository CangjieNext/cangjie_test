/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (target_ios_simulator) RUN-EXEC: export SIMCTL_CHILD_cjEnableGC=3 && %run %run_opt %output %run_args
// (target_ios_simulator) EXEC-PIPE: xcrun simctl spawn booted log show --last 10m --style compact --info --debug --predicate 'process == "hello_ios_gc" AND subsystem == "CANGJIE" AND category == "RUNTIME"' 2>&1 | compare %f
// (target_linux | target_mac | target_android | target_ohos) RUN-EXEC-PIPE: export cjEnableGC=3 && %run %run_opt %output %run_args 2>&1 | compare %f
// (target_win) RUN-EXEC-PIPE: set cjEnableGC=3&& %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Unsupported cjEnableGC, cjEnableGC should be 0, 1 or 2.

main(): Unit {
    println("hello")
}
