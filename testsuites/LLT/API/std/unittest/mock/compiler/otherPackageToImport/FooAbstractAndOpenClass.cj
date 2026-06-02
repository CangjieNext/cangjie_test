/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public abstract class FooAbstract {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    public open func foo_impl(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class FooOpen <: FooAbstract {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public abstract class FooOpen2 {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    protected func bar(): Int32
    protected open func fooDefault(x: Int32): String {
        "not my str"
    }

    public open func takeFooAndCallBar(foo: FooOpen2): Int32 {
        println("Return value: " + foo.bar().toString())
        1
    }

    public func takeFooAndCallFooDefault(foo: FooOpen2) {
        println("Return value: " + foo.fooDefault(1))
    }

    public open prop p1: String {
        get() {
            println("original getter for `p1` was called");
            "my str"
        }
    }

    public mut open prop p2: String {
        get() {
            println("original getter for `p2` was called");
            "my str"
        }
        set(newP2) {
            println("original setter for `p2` was called")
        }
    }

    public open func takeFooAndCallProps(foo: FooOpen2) {
        println("Return value: " + foo.p1)
        println("Return value: " + foo.p2)
        foo.p2 = "nn"
    }
}
