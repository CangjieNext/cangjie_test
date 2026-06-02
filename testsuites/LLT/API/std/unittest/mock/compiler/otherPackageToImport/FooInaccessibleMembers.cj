/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public class FooInaccessibleMembers {
    private let f1 = 1
    protected var f2 = 2
    var f3 = 3
    protected prop p1: String {
        get() {
            println("original getter of `p1` was called")
            "123"
        }
    }
    private mut prop p2: String {
        get() {
            println("original getter of `p2` was called")
            "123"
        }
        set(x) {
            println("original getter of `p2` was called")
            "123"
        }
    }
    mut prop p3: String {
        get() {
            println("original getter of `p3` was called")
            "123"
        }
        set(x) {
            println("original getter of `p3` was called")
            "123"
        }
    }
    private func foo1(x: String, y: Int64): String {
        println("original `foo1` was called")
        "my str"
    }
    protected func foo2(x: String, y: Int64): String {
        println("original `foo2` was called")
        "my str"
    }
    func foo3(x: String, y: Int64): String {
        println("original `foo3` was called")
        "my str"
    }

    public func callFoo1(foo: FooInaccessibleMembers, x: String, y: Int64) {
        foo.foo1(x, y)
    }

    public func callFoo2(foo: FooInaccessibleMembers, x: String, y: Int64) {
        foo.foo2(x, y)
    }

    public func callFoo3(foo: FooInaccessibleMembers, x: String, y: Int64) {
        foo.foo3(x, y)
    }

    public func callP1Get(foo: FooInaccessibleMembers) {
        foo.p1
    }

    public func callP2Get(foo: FooInaccessibleMembers) {
        foo.p2
    }

    public func callP2Set(foo: FooInaccessibleMembers) {
        foo.p2 = "dsgf"
    }

    public func callP3Get(foo: FooInaccessibleMembers) {
        foo.p3
    }

    public func callP3Set(foo: FooInaccessibleMembers) {
        foo.p3 = "dsgf"
    }

    public func callF1Get(foo: FooInaccessibleMembers) {
        foo.f1
    }

    public func callF2Get(foo: FooInaccessibleMembers) {
        foo.f2
    }

    public func callF2Set(foo: FooInaccessibleMembers) {
        foo.f2 = 244
    }

    public func callF3Get(foo: FooInaccessibleMembers) {
        foo.f3
    }

    public func callF3Set(foo: FooInaccessibleMembers) {
        foo.f3 = 244
    }
}
