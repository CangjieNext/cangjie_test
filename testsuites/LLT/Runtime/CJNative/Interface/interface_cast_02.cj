// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Parent1 {
    func foo(): Int32 {
        return 2
    }
}

interface Parent2 {
    func foo(): Int32
}

interface Parent3 {
    func foo2(): Int32
}

class Child1 <: Parent1 & Parent2 & Parent3 {
    public func foo(): Int32 {
        return 1
    }
    public func foo2(): Int32 {
        return 2
    }
}

class Child2 <: Parent1 & Parent2 & Parent3 {
    public func foo(): Int32 {
        return 3
    }
    public func foo2(): Int32 {
        return 4
    }
}

func callfoo(c: Parent1): Int32 {
    return c.foo()
}

func callfoo2(c: Parent3): Int32 {
    return c.foo2()
}

main(): Int64 {
    var c1: Child1 = Child1()
    var c2: Child2 = Child2()
    if (callfoo(c1) == 1 && callfoo2(c1) == 2 && callfoo(c2) == 3 && callfoo2(c2) == 4) {
        return 0
    }
    return 1
}
