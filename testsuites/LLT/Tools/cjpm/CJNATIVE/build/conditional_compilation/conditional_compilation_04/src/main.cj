// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

internal import pro1.xoo.*
internal import pro1.yoo.*

@When[feature2 == "cat"]
func koo() {
    println("feature cat")
}

@When[feature2 == "dog"]
func koo() {
    println("feature dog")
}

main(): Int64 {
    let e = x
    let f = y
    xx()
    koo()
    return 0
}
