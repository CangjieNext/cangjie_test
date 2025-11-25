// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        Annotation()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        Annotation(Tokens().append(Token(AND)))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation()
        annotation.at.dump()
        annotation.at = Token(OR)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation()
        annotation.identifier = Token(OR)
        annotation.identifier.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation()
        let argument = Argument()
        annotation.arguments = ArrayList<Argument>([argument])
        println(annotation.arguments.size)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation()
        annotation.attributes = Tokens().append(Token(OR))
        annotation.attributes.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation()
        annotation.condition.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation(quote(@When[c != 1]))
        let annotation1 = Annotation(quote(@When[a == 0]))
        annotation.condition = annotation1.condition
        annotation.condition.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation(quote(@Attribute[]))
        println(annotation.toTokens().size)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let annotation = Annotation(quote(@Attribute[a,b,c]))
        annotation.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
Cannot construct the 'Annotation' node.
description: at, token_id: 51, token_literal_value: @, fileID: 13, line: 79, column: 30
Illegal TokenKind, TokenKind should be AT or AT_EXCLAMATION
description: or, token_id: 17, token_literal_value: ||, fileID: 1, line: 35, column: 33
1
description: or, token_id: 17, token_literal_value: ||, fileID: 1, line: 54, column: 49
Current Annotation node is not `When` annotation
BinaryExpr {
  -leftExpr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 71: 50
    }
  }
  -op: Token {
    value: "=="
    kind: EQUAL
    pos: 71: 52
  }
  -rightExpr: LitConstExpr {
    -literal: Token {
      value: "0"
      kind: INTEGER_LITERAL
      pos: 71: 55
    }
  }
}
3
Annotation {
  -identifier: Attribute
  -attributes: 0,   a: Token {
    value: "a"
    kind: IDENTIFIER
  }
  -attributes: 1,   b: Token {
    value: "b"
    kind: IDENTIFIER
  }
  -attributes: 2,   c: Token {
    value: "c"
    kind: IDENTIFIER
  }
}
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
