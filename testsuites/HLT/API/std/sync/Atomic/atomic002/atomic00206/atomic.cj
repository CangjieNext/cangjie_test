/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class B\nin interface A func test1\n

import std.sync.*

interface A {
    func test(): Unit {
        print("in interface A func test\n")
    }

    func test1(): Unit {
        print("in interface A func test1\n")
    }
}

class B <: Object & A {
    public var str: String = ""

    public init(str: String) {
        super()
        this.str = str
    }

    public func test(): Unit {
        print(str)
    }
}

main(): Int64 {
    let test = AtomicReference<B>(B("in class B\n"))

    let thread: Future<Unit> = spawn {
        test.load().test()
    }

    thread.get()

    test.load().test1()
    return 0
}
