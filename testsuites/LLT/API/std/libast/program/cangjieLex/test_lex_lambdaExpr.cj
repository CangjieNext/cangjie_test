/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    let tks = cangjieLex(
"""
let x = { w: A<T>=> w }
"""
    )
    tks.dump()
    parseProgram(tks)
    0
}

/* SCAN
description: let, token_id: 91, token_literal_value: let, fileID: 0, line: 1, column: 1
description: identifier, token_id: 137, token_literal_value: x, fileID: 0, line: 1, column: 5
description: assign, token_id: 30, token_literal_value: =, fileID: 0, line: 1, column: 7
description: l_curl, token_id: 6, token_literal_value: {, fileID: 0, line: 1, column: 9
description: identifier, token_id: 137, token_literal_value: w, fileID: 0, line: 1, column: 11
description: colon, token_id: 28, token_literal_value: :, fileID: 0, line: 1, column: 12
description: identifier, token_id: 137, token_literal_value: A, fileID: 0, line: 1, column: 14
description: less, token_id: 53, token_literal_value: <, fileID: 0, line: 1, column: 15
description: identifier, token_id: 137, token_literal_value: T, fileID: 0, line: 1, column: 16
description: greater, token_id: 54, token_literal_value: >, fileID: 0, line: 1, column: 17
description: double_arrow, token_id: 46, token_literal_value: =>, fileID: 0, line: 1, column: 18
description: identifier, token_id: 137, token_literal_value: w, fileID: 0, line: 1, column: 21
description: r_curl, token_id: 7, token_literal_value: }, fileID: 0, line: 1, column: 23
description: newline, token_id: 143, token_literal_value: \n, fileID: 0, line: 1, column: 24
*/