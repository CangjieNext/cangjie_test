/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public class B {
    public var x: Int64 = 10
}

public interface fatherInterface {
    func foo1(): Int64
    func foo2(a: Array<B>): B {
        a[foo1()]
    }
}

public interface MyInterface <: fatherInterface {
    func foo3(): B {
        foo2([B(), B()])
    }
}

extend Bool <: MyInterface {
    func f() {
        var a: B = B()
        a.x = 1
        return a.x
    }
    public func foo1() {
        f()
    }
}
