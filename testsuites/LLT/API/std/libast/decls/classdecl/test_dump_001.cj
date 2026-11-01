/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ClassDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

class NoBreakVisitor <: Visitor {
    var identNum = 0
    public override func visit(curNode: ClassDecl) {
        identNum++
    }
    public override func visit(curNode: VarDecl) {
        identNum++
    }
}

let myVisitor = MyVisitor()
let noBreakVisitor = NoBreakVisitor()

main(): Int64 {
    let input = quote(
        public open class A<T> <: T1 & T2 & T3 where T <: Comparable<T> & ToString {
            let a = 10
            var count =  0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]

            init(res: String, count: int64) {
                super(res, count)
                this.res = res
                this.count = count
            }
       }
    )
    let classDecl = match (parseDecl(input) as ClassDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    classDecl.traverse(myVisitor)
    classDecl.traverse(noBreakVisitor)
    let modifiers = classDecl.modifiers
    if (modifiers.size != 2) {
        return 1
    }
    if (modifiers[0].keyword.value != "public" || modifiers[1].keyword.value != "open") {
        return 2
    }

    let output = quote($classDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 1) {
        return 4
    }
    if (noBreakVisitor.identNum != 6) {
        return 5
    }
    classDecl.dump()

    return 0
}

// ASSERT: scan ClassDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -modifiers: 1, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "open"
// ASSERT: scan kind: OPEN
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericParam: GenericParam {
// ASSERT: scan -parameters: 0, T: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -superTypes: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -superTypes: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -superTypes: 2, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T3"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericConstraint: 0, GenericConstraint {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -typeArgument: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -upperBounds: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Comparable"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBounds: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "ToString"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -decls: 1, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -decls: 2, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: ""
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -decls: 3, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: ArrayLiteral {
// ASSERT: scan -elements: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 1, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 2, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "3"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 3, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "4"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 4, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "5"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -decls: 4, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: ArrayLiteral {
// ASSERT: scan -elements: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 1, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 2, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 3, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -decls: 5, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "init"
// ASSERT: scan kind: INIT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "init"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "int64"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "super"
// ASSERT: scan kind: SUPER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 2, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
