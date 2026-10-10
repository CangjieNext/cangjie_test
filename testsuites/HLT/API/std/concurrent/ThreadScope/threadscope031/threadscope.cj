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
// TEST INTENT: rethrown exception preserves runtime type and custom payload
// DOC REF: threadScope Exceptions + launch - failure is stored and rethrown when consumed
// EXPECT: caught MyTaskException with code == 42, exit 0

import std.concurrent.*
import std.sync.*

// The exception object rethrown by threadScope preserves its runtime type and
// payload: a user-defined Exception subclass caught with its extra field intact.
main(): Int64 {
    let caughtCode = AtomicInt64(-1)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw MyTaskException("payload failure", 42)
                }
                group.launch {
                    sleep(Duration.millisecond * 30)
                    7
                }
        }
    } catch (e: MyTaskException) {
        caughtCode.store(e.code)
    }
    return if (caughtCode.load() == 42) { 0 } else { 1 }
}

class MyTaskException <: Exception {
    public let code: Int64
    public init(msg: String, code: Int64) {
        super(msg)
        this.code = code
    }
}
