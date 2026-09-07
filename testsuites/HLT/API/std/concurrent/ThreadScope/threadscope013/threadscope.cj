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
// TEST INTENT: next() on a group with no launched tasks returns None
// DOC REF: ThreadGroup.iterator - "If no unconsumed task results remain, next returns None"
// EXPECT: None -> exit 0

import std.concurrent.*

main(): Int64 {
    threadScope<Int64, Int64> {
        group =>
            let iter = group.iterator()
            match (iter.next()) {
                case Some(_) => return 1
                case None => return 0
            }
    }
}
