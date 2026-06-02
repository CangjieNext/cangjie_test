// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I {
    static func foo<T>(x: T) {
        0
    }
    func goo() {}
}

class C <: I {
    public static func foo(x: Int32) {
        2
    }
}

func goo<U>() where U <: I {
    U.foo(true)
}

main() {
    goo<C>()
}
