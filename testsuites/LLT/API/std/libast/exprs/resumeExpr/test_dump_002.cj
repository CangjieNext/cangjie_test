/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %set_stdx_path %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main() : Int64 {
    let tokens = quote( resume with bla )
    let aa = ResumeExpr(tokens)
    aa.dump()
    let bb = ResumeExpr()
    bb.keywordR = aa.keywordR
    bb.keywordW = aa.keywordW
    bb.withExpr = aa.withExpr
    bb.keywordT = aa.keywordT
    bb.throwingExpr = aa.throwingExpr
    bb.dump()
    return 0
}

// ASSERT: scan ResumeExpr {
// ASSERT: scan -keywordR: Token {
// ASSERT: scan value: "resume"
// ASSERT: scan kind: RESUME
// ASSERT: scan -keywordW: Token {
// ASSERT: scan value: "with"
// ASSERT: scan kind: WITH
// ASSERT: scan -withExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "bla"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan ResumeExpr {
// ASSERT: scan -keywordR: Token {
// ASSERT: scan value: "resume"
// ASSERT: scan kind: RESUME
// ASSERT: scan -keywordW: Token {
// ASSERT: scan value: "with"
// ASSERT: scan kind: WITH
// ASSERT: scan -withExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "bla"
// ASSERT: scan kind: IDENTIFIER
