// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var count: Int64 = 0

class A {
    public func foo1() {}
    public func foo2() {}
}

main(): Int64 {
    let a = A()
    {
        =>
        let a_ = a
        a.foo1()
        count = count + 1
        a.foo2()
    }()
    return 0
}
