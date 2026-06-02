// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

main() {
    var a = @SumOfEachAbs(1 * 3 * 5) - 15
    a
}

/* SCAN-IN
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 8, column: 13
description: identifier, token_id: 137, token_literal_value: SumOfEachAbs, fileID: 1, line: 8, column: 13
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 13
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 8, column: 27
description: mul, token_id: 9, token_literal_value: *, fileID: 1, line: 8, column: 29
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 1, line: 8, column: 31
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 13
description: mul, token_id: 9, token_literal_value: *, fileID: 1, line: 8, column: 13
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 8, column: 13
description: identifier, token_id: 137, token_literal_value: SumOfEachAbs, fileID: 1, line: 8, column: 13
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 13
description: integer_literal, token_id: 139, token_literal_value: 5, fileID: 1, line: 8, column: 35
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 13
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 8, column: 13
description: identifier, token_id: 137, token_literal_value: SumOfEachAbs, fileID: 1, line: 8, column: 13
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 13
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 8, column: 30
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 13
description: mul, token_id: 9, token_literal_value: *, fileID: 1, line: 8, column: 13
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 8, column: 13
description: identifier, token_id: 137, token_literal_value: SumOfEachAbs, fileID: 1, line: 8, column: 13
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 13
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 1, line: 8, column: 34
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 13
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
