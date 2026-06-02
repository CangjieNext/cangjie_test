/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface Bar {
    func bar<T>(a: T): T
    func bar2<T>(a: T): Int64
}

abstract class Foo {
    public func foo<T>(a: T): Unit
}

class AB1 <: Foo & Bar{
    public func bar<T>(a: T): T {
        a
    }
    public func bar2<T>(a: T): Int64 {
        return 1
    }
    public func foo<T>(a: T): Unit {}
}

main() {
    var a1 = AB1() //expr a1
    var a2 = a1.foo<Int64>(3) //expr a1.foo<Int64>(3)
    var a3 = a1.bar(1) //expr a1.bar(1)
    var a4 = a1.bar2<Float64>(4.1) //expr a1.bar2<Float64>(4.1)
    0
}
