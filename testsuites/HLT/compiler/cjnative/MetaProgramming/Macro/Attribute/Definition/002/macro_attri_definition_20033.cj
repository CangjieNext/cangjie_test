/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_macro %f
// EXEC-PIPE: %run_macro %compiler %cmp_opt main.cj  -o %output | compare %f
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args
// ASSERT: scan res is 1

macro package define

import std.ast.*

public macro M(attr: Tokens, input: Tokens): Tokens {
    let a = 2
    var res = match (3) {
        case 2 => 0
        case _ => 1
    }
    print("res is " + res.toString() + "\n")
    return quote($res)
}
// ASSERT: regex-not no position error occurred
