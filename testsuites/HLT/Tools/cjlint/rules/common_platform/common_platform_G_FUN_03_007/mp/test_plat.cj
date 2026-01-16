/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform class A {
    platform static func foo1(a: Int64): Unit { println(a) }
    platform static func foo3(): Unit { println("platform") }
    func foo5(): Int64 { 1 }
    init() {}
}

platform struct S {
    platform static func foo1(a: Int64): Unit { println(a) }
    platform static func foo3(): Unit { println("platform") }
    func foo5(): Int64 { 1 }
    init() {}
}