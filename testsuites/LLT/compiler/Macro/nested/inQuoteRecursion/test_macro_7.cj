// DEPENDENCE: macroDefine.cj
// EXEC: %compiler %cmp_opt macroDefine.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output 2>&1 | compare %f

import std.ast.*
import define_a.*

main(): Int64 {
    var a = quote(1 + @testa(2 + @testa 2) + 1)
    a.dump()
    0
}

/* SCAN
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 10, column: 19
description: add, token_id: 12, token_literal_value: +, fileID: 1, line: 10, column: 21
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 10, column: 23
description: identifier, token_id: 137, token_literal_value: testa, fileID: 1, line: 10, column: 24
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 10, column: 29
description: integer_literal, token_id: 139, token_literal_value: 2, fileID: 1, line: 10, column: 30
description: add, token_id: 12, token_literal_value: +, fileID: 1, line: 10, column: 32
description: at, token_id: 51, token_literal_value: @, fileID: 1, line: 10, column: 34
description: identifier, token_id: 137, token_literal_value: testa, fileID: 1, line: 10, column: 35
description: integer_literal, token_id: 139, token_literal_value: 2, fileID: 1, line: 10, column: 41
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 10, column: 42
description: add, token_id: 12, token_literal_value: +, fileID: 1, line: 10, column: 44
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 10, column: 46
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

