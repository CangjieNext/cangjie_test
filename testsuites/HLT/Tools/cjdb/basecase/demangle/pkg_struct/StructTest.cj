/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_struct


class test_C2<T> {

    public var width: T
    public var length: T

    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }
}


class test_C3{

    public var width: String = "你好，cangjie。"
    private var length: test_C2<Unit>

    public init (width: String, length: test_C2<Unit>) {
        this.width = width
        this.length = length
    }
}

public struct test_R1 {
    public var width: Int64 = 12
    private var length: String = "你好，cangjie。"
    static let area: test_C3 = test_C3("调试插件测试", test_C2<Unit>(()))
}

public struct test_R2 {
   //主构造函数
    public test_R2(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: Bool,
        v!: Int64 = 1, // regular parameter
        private var z!: String // member variable parameter
    ){
        print("I am in R2 main init method.\n")
    }
}


public struct test_R3<T> {
    // 成员变量
    public var width: T
    private var length: T
    static let area: Int64 = 3

    // 构造函数
    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }

}


public struct test_R4<T1,T2> {
    // 成员变量
    public var width: T1
    public var length: T2

    public init (width: T1, length: T2) {
        this.width = width
        this.length = length
    }

    // 实例方法
    public func funcdemo1(): T2 {
        var funnum = width
        print("I am in instance func.\n")
        return length
    }

    // 静态函数
    public static func foo(b: T1): T1{
        print("I am in static func.\n")
        return b
    }

    // 操作符函数
    public operator func +(index:test_R4<T1,T2>):test_R4<T1,T2>{
        print("I am in operator func.\n")
        return test_R4(width,length)
    }
}
