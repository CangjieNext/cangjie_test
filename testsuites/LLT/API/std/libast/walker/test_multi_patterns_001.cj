/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
//

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curPattern: ConstPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: WildcardPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarOrEnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: ExceptTypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: EnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TuplePattern) {
        curPattern.dump()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try {} catch(e: RunTime | Int64) {} finally {}
    )
    let expr = parseExpr(input)
    expr.traverse(myVisitor)

    var input1: Tokens = quote(
         match (a) {
            case a: A => b
         }
    )
    let expr1 = parseExpr(input1)
    expr1.traverse(myVisitor)

    var input2: Tokens = quote(
         match (a) {
            case (a,b) where (true) => b
         }
    )
    let expr2 = parseExpr(input2)
    expr2.traverse(myVisitor)
    return 0
}

// ASSERT: scan ExceptTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "RunTime"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -types: 1, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan TypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -patternType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan TuplePattern {
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
