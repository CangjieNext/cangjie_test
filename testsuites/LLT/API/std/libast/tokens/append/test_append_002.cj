// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

func toTokens(): Tokens {
    let a = quote(1 + 1)
    let b = quote(2 + 2)
    return a + b
}

func toTokens1(): Tokens {
    let a = quote(1 + 1)
    let b = quote(2 + 2)
    return a.append(b)
}

main() {
    var a = toTokens()
    var b = toTokens1()
    if (!compareTokens(a, b)) {
        return 1
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
