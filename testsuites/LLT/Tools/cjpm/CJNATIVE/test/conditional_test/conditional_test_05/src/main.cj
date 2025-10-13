// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import std.unittest.*
import std.unittest.testmacro.*

@When[feature1 == "tiger"]
@Test
func foo(): Unit {
    println("feature tiger")
}

@When[feature1 == "lion"]
@Test
func foo(): Unit {
    println("feature lion")
}

@When[feature2 == "cat"]
@Test
func koo() {
    println("feature cat")
}

@When[feature2 == "dog"]
@Test
func koo() {
    println("feature dog")
}

@When[feature3 == "serpent"]
@Test
func goo() {
    println("feature serpent")
}