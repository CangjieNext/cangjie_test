// DEPENDENCE: test_parse_001_define.cj
// EXEC: %compiler %cmp_macro test_parse_001_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -Woff unused -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

import macro_def.*

@M1
@M0
class A {
    ~init() {}
}

main(): Int64 {
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/* SCAN
description: class, token_id: 85, token_literal_value: class, fileID: 1, line: 10, column: 1
description: identifier, token_id: 137, token_literal_value: A, fileID: 1, line: 10, column: 7
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 10, column: 9
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 9, column: 1
description: bit_not, token_id: 25, token_literal_value: ~, fileID: 1, line: 11, column: 5
description: init, token_id: 95, token_literal_value: init, fileID: 1, line: 11, column: 6
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 11, column: 10
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 11, column: 11
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 11, column: 13
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 11, column: 14
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 11, column: 15
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 11, column: 16
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 12, column: 1
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 12, column: 2
*/
