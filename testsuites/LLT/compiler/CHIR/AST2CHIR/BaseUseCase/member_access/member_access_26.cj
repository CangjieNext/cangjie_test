// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

// class member access: invoke
interface I {
    func foo() {
        return 2
    }
}

class A <: I {
    public func foo() {
        return 1
    }
}

main() {
    var a: I = A()
    var f = a.foo

    return f()
}
