/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20014.cj
// EXEC: %compiler %cmp_macro define_20014.cj
// ERRCHECK: %compiler %cmp_opt %f  -o %output

package use

import std.ast.*
import define_20014.*

main() {
    var a = @X[1] @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1]
    @Y[1](1)
    print("a is ${a}\n")
    return 0
}
// ASSERT: scan parse_expected_decl
