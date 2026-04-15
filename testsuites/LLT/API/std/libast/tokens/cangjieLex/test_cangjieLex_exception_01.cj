/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args %noColor 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException:
// ASSERT: scan unknown start of token: \\u{0000}

import std.ast.*

main(): Int64 {
    let code = "var a \0 = 1"
    cangjieLex(code)

    return 0
}