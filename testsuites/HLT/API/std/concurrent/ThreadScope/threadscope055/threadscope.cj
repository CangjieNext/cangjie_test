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
// TEST INTENT: custom exception thrown by fn survives the cancel-and-drain path
// DOC REF: threadScope - "If fn throws ... rethrows the original failure"
// EXPECT: caught MyScopeException with code == 7, exit 0

import std.concurrent.*
import std.sync.*

// A custom Exception subclass thrown by fn (not by a task) survives the
// cancel-and-drain path with its runtime type and payload intact.
main(): Int64 {
    let caughtCode = AtomicInt64(-1)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    sleep(Duration.millisecond * 40)
                    5
                }
                throw MyScopeException("fn payload", 7)
        }
    } catch (e: MyScopeException) {
        caughtCode.store(e.code)
    }
    return if (caughtCode.load() == 7) { 0 } else { 1 }
}

class MyScopeException <: Exception {
    public let code: Int64
    public init(msg: String, code: Int64) {
        super(msg)
        this.code = code
    }
}
