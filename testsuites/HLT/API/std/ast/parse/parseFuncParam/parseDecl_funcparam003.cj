/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

main() {
    let tok = quote(var width!: Int64 = 1)
    let decl = FuncParam(tok)
    decl.assign.dump()
    decl.colon.dump()
    @Assert(decl.expr.toTokens().toString(), "1")
    decl.not.dump()
    @Assert(decl.paramType.toTokens().toString(), "Int64")
    @Assert(decl.modifiers.toTokens().toString(), "")

    0
}

// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 18, column: 39
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 1, line: 18, column: 31
// ASSERT: regex description: not, token_id: [0-9]+, token_literal_value: !, fileID: 1, line: 18, column: 30

