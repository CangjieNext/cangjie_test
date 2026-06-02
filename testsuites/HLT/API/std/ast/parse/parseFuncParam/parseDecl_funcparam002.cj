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
    let tok = quote(private var heights!: Array<Int64> = [3])
    let decl = FuncParam(tok)
    decl.assign.dump()
    decl.colon.dump()
    @Assert(decl.expr.toTokens().toString(), "[3]")
    decl.not.dump()
    @Assert(decl.paramType.toTokens().toString(), "Array < Int64 >")
    @Assert(decl.modifiers.toTokens().toString().contains("private"))

    0
}

// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 18, column: 56
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 1, line: 18, column: 41
// ASSERT: regex description: not, token_id: [0-9]+, token_literal_value: !, fileID: 1, line: 18, column: 40

