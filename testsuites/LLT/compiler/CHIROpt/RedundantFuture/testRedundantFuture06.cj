// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [16,13] has been optimised due to redundant future in spawn.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let N = 10000

main(): Unit {
    let a = spawn {
        => return 1 + N
    }
}
