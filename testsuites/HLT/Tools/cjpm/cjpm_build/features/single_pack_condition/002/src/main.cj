/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cj002

internal import cj002.coo.*

// @When[feature1 == "tiger"]
// func foo(): Unit {
//     println("feature tiger")
// }

@When[feature1 == "lion"]
func koo(): Unit {
    println("feature lion")
}

@When[feature2 == "cat"]
func koo(): Unit {
    println("feature cat")
}

// @When[feature2 == "dog"]
// func koo() {
//     println("feature dog")
// }

main(): Unit {
    koo()
    c()
    return
}
