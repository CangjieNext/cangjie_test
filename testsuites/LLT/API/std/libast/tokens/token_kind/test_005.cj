// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output 2>&1 | compare %f

import std.ast.*

main() {
    let a = Token(AT_EXCL)
    var b = Tokens().append(a)
    println(b)
    a.dump()

    b = quote(@!)
    println(b)
    b.dump()
}

/* SCAN-IN
@!
description: at_exclamation, token_id: 155, token_literal_value: @!, fileID: 1, line: 7, column: 13
@!
description: at_exclamation, token_id: 155, token_literal_value: @!, fileID: 1, line: 12, column: 15
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
