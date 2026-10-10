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
        Program(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let program = Program()
        program.featuresDirective = FeaturesDirective(quote(features {os.Harmony}))
        program.packageHeader = PackageHeader(quote(package a))
        program.importLists = ArrayList<ImportList>([ImportList(quote(import b)), ImportList(quote(import c))])
        program.decls = ArrayList<Decl>([FuncDecl(quote(func d(e: f): g))])
        program.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan Cannot construct the 'Program' node
// ASSERT: scan Program {
// ASSERT: scan -featuresDirective: FeaturesDirective {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "features"
// ASSERT: scan kind: FEATURES
// ASSERT: scan -featuresSet: FeaturesSet {
// ASSERT: scan -lCurl: Token {
// ASSERT: scan value: "{"
// ASSERT: scan kind: LCURL
// ASSERT: scan -FeatureId: FeatureId {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "os"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Harmony"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -rCurl: Token {
// ASSERT: scan value: "}"
// ASSERT: scan kind: RCURL
// ASSERT: scan -packageHeader: PackageHeader {
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -importLists: 0, ImportList {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "import"
// ASSERT: scan kind: IMPORT
// ASSERT: scan -importKind: Single
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -importLists: 1, ImportList {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "import"
// ASSERT: scan kind: IMPORT
// ASSERT: scan -importKind: Single
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "c"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -decls: 0, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "d"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "f"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "g"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan cnt = 1