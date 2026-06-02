/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public abstract class FooWithPackagePrivateFields {
    protected var f1 = 56
    var f2 = 57
    public var f3 = 58
    public var f4: Int64
    let f5: Int64

    public open func foo(x: String, y: Int64): Int64 {
        println("original `foo` (from `FooWithPackagePrivateFields`) was called with args: x = ${x} and y = ${y}")
        println("original f1: ${f1.toString()}")
        println("original f3: ${f3.toString()}")
        println("original f4: ${f4.toString()}")
        77
    }

    public func printPackagePrivateFields() {
        println("original `printPackagePrivateFields` was called")
        println("original f2: ${f2.toString()}")
        println("original f5: ${f5.toString()}")
    }

    public init(f4: Int64, f5: Int64) {
        this.f4 = f4
        this.f5 = f5
    }
}

public abstract class FooWithNonPackagePrivateFields {
    protected var f1 = 56
    public var f2 = 58
    public var f3: Int64
    private var f4: Int64

    public open func bar(x: String, y: Int64): Int64 {
        println("original `bar` was called with args: x = ${x} and y = ${y}")
        println("original f1: ${f1.toString()}")
        println("original f2: ${f2.toString()}")
        println("original f3: ${f3.toString()}")
        println("original f4: ${f4.toString()}")
        88
    }

    public init(f3: Int64, f4: Int64) {
        this.f3 = f3
        this.f4 = f4
    }
}
