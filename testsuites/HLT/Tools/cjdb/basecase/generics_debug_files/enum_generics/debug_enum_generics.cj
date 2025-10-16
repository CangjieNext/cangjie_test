/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import p2.*

// top-level级 单类型泛型enum
let top_time3 = TimeUnit1<Int64>.Year(2020).funcdemo1()

main() {
    // 单类型泛型enum 实例化方法
    let m_time1 = TimeUnit1<Int64>.Year(2021).funcdemo1()

    // 双类型泛型enum 静态方法
    var m_time2 = TimeUnit2<Int64, Float64>.foo(6)

    // 十类型泛型enum 操作符方法
    var m_time3 = -ten_enum<Int8, Int8, Int8, Int16, Int16, Int32, Int32, Int64, Int64, Unit>(1, 2, 3, 4, 5, 6, 7, 8, 9, ())

    // 同包不同文件间泛型方法调用
    let m_102 = TimeUnit102<TimeUnit1<Int64>>.Year(-m_time1)

    // 不同包间泛型方法调用
    let m_201 = TimeUnit201<TimeUnit1<Int64>>.Year(m_time1.funcdemo1())


    let time_here = TimeUnit_here<Int64>.Year(2021)

    // 调用本文件定义的实例方法
    var time_ins = time_here.funcdemo1()

    // 调用本文件定义的静态方法
    var time_stat = TimeUnit_here<Int64>.foo(30)

    // 调用本文件定义的操作符方法
    var time_ope = -time_here
    return 0
}

enum TimeUnit_here<T> {
    Year(T) | Month(T)

    // 实例方法
    public func funcdemo1(): TimeUnit_here<T> {
        print("I am in instance func.\n")
        return this
    }

    // 静态函数
    public static func foo(b: T):T{
        print("I am in static func.\n")
        return b
    }

    // 操作符函数
    public operator func -():TimeUnit_here<T>{
        print("I am in operator func.\n")
        return this
    }
}
