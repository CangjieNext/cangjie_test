/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import p2.*

// top-level级 泛型struct
var top_r = R1<Int32>(10)

main() {
    // 单类型泛型 struct
    let r1 = R1<UInt32>(100)

    // 双类型泛型 struct
    var r2 = R2<Int32,Int64>(10, 20)

    // 双类型泛型 struct 实例方法
    var r2_ins = r2.funcdemo1()

    // 双类型泛型 struct 操作符方法
    var r2_2 = R2<Int32,Int64>(10, 30)
    var r2_ope = r2 + r2_2

    // 双类型泛型 struct 静态方法
    var stat_1 = R2<Int32,Int32>.foo(3)

    // 双类型泛型 struct 主构造方法
    var r3 = R3<Bool,String>(1, true, v:2, z:"abcde")
    
    // 同包不同文件调用
    var r102 = R102<R1<UInt32>>(R1<UInt32>(10,10),R1<UInt32>(11,11))
    
    // 不同包调用
    var r201 = R201<R1<UInt32>>(R1<UInt32>(1,2),R1<UInt32>(3,4))

    // 调用本地文件定义的泛型init方法
    var r_here = R_HERE<Int32,Int64>(10, 20)

    // 调用本地文件定义的泛型实例化方法
    var r_stat = r_here.funcdemo1()

    // 调用本地文件定义的泛型静态方法
    var r_ins = R_HERE<Int64,Rune>.foo(20)

    // 调用本地文件定义的泛型操作符方法
    var r_ope = r_here + r_here

}

public struct R_HERE<T1,T2> {
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
    public operator func +(index:R_HERE<T1,T2>):R_HERE<T1,T2>{
        print("I am in operator func.\n")
        return R_HERE(width,length)
    }
}
