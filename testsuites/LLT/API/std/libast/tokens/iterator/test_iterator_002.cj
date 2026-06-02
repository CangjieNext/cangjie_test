// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    // Test Tokens Iterator API
    let tks: Tokens = quote(foo + bar + 42)
    var tks2 = Tokens()
    for (tk in tks) {
        tks2 = tks2 + tk
    }
    if (!compareTokens(tks, tks2)) {
        return 1
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
