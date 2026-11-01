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
// TEST INTENT: iterator().next() returns Some(completed result)
// DOC REF: ThreadGroup.iterator - "Calling next on the iterator returns the next completed task result"
// EXPECT: Some(42) -> exit 0

import std.concurrent.*

main(): Int64 {
    threadScope<Int64, Int64> {
        group =>
            group.launch { 42 }

            let iter = group.iterator()
            match (iter.next()) {
                case Some(value) =>
                    return if (value == 42) { 0 } else { 1 }
                case None =>
                    return 2
            }
    }
}
