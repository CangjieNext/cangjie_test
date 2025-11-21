// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.reflect.*

interface I0 {
    static func koo(): Unit
}

open class CBase<T> {
    public static func koo(): Unit {
        println(TypeInfo.of<T>())
    }
}

open class CBase2 <: CBase<Int64> {}

// CBase2 和 I0 没有继承关系，但 CBase2 父类里的 koo 可以当成 I0 里面的实现
// 所以 CA 中需要生成 koo 的 wrapper 函数
class CA <: CBase2 & I0 {}

func test<T>() where T <: I0 {
    T.koo()
}

main() {
    test<CA>()
}