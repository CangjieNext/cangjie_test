// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output 2>&1 | compare %f

import std.ast.*

main() {
    let a = Token(SINGLE_QUOTED_STRING_LITERAL, "string")
    var b = Tokens().append(a)
    println(b)
    a.dump()
}

/* SCAN-IN
'string'
description: single_quoted_string_literal, token_id: 147, token_literal_value: string, fileID: 1, line: 7, column: 13
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
