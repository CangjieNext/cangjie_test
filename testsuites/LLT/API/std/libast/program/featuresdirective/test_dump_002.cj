/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
main() {
    let tk = quote(@NonProduct features {os.linux})
    let parsed = parseProgram(tk)
    parsed.dump()
}
// ASSERT: scan Program {
// ASSERT: scan -featuresDirective: FeaturesDirective {
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
// ASSERT: scan -rCurl: Token {
// ASSERT: scan value: "}"
// ASSERT: scan kind: RCURL
// ASSERT: scan -packageHeader: PackageHeader {
// ASSERT: scan -modifier: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "default"
// ASSERT: scan kind: IDENTIFIER
