/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// 初始值表达式中仅可以引用定义在它之前的成员变量，以及struct中的静态成员函数
main(): Int64 {
    return run();
}

struct Data {
    public static func foo1(): Int32 {
        return 1
    }
    public var a0: Int32 = 1
    public static let a4: Int32 = 2
    public var a1: Int32 = foo1() // 变量初值为其定义位置之前的静态函数
    public var a2: Int32 = foo2() // 变量初值为其定义位置之后的静态函数
    public var a3: Int32 = a0
    public var a5: Int32 = 3
    public static func foo2(): Int32 {
        return foo1() + a4
    } // 静态函数中使用其他静态函数和静态let变量
    public func foo3(): Int32 {
        return foo1() + a5 + a4
    } // 非静态函数中使用其他静态函数和静态let变量、非静态let变量
    public static func foo5(): Int32 {
        return foo6()
    } // 同为静态函数，使用定义在其之后静态函数
    public static func foo6(): Int32 {
        return 1
    }
    public var x: Int32 = 1
    public var y: Int32 = 1
    public init(a0!: Int32 = 1, a1!: Int32 = foo1(), a2!: Int32 = foo2(), a3!: Int32 = a0, a5!: Int32 = 3,
        x!: Int32 = 1, y!: Int32 = 1) {
        this.a0 = a0
        this.a1 = a1
        this.a2 = a2
        this.a3 = a3
        this.a5 = a5
        this.x = x
        this.y = y
    }
}

func run(): Int64 {
    var a0: Int32 = 1;
    var A0: Int32 = 2
    var a: Data = Data()
    var b: Data = a
    var c = b.a1
    var d = Data.foo2()
    var e = b.foo3()
    var f = Data.foo5()
    if (c != 1 || d != 3 || e != 6 || f != 1) {
        return 1
    }
    return 0
}
