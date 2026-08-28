/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        let genericConstraint = GenericConstraint()
        genericConstraint.upperBound.dump()
        genericConstraint.bitAnds.dump()
        genericConstraint.bitAnds = Tokens(ArrayList<Token>([Token(AND), Token(OR), Token(NL)]))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan description: upperbound, token_id: 135, token_literal_value: <:
// ASSERT: scan Illegal TokenKind, TokenKind should be BITAND
// ASSERT: scan cnt = 1
