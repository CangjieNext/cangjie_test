// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-3: %run %run_opt %output

interface I {
    static func foo(): Int64
    func bar() {
        foo()
    }
}

class A <: I {
    public static func foo() {
        return 2
    }
}

class B <: I {
    public static func foo() {
        return 3
    }
}

main() {
    var a: I = B()
    return a.bar()
}
