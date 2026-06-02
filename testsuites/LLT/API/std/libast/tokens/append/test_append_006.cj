// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    // testAppendConcatTokens
    var temp = quote(foo + bar + 42 +) + quote(1 + 2)
    var tks = Tokens()
    tks.append(temp)
    if (!compareTokens(tks, temp)) {
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
