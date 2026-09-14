/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
//
// TEST INTENT: Bool results are consumed and classified
// DOC REF: ThreadGroup<T> with T = Bool
// EXPECT: trueCount == 1 and falseCount == 1, exit 0

import std.concurrent.*

main(): Int64 {
    let (trueCount, falseCount) = threadScope<Bool, (Int64, Int64)> {
        group =>
            group.launch { true }
            group.launch { false }

            var t: Int64 = 0
            var f: Int64 = 0
            for (value in group) {
                if (value) {
                    t += 1
                } else {
                    f += 1
                }
            }
            (t, f)
    }
    if (trueCount != 1 || falseCount != 1) {
        return 1
    }
    return 0
}
