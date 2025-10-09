/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

main() {
    var input: Tokens = quote(public class C1<T> {
    @!Anno[""]     
    func foo() {}
    })
    let decl = parseDecl(input)
    if (let Some(_decl) <- (decl as ClassDecl)) {
        _decl.body.decls[0].annotations[0].at.dump()
        return 0
    }
    return 1
}

// ASSERT: regex description: at_exclamation, token_id: [0-9]+, token_literal_value: @!, fileID: 1, line: 17, column: 5

