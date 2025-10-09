/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

main() {
    var input: Tokens = quote(@!Annota1[""] func foo<T>() {})
    let decl = FuncDecl(input)
    decl.annotations[0].at.dump()
}

// ASSERT: regex description: at_exclamation, token_id: [0-9]+, token_literal_value: @!, fileID: 1, line: 16, column: 31

