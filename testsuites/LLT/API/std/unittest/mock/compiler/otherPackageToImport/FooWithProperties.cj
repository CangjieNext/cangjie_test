/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public open class FooWithProperties {
    public mut open prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
    protected prop name2: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
    }
    public prop anotherName: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }
}

public class DerivedFooWithProperties <: FooWithProperties {
    public mut override prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
    private prop anotherName2: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }

    public func callName2(mockedFoo: DerivedFooWithProperties) {
        println("Getter return value: " + mockedFoo.name2)
    }

    public func callAnotherName2(mockedFoo: DerivedFooWithProperties) {
        println("Getter return value: " + mockedFoo.anotherName2.toString())
    }
}
