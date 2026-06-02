// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler -c %f 2>&1 | compare %f
// ASSERT: regex
class A {
    public var b = 1
    private var a = Array<Int64>(10, 0)
    public operator func [](index: Int64, value: Int64): Unit {
        this.a[index] = value
    }
}

struct B {
    public var b = 1
    private var a = Array<Int64>(10, 0)
    public operator func [](index: Int64, value: Int64): Unit {
        this.a[index] = value
    }
}

main() {
    let a = A()
    let oa = Option<A>.Some(a)
    oa?[0] = 1 // ok
    oa?.b = 2 // ok
    var na = Option<A>.Some(a) // ok

    var b = B()
    let ob = Option<B>.Some(b) // deep copy
    ob?[0] = 1 // ok
    ob?.b = 2 //
}
