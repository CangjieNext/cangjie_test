/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args --no-color  2>&1 | compare %f

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

main(): Int64 {
    let tok = quote(public macro M(input1: Tokens, input2: Tokens) {Tokens() + input1 + input2})
    let decl = MacroDecl(tok)
    decl.colon.dump()
    decl.lParen.dump()
    decl.rParen.dump()
    decl.keyword.dump()
    decl.getAttrs().dump()
    decl.declType.dump()

    @Assert(decl.funcParams.size, 2)
    @Assert(decl.annotations.size, 0)
    @Assert(decl.genericConstraint.size, 0)
    @Assert(decl.isGenericDecl, false)
    @Assert(decl.modifiers.size , 1)
    @Assert((decl.declType as RefType).getOrThrow().toTokens().toString(), "Tokens")
    @Assert(decl.block.toTokens().toString().contains("input1 + input2"))
    0
}
// ASSERT: regex illegal, token_id: [0-9]+, token_literal_value: , fileID: 0, line: 0, column: 0
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 18, column: 35
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 18, column: 66
// ASSERT: regex description: macro, token_id: [0-9]+, token_literal_value: macro, fileID: 1, line: 18, column: 28

