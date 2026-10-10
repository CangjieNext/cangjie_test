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
internal import std.collection.*

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

main(): Int64 {
    let input = quote(
        func x() {
            match (a) {
                case 1 => 1
                case (a,b) => 1
                case a : Int64 => 1
                case X => 1
                case X | Y => 1
                case Year(y) => y * 365 * 24
                case _ => 1
                case _ where (a) => 1
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    return 0
}

// ASSERT: scan ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
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
// ASSERT: scan TypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -patternType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "X"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "X"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan EnumPattern {
// ASSERT: scan -constructor: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Year"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
