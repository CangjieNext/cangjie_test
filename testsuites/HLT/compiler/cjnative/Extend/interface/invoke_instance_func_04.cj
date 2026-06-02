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

interface I {
    func foo() {
        return 1
    }
}

struct Foo {
    public var i = 0
}

extend Foo <: I {
    public func foo() {
        return 1
    }

    // TODO: mut not supported
    public mut func f() {
        i += 1
    }
}

main(): Int64 {
    var a = Foo()
    a.f()
    return a.i - 1
}
