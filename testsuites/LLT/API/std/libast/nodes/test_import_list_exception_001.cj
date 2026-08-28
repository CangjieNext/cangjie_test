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

// ASSERT: scan Single
// ASSERT: scan prefix1.prefix2.package alias
// ASSERT: scan traversed!
// ASSERT: scan -importKind: Multi
// ASSERT: scan -importKind: Single
// ASSERT: scan -comma: Token {
// ASSERT: scan value: ","
// ASSERT: scan kind: COMMA
// ASSERT: scan -importKind: Alias
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "prefix1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "prefix2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -importAlias 0: Token {
// ASSERT: scan value: "alias"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan Cannot construct the 'ImportList' node
// ASSERT: scan Cannot construct the 'ImportList' node
// ASSERT: scan ImportList {
// ASSERT: scan -modifier: Token {
// ASSERT: scan value: "&&"
// ASSERT: scan kind: AND
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "("
// ASSERT: scan kind: LPAREN
// ASSERT: scan -importKind: Single
// ASSERT: scan cnt = 2