// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import def.*

main() {
    @AnotherMacro[foobar](14)
}

/* SCAN-IN
AnotherMacro
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 8, column: 5
description: identifier, token_id: 137, token_literal_value: Function, fileID: 1, line: 8, column: 5
description: l_square, token_id: 4, token_literal_value: [, fileID: 1, line: 8, column: 5
description: identifier, token_id: 137, token_literal_value: foobar, fileID: 1, line: 8, column: 19
description: r_square, token_id: 5, token_literal_value: ], fileID: 1, line: 8, column: 5
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 5
description: integer_literal, token_id: 139, token_literal_value: 14, fileID: 1, line: 8, column: 27
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 5
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
