/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Foo1 {
    public var dt1: Int32 = 2
}

class Bar1 <: Foo1 {
    public var dt: Int32 = 4
}

enum Time2<T1, T2> where T1 <: Foo1 {
    Day(T1) | Hour(T2)
}

main(): Int64 {
    var bar1: Bar1 = Bar1()
    var time1 = Time2<Bar1,Int32>.Day(bar1)
    var time2 = Time2<Bar1,Int32>.Hour(6)
    0
}
