/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/disjunction_condition.cj
// (not Windows) EXEC: dos2unix disjunction_condition.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var nodes: Array<SyntaxTreeNode> = []

    @BeforeAll
    func readNodes(): Unit {
        let node = parseFile("disjunction_condition.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a == b && let c <- b && c == a && true"##)
        @Assert(condition.toTokens().toString().replace("\r\n", "\n"), condition.toString().replace("\r\n", "\n"))
        @Expect(condition.cond.size, 1)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a == b && let c <- b && c == a && true"##)
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a < b || b <= c || c >= d || !aaa || c == e || c != x"##)
        @Expect(condition.cond.size, 6)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a < b"##)
        @Assert(condition.cond[1].toString().replace("\r\n", "\n"), ##"b <= c"##)
        @Assert(condition.cond[2].toString().replace("\r\n", "\n"), ##"c >= d"##)
        @Assert(condition.cond[3].toString().replace("\r\n", "\n"), ##"!aaa"##)
        @Assert(condition.cond[4].toString().replace("\r\n", "\n"), ##"c == e"##)
        @Assert(condition.cond[5].toString().replace("\r\n", "\n"), ##"c != x"##)
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a == b || c > d || e <= f || x != y && y > z"##)
        @Expect(condition.cond.size, 4)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a == b"##)
        @Assert(condition.cond[1].toString().replace("\r\n", "\n"), ##"c > d"##)
        @Assert(condition.cond[2].toString().replace("\r\n", "\n"), ##"e <= f"##)
        @Assert(condition.cond[3].toString().replace("\r\n", "\n"), ##"x != y && y > z"##)
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[3] as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a > b && c == d && e > f && let x <- y && true"##)
        @Expect(condition.cond.size, 1)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a > b && c == d && e > f && let x <- y && true"##)
        let conCondition = (condition.cond[0] as ConjunctionCondition).getOrThrow()
        @Expect(conCondition.cond.size, 5)
        
        let optionCond0 = match (conCondition.cond[0]) {
            case AtomicCondition.Expression(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<Expr>.None
        }
        let cond0 = optionCond0.getOrThrow()
        let cond0Expr = (cond0 as BinaryExpr).getOrThrow()
        @Expect(cond0Expr.toString().replace("\r\n", "\n"), "a > b")

        let optionCond1 = match (conCondition.cond[1]) {
            case AtomicCondition.Expression(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<Expr>.None
        }
        let cond1 = optionCond1.getOrThrow()
        let cond1Expr = (cond1 as BinaryExpr).getOrThrow()
        @Expect(cond1Expr.toString().replace("\r\n", "\n"), "c == d")

        let optionCond2 = match (conCondition.cond[2]) {
            case AtomicCondition.Expression(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<Expr>.None
        }
        let cond2 = optionCond2.getOrThrow()
        let cond2Expr = (cond2 as BinaryExpr).getOrThrow()
        @Expect(cond2Expr.toString().replace("\r\n", "\n"), "e > f")

        let optionLetPattern = match (conCondition.cond[3]) {
            case AtomicCondition.LetPatternCondition(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<LetPattern>.None
        }
        let letPattern = optionLetPattern.getOrThrow()
        let letPatternCond = (letPattern as LetPattern).getOrThrow()
        @Expect(letPatternCond.toString().replace("\r\n", "\n"), "let x <- y")

        let optionCond4 = match (conCondition.cond[4]) {
            case AtomicCondition.Expression(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<Expr>.None
        }
        let cond4 = optionCond4.getOrThrow()
        let cond4Expr = (cond4 as LitConstExpr).getOrThrow()
        @Expect(cond4Expr.toString().replace("\r\n", "\n"), "true")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("disjunction_condition.cj")
        let input = String.fromUtf8(File.readFrom("disjunction_condition.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testDisjunctionConditionInit01() {
        let ifExpr = (nodes[2] as IfExpr).getOrThrow()
        let tmp = ifExpr.condition
        let condition = DisjunctionCondition(tmp.cond)

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a == b || c > d || e <= f || x != y && y > z"##)
        @Expect(condition.cond.size, 4)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a == b"##)
        @Assert(condition.cond[1].toString().replace("\r\n", "\n"), ##"c > d"##)
        @Assert(condition.cond[2].toString().replace("\r\n", "\n"), ##"e <= f"##)
        @Assert(condition.cond[3].toString().replace("\r\n", "\n"), ##"x != y && y > z"##)
    }

    @TestCase
    func testConjunctionConditionInit01() {
        let ifExpr = (nodes[3] as IfExpr).getOrThrow()
        let tmp = ifExpr.condition
        let conCondition = (tmp.cond[0] as ConjunctionCondition).getOrThrow()
        let condition = ConjunctionCondition(conCondition.cond)
        @Expect(condition.cond.size, 5)
        @Assert(condition.toString().replace("\r\n", "\n"), ##"a > b && c == d && e > f && let x <- y && true"##)
    }

    @TestCase
    func testLetPatternInit01() {
        let expr = (nodes[3] as IfExpr).getOrThrow()
        let condition = expr.condition
        let conCondition = (condition.cond[0] as ConjunctionCondition).getOrThrow()
        let optionLetPattern = match (conCondition.cond[3]) {
            case AtomicCondition.LetPatternCondition(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<LetPattern>.None
        }
        let pattern = optionLetPattern.getOrThrow()
        let patternCond = (pattern as LetPattern).getOrThrow()
        let letPattern = LetPattern(patternCond.expr, patternCond.patterns)
        @Expect(letPattern.toString().replace("\r\n", "\n"), "let x <- y")
        var pos = letPattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 11]).toArray())
    }
}

