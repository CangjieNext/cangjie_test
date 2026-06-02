/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

@When[os == "Linux"]
const func foo(a: Int64): Int64 {
    let b = 6
    if (a > 5 && (b + a) < 15) {
        return a * a
    }
    return a
}

@When[os == "Windows"]
const func foo(a: Int64): Int64 {
    let b = 6
    if (a > 5 && (b + a) < 15) {
        return a * a
    }
    return a
}

@When[os == "macOS"]
const func foo(a: Int64): Int64 {
    let b = 6
    if (a > 5 && (b + a) < 15) {
        return a * a
    }
    return a
}


func h7() {
    @When[os == "Linux"]
    let c = foo(1)
    @When[os == "Windows"]
    let c = foo(2)
    @When[os == "macOS"]
    let c = foo(3)
}
