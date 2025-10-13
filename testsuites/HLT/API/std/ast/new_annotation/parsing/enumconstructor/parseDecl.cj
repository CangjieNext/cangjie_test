// LEVEL: 0-core
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

main() {
    var input: Tokens = quote(@!Anno[""] enum E1 {
    A1 | @!Anno[""] A2
})
    let decl = parseDecl(input)
    if (let Some(_decl) <- (decl as EnumDecl)) {
        _decl.constructors[1].annotations[0].at.dump()
        return 0
    }
    return 1
}

// ASSERT: regex description: at_exclamation, token_id: [0-9]+, token_literal_value: @!, fileID: 1, line: 9, column: 10

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
