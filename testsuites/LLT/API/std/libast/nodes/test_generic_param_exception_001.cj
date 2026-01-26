// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        let gp = GenericParam()
        gp.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let genericParam = GenericParam(Tokens(ArrayList<Token>([Token(AND), Token(OR), Token(NL)])))
        println(genericParam.parameters.size)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let genericParam = GenericParam(Tokens(ArrayList<Token>([Token(AND), Token(OR), Token(NL)])))
        genericParam.lAngle.dump()
        genericParam.lAngle = Token(NL)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let genericParam = GenericParam(Tokens(ArrayList<Token>([Token(AND), Token(OR), Token(NL)])))
        genericParam.rAngle.dump()
        genericParam.rAngle = Token(NL)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let genericParam = GenericParam(Tokens())
        genericParam.toTokens().dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let genericParam = GenericParam(Tokens(ArrayList<Token>([Token(AND), Token(OR), Token(NL)])))
        genericParam.toTokens().dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN
GenericParam {
}
3
description: less, token_id: 53, token_literal_value: <, fileID: 13, line: 257, column: 34
Illegal TokenKind, TokenKind should be LT
description: greater, token_id: 54, token_literal_value: >, fileID: 13, line: 259, column: 34
Illegal TokenKind, TokenKind should be GT
description: less, token_id: 53, token_literal_value: <, fileID: 13, line: 257, column: 34
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 53, column: 66
description: comma, token_id: 1, token_literal_value: ,, fileID: 13, line: 295, column: 17
description: or, token_id: 17, token_literal_value: ||, fileID: 1, line: 53, column: 78
description: comma, token_id: 1, token_literal_value: ,, fileID: 13, line: 295, column: 17
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 53, column: 89
description: greater, token_id: 54, token_literal_value: >, fileID: 13, line: 259, column: 34
cnt = 2
*/

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */