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
        PackageHeader(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let packageHeader = PackageHeader()
        packageHeader.accessible = Token(AND)
        packageHeader.keywordM = quote(macro)[0]
        packageHeader.keywordP = Token(PACKAGE)
        packageHeader.prefixPaths = quote(prefix1 prefix2)
        packageHeader.prefixDots = quote(.)
        packageHeader.packageIdentifier = Token(IDENTIFIER, "package")
        println(packageHeader.toTokens().size)
        packageHeader.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan Cannot construct the 'PackageHeader' node
// ASSERT: scan 8
// ASSERT: scan PackageHeader {
// ASSERT: scan -modifier: Token {
// ASSERT: scan value: "&&"
// ASSERT: scan kind: AND
// ASSERT: scan -keywordM: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "prefix1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 0: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "prefix2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 1: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan cnt = 1