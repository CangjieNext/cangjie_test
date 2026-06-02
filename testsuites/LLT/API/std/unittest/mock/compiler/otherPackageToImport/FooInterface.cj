/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public interface Foo {
    func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    func bar(): Int32
    func fooDefault(x: Int32): String {
        "not my str"
    }

    func takeFooAndCallBar(foo: Foo): Int32 {
        println("Return value: " + foo.bar().toString())
        1
    }

    func takeFooAndCallFooDefault(foo: Foo) {
        println("Return value: " + foo.fooDefault(1))
    }

    prop p1: String {
        get() {
            println("original getter for `p1` was called");
            "my str"
        }
    }

    mut prop p2: String {
        get() {
            println("original getter for `p2` was called");
            "my str"
        }
        set(newP2) {
            println("original setter for `p2` was called")
        }
    }

    func takeFooAndCallProps(foo: Foo) {
        println("Return value: " + foo.p1)
        println("Return value: " + foo.p2)
        foo.p2 = "nn"
    }
}
