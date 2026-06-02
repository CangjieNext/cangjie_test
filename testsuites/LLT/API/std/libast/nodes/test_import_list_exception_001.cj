// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public func visit(curNode: ImportContent) {
        println("traversed!")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    var cnt = 0

    try {
        let importContent1 = ImportContent()
        importContent1.importKind = ImportKind.Single
        println(importContent1.importKind)

        let importContent2 = ImportContent()
        importContent2.importKind = ImportKind.Alias
        importContent2.importAlias = Tokens().append(Token(IDENTIFIER, "alias"))
        importContent2.prefixPaths = quote(prefix1 prefix2)
        importContent2.prefixDots = quote(.)
        importContent2.identifier = Token(IDENTIFIER, "package")
        importContent2.lBrace = Token(LCURL)
        importContent2.rBrace = Token(RCURL)

        println(importContent2.toTokens())
        importContent2.traverse(myVisitor)

        let importContent3 = ImportContent()
        importContent3.importKind = ImportKind.Multi
        importContent3.commas = quote(,)
        importContent3.items = ArrayList<ImportContent>([importContent1, importContent2])
        importContent3.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        ImportList(quote(??))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        ImportList(quote(??))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let importList = ImportList()
        importList.modifier = Token(AND)
        importList.keywordI = Token(LPAREN)
        importList.content = ImportContent()
        if (importList.isImportMulti() == false) {
            importList.dump()
        }
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
Single
prefix1.prefix2.package alias
traversed!
-importKind: Multi
  -importKind: Single
-comma: Token {
  value: ","
  kind: COMMA
  pos: 39: 39
}
  -importKind: Alias
  prefixPath: 0: Token {
    value: "prefix1"
    kind: IDENTIFIER
    pos: 28: 44
  }
  prefixPath: 1: Token {
    value: "prefix2"
    kind: IDENTIFIER
    pos: 28: 52
  }
  -identifier: Token {
    value: "package"
    kind: IDENTIFIER
    pos: 30: 37
  }
  -importAlias 0: Token {
    value: "alias"
    kind: IDENTIFIER
    pos: 27: 54
  }
Cannot construct the 'ImportList' node.
Cannot construct the 'ImportList' node.
ImportList {
  -modifier: Token {
    value: "&&"
    kind: AND
    pos: 63: 31
  }
  -keywordI: Token {
    value: "("
    kind: LPAREN
    pos: 64: 31
  }
  -importKind: Single
}
cnt = 2
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
