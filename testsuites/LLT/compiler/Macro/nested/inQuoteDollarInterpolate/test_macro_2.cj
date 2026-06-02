// DEPENDENCE: macroFoo.cj
// EXEC: %compiler macroFoo.cj %cmp_macro
// EXEC: %pwd_to_ld_path %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import define_a.*

main(): Int64 {
    var a = quote(1 + $(@testa(2) + 1))
    a.dump()
    0
}

/* SCAN
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 10, column: 19
description: add, token_id: 12, token_literal_value: +, fileID: 1, line: 10, column: 21
description: integer_literal, token_id: 139, token_literal_value: 3, fileID: 26, line: 40, column: 26
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

