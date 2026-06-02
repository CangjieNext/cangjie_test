// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample2

open class CA<T> {
    public open func foo() {}
    public open func goo() {}
}

open class CB <: CA<Int64> {
    public open func foo() {}
    public open func goo() {}
}

open class CC <: CA<Int32> {
    public open func foo() {}
    public open func goo() {}
}

func bar(v: CA<Int64>) {
    v.foo()
}

func entry(): Unit {
    var v1: CA<Int64> = CB()
    bar(v1)
    var v2: CA<Int64> = CA<Int64>()
    bar(v2)
}
main(): Unit {
    println("pass")
}
