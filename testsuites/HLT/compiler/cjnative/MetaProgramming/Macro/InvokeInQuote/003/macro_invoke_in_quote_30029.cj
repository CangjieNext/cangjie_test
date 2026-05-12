/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30029.cj main_30029.cj
// EXEC: %compiler define_30029.cj %macro_opt -o define_30029.%test_suffix
// ERRCHECK: %compiler %f %macro_opt  -o use.%test_suffix


macro package use

import std.ast.*
import define_30029.*

var flag = 1
var count = 1

public macro X(attr: Tokens, input: Tokens): Tokens {
    if (flag != 0) {
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0](1))
    } else {
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote($(@Y[0](1)))
    }
}

var flagY = 1

public macro Y(attr: Tokens, input: Tokens): Tokens {
    if (flagY != 0) {
        print("first is ${flagY}\n")
        flagY = flagY - 1
        return quote(@Y[0](1))
    } else {
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flagY}\n")
        return quote($(@B[0](1)))
    }
}

// ASSERT: scan :33:
// ASSERT: scan : macro's call and definition can not in one package
// ASSERT: regex-not no position error occurred
