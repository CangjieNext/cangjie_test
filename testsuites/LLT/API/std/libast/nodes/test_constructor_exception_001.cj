/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public func visit(curNode: Node) {
        println("traversed!")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    var cnt = 0

    try {
        let constructor = Constructor()
        constructor.typeArguments = ArrayList<TypeNode>([FuncType(), ParenType()])
        constructor.identifier = Token(IDENTIFIER, "ident")
        constructor.lParen = Token(LPAREN)
        constructor.rParen = Token(RPAREN)

        println(constructor.toTokens())
        constructor.traverse(myVisitor)

        constructor.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    ArrayList<Decl>([FuncDecl(quote(func a()))]).toTokens()[2].dump()
    println(ArrayList<Node>([FuncType(), VArrayType()]).toTokens().size)
    ArrayList<Annotation>([Annotation()]).toTokens()[1].dump()
    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ident(() ->,())
traversed!
Constructor {
  -identifier: Token {
    value: "ident"
    kind: IDENTIFIER
    pos: 31: 34
  }
  -typeArguments: 0, FuncType {
    -ARROW: Token {
      value: "->"
      kind: ARROW
    }
    -returnType:   }
  -typeArguments: 1, ParenType {
    -parenthesizedType:   }
}
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 44, column: 43
10
description: identifier, token_id: 137, token_literal_value: , fileID: 13, line: 82, column: 38
cnt = 0
 */
