// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mymod.mod2

public let globalA = 0
let globalB = 0

interface MyInterfaceA {
    func myfunc1() {}
}

struct MyStructA <: MyInterfaceA {
    let a = 10
    let b = 20
    public func myfunc1() {}
}

struct MyStructB {
    let a = 10
    let b = 20
    public func myfunc1(size: Int64) {
        var arr = Array<Int64>(size, repeat: 20)
        println("${arr.size}")
    }
}

public open class MyClassBase {
    public open func func3() {
        println("aaaaaaaa")
    }
}

public class MyException <: Exception {
    public init() {
        super()
    }

    public init(message: String) {
        super(message)
    }

    protected override func getClassName(): String {
        return "MyException"
    }
}

func my_common_func1() {
    throw MyException("this is myexception")
}

public class MyClassA <: MyClassBase {
    public let field_a = 0;
    public let field_b = 0;
    public static let field_d = 0;
    let field_c = 0;
    public func myfunc1(a: Int64, b: Float64) {
        my_common_func1()
    }
    func myfunc2(ms1: MyStructA, ms2: MyStructB) {
        println("aaaaaaaa")
    }
    public func myfunc3() {
        println("aaaaaaaa")
    }
}

class MyClassB <: MyClassBase {
    public let field_a = 0;
    public let field_b = 0;
    public let field_d = 0;
    let field_c = 0;
    public func myfunc1() {
        println("aaaaaaaa")
    }
    func myfunc2() {
        println("aaaaaaaa")
    }
    public func myfunc3() {
        println("aaaaaaaa")
    }
}
