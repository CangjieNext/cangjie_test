/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{ClassDecl, GenericConstraint}
internal import std.collection.ArrayList

main() {
    let decl = ClassDecl(quote(
        class A <K> where K <: A & B {}
    ))
    let gc = decl.genericConstraint[0]
    gc.upperBounds.clear()
    gc.toTokens() |> println
    gc.dump()
}

// ASSERT: scan where K <:
// ASSERT: scan GenericConstraint {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -typeArgument: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "K"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
