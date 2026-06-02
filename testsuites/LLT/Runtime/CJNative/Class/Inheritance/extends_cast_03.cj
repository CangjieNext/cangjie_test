// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Parent {
    public open func foo(): Int32 {
        return 1
    }
}

open class Child1 <: Parent {
    public open override func foo(): Int32 {
        return 2
    }
}

class Child2 <: Parent {}

class Child3 <: Child1 {
    public override func foo(): Int32 {
        return 3
    }
}

main(): Int64 {
    var c1: Child1 = Child1()
    var c2: Child2 = Child2()
    var c3: Child3 = Child3()
    var c4: Child1 = Child3()
    var c5: Parent = Child3()

    if (c1.foo() == 2 && c2.foo() == 1 && c3.foo() == 3 && c4.foo() == 3 && c5.foo() == 3) {
        return 0
    }
    return 1
}
