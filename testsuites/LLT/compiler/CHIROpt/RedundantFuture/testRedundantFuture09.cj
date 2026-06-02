// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [15,13] has been optimised due to redundant future in spawn.
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [19,13] has been optimised due to redundant future in spawn.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main(): Int64 {
    let a = spawn {
        => return 99
    }

    let b = spawn {
        => return 100
    }
    return 0
}
