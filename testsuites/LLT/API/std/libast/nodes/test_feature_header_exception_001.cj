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
        FeaturesDirective(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let featuresDirective = FeaturesDirective()
        let nonProduct = Annotation(quote(@NonProduct))
        featuresDirective.annotations = ArrayList<Annotation>([nonProduct])
        featuresDirective.keyword = Token(TokenKind.FEATURES)
        let featuresSet = FeaturesSet()
        let f1 = FeatureId()
        f1.identifiers = quote(os linux)
        f1.dots = quote(.)
        let f2 = FeatureId()
        f2.identifiers = quote(os darwin)
        f2.dots = quote(.)
        featuresSet.lCurl = Token(TokenKind.LCURL)
        featuresSet.content = ArrayList<FeatureId>([f1, f2])
        featuresSet.commas = quote(,)
        featuresSet.rCurl = Token(TokenKind.RCURL)
        featuresDirective.featuresSet = featuresSet
        featuresDirective.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}
// ASSERT: scan Cannot construct the 'FeaturesDirective' node
// ASSERT: scan FeaturesDirective {
// ASSERT: scan -annotation: 0, Annotation {
// ASSERT: scan -identifier: NonProduct
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
// ASSERT: scan value: "linux"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -comma: : Token {
// ASSERT: scan value: ","
// ASSERT: scan kind: COMMA
// ASSERT: scan -FeatureId: FeatureId {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "os"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "darwin"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -rCurl: Token {
// ASSERT: scan value: "}"
// ASSERT: scan kind: RCURL
// ASSERT: scan cnt = 1