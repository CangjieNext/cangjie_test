/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30011.cj main_30011.cj
// EXEC: %compiler define_30011.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt main_30011.cj -o %output | compare %f

// ASSERT: scan-begin first flagY is true
// ASSERT: scan-next second flagY is false
// ASSERT: scan-next first flagX is true
// ASSERT: scan-next second flagX is false

macro package use

import std.ast.*
import define_30011.*

var flagX = true

public macro X(attr: Tokens, input: Tokens): Tokens {
    if (flagX) {
        print("first flagX is ${flagX}\n")
        flagX = !flagX
        return quote(@X[0](1))
    } else {
        print("second flagX is ${flagX}\n")
        return quote(@B[0](1))
    }
}

var flagY = true

public macro Y(attr: Tokens, input: Tokens): Tokens {
    if (flagY) {
        print("first flagY is ${flagY}\n")
        flagY = !flagY
        return quote(@Y[0](1))
    } else {
        print("second flagY is ${flagY}\n")
        return quote(@X[0](1))
    }
}
// ASSERT: regex-not no position error occurred
