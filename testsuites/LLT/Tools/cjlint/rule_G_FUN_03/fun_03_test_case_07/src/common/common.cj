// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

public common func foo(a: Int64, b: String): Unit {
    println("I am common")
    println(a)
    println(b)
}

public common func goo(a: Int64, b: Int64): Unit {
    public common func foo(a: Int64, b: Int64): Unit {
        println(a)
        println(b)
    }
}