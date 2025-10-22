/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//继承深度
package default
import default.pkga.*

open class B17 <: A17{
    redef public static func name_1() :Unit{}
}
open class C17 <: B17{
    redef public static func name_1() :Unit{}
}
open class D17 <: C17{
    redef public static func name_1() :Unit{}
}
open class E17 <: D17{
    redef public static func name_1() :Unit{}
}
open class F17 <: E17{
    redef public static func name_1() :Unit{}
}
open class G17 <: F17{
    redef public static func name_1() :Unit{}
}
open class H17 <: G17{
    redef public static func name_1() :Unit{}
}
open class I17 <: H17{
    redef public static func name_1() :Unit{}
}
open class J17 <: I17{
    redef public static func name_1() :Unit{}
}
open class K17 <: J17{
    redef public static func name_1() :Unit{}
}

func test17(){
    var a = K17.name_1
    var b = J17.name_1()
    var c = H17.name_1
}
