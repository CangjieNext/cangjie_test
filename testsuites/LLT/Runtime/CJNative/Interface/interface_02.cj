// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

abstract class Parent1 {
    public func foo(): Int32
}

interface Parent2 {
    func foo(): Int32
}

class Child <: Parent1 & Parent2 {
    public func foo(): Int32 {
        return 1
    }
}

main(): Int64 {
    var c1: Child = Child()
    var c2: Parent1 = Child()
    var c3: Parent2 = Child()
    if (c1.foo() == 1 && c2.foo() == 1 && c3.foo() == 1) {
        return 0
    }
    return 1
}
