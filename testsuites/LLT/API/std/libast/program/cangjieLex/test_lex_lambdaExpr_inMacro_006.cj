/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_lex_lambdaExpr_inMacro_define_006.cj
// EXEC: %compiler %cmp_macro test_lex_lambdaExpr_inMacro_define_006.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
import define.*

@M()

main() {
    0
}

/* SCAN
description: let, token_id: 91, token_literal_value: let, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: x, fileID: 1, line: 14, column: 1
description: assign, token_id: 30, token_literal_value: =, fileID: 1, line: 14, column: 1
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: w, fileID: 1, line: 14, column: 1
description: colon, token_id: 28, token_literal_value: :, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: A, fileID: 1, line: 14, column: 1
description: less, token_id: 53, token_literal_value: <, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: A, fileID: 1, line: 14, column: 1
description: less, token_id: 53, token_literal_value: <, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: T, fileID: 1, line: 14, column: 1
description: rshift, token_id: 27, token_literal_value: >>, fileID: 1, line: 14, column: 1
description: comment, token_id: 142, token_literal_value: /*this is a comment*/, fileID: 1, line: 14, column: 1
description: double_arrow, token_id: 46, token_literal_value: =>, fileID: 1, line: 14, column: 1
description: identifier, token_id: 137, token_literal_value: w, fileID: 1, line: 14, column: 1
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 14, column: 1
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 14, column: 1
*/
