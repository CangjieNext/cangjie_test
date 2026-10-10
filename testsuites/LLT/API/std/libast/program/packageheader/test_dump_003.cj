/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main() {
    var cnt = 0
    try {
        let packageHeader = PackageHeader()
        packageHeader.accessible = Token(INTERNAL)
        packageHeader.keywordM = quote(macro)[0]
        packageHeader.keywordP = Token(PACKAGE)
        packageHeader.orgName = Token(IDENTIFIER, "orgA")
        packageHeader.orgSeparator = Token(DOUBLE_COLON)
        packageHeader.prefixPaths = quote(pkgA subB)
        packageHeader.prefixDots = quote(. .)
        packageHeader.packageIdentifier = Token(IDENTIFIER, "package")
        packageHeader.toTokens().dump()
        packageHeader.toTokens().toString() |> println
        println(packageHeader.toTokens().size)
        packageHeader.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    println("cnt = ${cnt}")
}

// ASSERT: scan description: macro, token_id: 88, token_literal_value: macro
// ASSERT: scan description: package, token_id: 83, token_literal_value: package
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: orgA
// ASSERT: scan description: double_colon, token_id: 163, token_literal_value: ::
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: pkgA
// ASSERT: scan description: dot, token_id: 0, token_literal_value:
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: subB
// ASSERT: scan description: dot, token_id: 0, token_literal_value:
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: package
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan macro package orgA :: pkgA.subB.package
// ASSERT: scan 10
// ASSERT: scan PackageHeader {
// ASSERT: scan -modifier: Token {
// ASSERT: scan value: "internal"
// ASSERT: scan kind: INTERNAL
// ASSERT: scan -keywordM: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan -orgName: Token {
// ASSERT: scan value: "orgA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -orgSepartaor: Token {
// ASSERT: scan value: "::"
// ASSERT: scan kind: DOUBLE_COLON
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "pkgA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 0: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "subB"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 1: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan cnt = 0