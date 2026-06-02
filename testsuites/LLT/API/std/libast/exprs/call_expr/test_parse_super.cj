// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    let code1 = "super(a,b)"
    let tokens1 = cangjieLex(code1)
    let expr1 = ((parseExpr(tokens1) as CallExpr).getOrThrow().callFunc as RefExpr).getOrThrow()
    expr1.identifier.dump()
    if ((expr1.identifier.kind != TokenKind.SUPER)) {
        return 1
    }
    return 0
}

/* SCAN-IN
description: super, token_id: 97, token_literal_value: super, fileID: 0, line: 1, column: 1
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
