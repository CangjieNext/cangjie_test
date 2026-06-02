// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    // testSize
    var temp = quote(foo + bar + 42 + 1 + 2+3+4+5+6)
    var tks = Tokens()
    tks += temp
    for (num in 0..5) {
        tks.append(temp)
        if (temp.size != 17) {
            return 1
        }
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
