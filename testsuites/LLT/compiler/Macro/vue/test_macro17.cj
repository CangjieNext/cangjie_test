// DEPENDENCE: test_macro1.cj
// EXEC: %compiler %cmp_opt test_macro1.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

package use

import std.ast.*
import view.*

main() {
    var a = quote(@X[\@Y[1](1)](@Y[1](1)))
    //var a = @X[\@Y[1](1)](@Y[1](1))
    a.dump()
    return 0
}

/* SCAN
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 12, column: 19
description: identifier, token_id: 137, token_literal_value: X, fileID: 1, line: 12, column: 20
description: l_square, token_id: 4, token_literal_value: [, fileID: 1, line: 12, column: 21
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 12, column: 23
description: identifier, token_id: 137, token_literal_value: Y, fileID: 1, line: 12, column: 24
description: l_square, token_id: 4, token_literal_value: [, fileID: 1, line: 12, column: 25
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 12, column: 26
description: r_square, token_id: 5, token_literal_value: ], fileID: 1, line: 12, column: 27
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 12, column: 28
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 12, column: 29
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 12, column: 30
description: r_square, token_id: 5, token_literal_value: ], fileID: 1, line: 12, column: 31
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 12, column: 32
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 12, column: 33
description: identifier, token_id: 137, token_literal_value: Y, fileID: 1, line: 12, column: 34
description: l_square, token_id: 4, token_literal_value: [, fileID: 1, line: 12, column: 35
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 12, column: 36
description: r_square, token_id: 5, token_literal_value: ], fileID: 1, line: 12, column: 37
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 12, column: 38
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 12, column: 39
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 12, column: 40
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 12, column: 41
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

