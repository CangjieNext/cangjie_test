/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class A1\nin class A2\n

import std.sync.*

class A {
    public var str: String = ""

    public init(str: String) {
        this.str = str
    }

    public func test(): Unit {
        print(str)
    }
}

main(): Int64 {
    let cls = A("in class A1\n")
    let test = AtomicReference<A>(cls)

    let thread: Future<Unit> = spawn {
        test.load().test()
        var a = test.compareAndSwap(cls, A("in class A2\n"))
    }

    thread.get()

    test.load().test()
    return 0
}
