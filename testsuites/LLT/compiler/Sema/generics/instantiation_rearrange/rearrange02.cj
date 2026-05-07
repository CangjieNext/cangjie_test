// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output

interface I_Buddy {
    func foo_Buddy(): Int64
    static func boo_Buddy(): Int64
}

interface I <: I_Buddy {
    func foo() {
        1
    }
    static func boo() {
        1
    }

    func foo_Buddy() {
        return foo()
    }

    static func boo_Buddy() {
        return boo()
    }
}

class C {}

extend C <: I {
    public func foo() {
        0
    }
    public static func boo() {
        0
    }
}

func test<M>(m: M) where M <: I_Buddy {
    m.foo_Buddy()
    M.boo_Buddy()
}

main(): Unit {
    test(C())
}