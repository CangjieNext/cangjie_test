/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public struct R1<T> {
    // 成员变量
    public var width: T
    public var length: T

    // 构造函数
    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }

}

public struct R2<T1,T2> {
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
    public static func foo(b: T1){
        print("I am in static func.\n")
        return b
    }

    // 操作符函数
    public operator func +(index:R2<T1,T2>):R2<T1,T2>{
        print("I am in operator func.\n")
        return R2(width,length)
    }
}

public struct R3<X,Y> {
   //主构造函数
    public R3(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in R3 main init method.\n")
    }
}

