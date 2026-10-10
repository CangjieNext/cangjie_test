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
// TEST INTENT: Exception/Error dispatch through the scope follows the runtime type
// DOC REF: threadScope Exceptions - Exception and Error rethrown as their own types
// EXPECT: Error handler skips; Exception handler catches by type, exit 0

import std.concurrent.*
import std.sync.*

// Exception/Error catch dispatch through the scope path: an Exception task
// failure is caught by an Exception handler even when an Error handler is
// written first - the runtime type decides, not the handler order.
main(): Int64 {
    let outcome = AtomicInt64(0)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw IllegalArgumentException("type dispatch")
                }
        }
    } catch (e: Error) {
        outcome.store(1)
    } catch (e: Exception) {
        outcome.store(if (e.message == "type dispatch") { 0 } else { 2 })
    }
    return outcome.load()
}
