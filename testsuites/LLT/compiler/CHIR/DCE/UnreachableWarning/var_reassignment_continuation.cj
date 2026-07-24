// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that an unreachable successor of the first if does not recursively
// enter the shared continuation and report the reachable second if.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -O0 -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -O1 -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -O2 -o %output 2>&1 | compare %f
// ASSERT: scan-1 warning: unreachable block in 'if' expression
// ASSERT: scan ==> var_reassignment_continuation.cj:30:20:
// ASSERT: scan-not ==> var_reassignment_continuation.cj:25:
// ASSERT: scan 3 warnings generated, 3 warnings printed.

main() {
    var judge = true
    if (judge) {
        println("first")
    }

    judge = false
    if (!judge) {
        println("second")
    }

    let constFlag = false
    if (constFlag) {
        println("constant")
    }
}
