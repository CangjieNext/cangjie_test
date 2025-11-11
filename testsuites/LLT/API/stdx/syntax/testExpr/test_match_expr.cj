// DEPENDENCE: sourceFile/match_expr.cj
// (not Windows) EXEC: dos2unix match_expr.cj
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
        let node = parseFile("match_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as MatchExpr).getOrThrow()
        @Expect(expr.selector.isNone())
        @Expect(expr.matchCases.size, 1)
        @Expect(expr.matchCases[0].toString(), "case _ => 1")
        var pos = expr.matchCases[0].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 13, 2, 17]).toArray())
        pos = expr.matchCases[0].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 20, 2, 22]).toArray())
        pos = expr.matchCases[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 13, 2, 24]).toArray())

        @Expect(expr.toString(), "match { case _ => 1 }")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        pos = expr.getMatchKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.getMatchCasesLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 12]).toArray())
        pos = expr.getMatchCasesRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 25, 2, 26]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 26]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as MatchExpr).getOrThrow()
        let selector = expr.selector.getOrThrow()
        @Expect(selector.toString(), "a")
        @Expect(expr.matchCases.size, 4)
        @Expect(expr.matchCases[0].toString(), "case v: Int64 => ()")
        var pos = expr.matchCases[0].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 9, 5, 13]).toArray())
        pos = expr.matchCases[0].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 23, 5, 25]).toArray())

        @Expect(expr.matchCases[1].toString(), "case 1.1 | 2.2 => ()")
        @Expect(expr.matchCases[1].getBitOrsPos().size, 1)
        pos = expr.matchCases[1].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 9, 6, 13]).toArray())
        pos = expr.matchCases[1].getBitOrsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 18, 6, 19]).toArray())
        pos = expr.matchCases[1].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 24, 6, 26]).toArray())

        @Expect(expr.matchCases[2].toString(), "case b where true => ()")
        pos = expr.matchCases[2].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 9, 7, 13]).toArray())
        pos = expr.matchCases[2].getWherePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 16, 7, 21]).toArray())
        pos = expr.matchCases[2].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 27, 7, 29]).toArray())

        @Expect(expr.matchCases[3].toString(), "case _ => ()")
        pos = expr.matchCases[3].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 9, 8, 13]).toArray())
        pos = expr.matchCases[3].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 16, 8, 18]).toArray())

        @Expect(expr.toString(), """
match(a) {
        case v: Int64 => ()
        case 1.1 | 2.2 => ()
        case b where true => ()
        case _ => ()
    }""")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        pos = expr.getMatchKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 10]).toArray())
        pos = expr.getSelectorLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 10, 4, 11]).toArray())
        pos = expr.getSelectorRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 12, 4, 13]).toArray())
        pos = expr.getMatchCasesLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 14, 4, 15]).toArray())
        pos = expr.getMatchCasesRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 9, 6]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as MatchExpr).getOrThrow()
        let selector = expr.selector.getOrThrow()
        @Expect(selector.toString(), "A.a == b")
        @Expect(expr.matchCases.size, 2)
        @Expect(expr.matchCases[0].toString(), "case true => ()")
        var pos = expr.matchCases[0].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 9, 12, 13]).toArray())
        pos = expr.matchCases[0].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 19, 12, 21]).toArray())

        @Expect(expr.matchCases[1].toString(), "case false => ()")
        pos = expr.matchCases[1].getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 9, 13, 13]).toArray())
        pos = expr.matchCases[1].getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 20, 13, 22]).toArray())

        @Expect(expr.toString(), """
match(A.a == b) {
        case true => ()
        case false => ()
    }""")
        pos = expr.getMatchKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 5, 11, 10]).toArray())
        pos = expr.getSelectorLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 10, 11, 11]).toArray())
        pos = expr.getSelectorRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 19, 11, 20]).toArray())
        pos = expr.getMatchCasesLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 21, 11, 22]).toArray())
        pos = expr.getMatchCasesRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([14, 5, 14, 6]).toArray())
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[3] as MatchExpr).getOrThrow()
        let selector = expr.selector.getOrThrow()
        @Expect(selector.toString(), "10")
        @Expect(expr.matchCases.size, 4)
        let case_1 = expr.matchCases[0]
        let case_2 = expr.matchCases[1]
        let case_3 = expr.matchCases[2]
        let case_4 = expr.matchCases[3]

        @Expect(case_1.toString(), "case 0 => ()")
        @Expect(case_1.body.size, 1)
        @Expect(case_1.body[0].toString(), "()")
        @Expect(case_1.caseCond.isNone())
        @Expect(case_1.patternGuardCond.isNone())
        @Expect(case_1.patterns.size, 1)
        @Expect(case_1.patterns[0] is ConstPattern)
        @Expect(case_1.patterns[0].toString(), "0")

        @Expect(case_2.toString(), "case 70 | 80 => ()")
        @Expect(case_2.body.size, 1)
        @Expect(case_2.body[0].toString(), "()")
        @Expect(case_2.caseCond.isNone())
        @Expect(case_2.patternGuardCond.isNone())
        @Expect(case_2.patterns.size, 2)
        @Expect(case_2.patterns[0] is ConstPattern)
        @Expect(case_2.patterns[0].toString(), "70")
        @Expect(case_2.patterns[1] is ConstPattern)
        @Expect(case_2.patterns[1].toString(), "80")

        @Expect(case_3.toString(), ##"case 100 where false => println("a")"##)
        @Expect(case_3.body.size, 1)
        @Expect(case_3.body[0].toString(), ##"println("a")"##)
        @Expect(case_3.caseCond.isNone())
        @Expect(case_3.patternGuardCond.isSome())
        @Expect(case_3.patternGuardCond.toString(), "Some(false)")
        @Expect(case_3.patterns.size, 1)
        @Expect(case_3.patterns[0] is ConstPattern)
        @Expect(case_3.patterns[0].toString(), "100")

        @Expect(case_4.toString(), "case _ => throw Exception()")
        @Expect(case_4.body.size, 1)
        @Expect(case_4.body[0].toString(), "throw Exception()")
        @Expect(case_4.caseCond.isNone())
        @Expect(case_4.patternGuardCond.isNone())
        @Expect(case_4.patterns.size, 1)
        @Expect(case_4.patterns[0] is WildcardPattern)
        @Expect(case_4.patterns[0].toString(), "_")

        var pos = case_2.getDoubleArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([18, 22, 18, 24]).toArray())
        var posList = case_2.getBitOrsPos()
        @Expect(posList.size, 1)
        @Expect([posList[0].beginLine, posList[0].beginColumn, posList[0].endLine, posList[0].endColumn], ArrayList<Int32>([18, 17, 18, 18]).toArray())
        pos = case_2.getCasePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([18, 9, 18, 13]).toArray())
        pos = case_3.getWherePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 18, 19, 23]).toArray())
    }

    @TestCase
    func testMatchExprInit() {
        let expr = (nodes[1] as MatchExpr).getOrThrow()
        let matchExpr = MatchExpr(expr.matchCases, expr.selector)
        let selector = matchExpr.selector.getOrThrow()
        @Expect(selector.toString(), "a")
        @Expect(matchExpr.matchCases.size, 4)
        @Expect(matchExpr.matchCases[0].toString(), "case v: Int64 => ()")
        @Expect(matchExpr.matchCases[1].toString(), "case 1.1 | 2.2 => ()")
        @Expect(matchExpr.matchCases[1].getBitOrsPos().size, 1)
        @Expect(matchExpr.matchCases[2].toString(), "case b where true => ()")
        @Expect(matchExpr.matchCases[3].toString(), "case _ => ()")
        @Expect(matchExpr.toString(), """
match (a) {
    case v: Int64 => ()
    case 1.1 | 2.2 => ()
    case b where true => ()
    case _ => ()
}""")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("match_expr.cj")
        let input = String.fromUtf8(File.readFrom("match_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testMatchCaseInit01() {
        let expr = (nodes[3] as MatchExpr).getOrThrow()
        let tmp = expr.matchCases[2]
        let matchCase = MatchCase(tmp.patterns, tmp.patternGuardCond, tmp.caseCond, tmp.body)
        @Expect(matchCase.toString(), ##"case 100 where false => println("a")"##)
        @Expect(matchCase.body.size, 1)
        @Expect(matchCase.body[0].toString(), ##"println("a")"##)
        @Expect(matchCase.caseCond.isNone())
        @Expect(matchCase.patternGuardCond.isSome())
        @Expect(matchCase.patternGuardCond.toString(), "Some(false)")
        @Expect(matchCase.patterns.size, 1)
        @Expect(matchCase.patterns[0] is ConstPattern)
        @Expect(matchCase.patterns[0].toString(), "100")
        var pos = matchCase.getWherePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 10, 1, 15]).toArray())
        pos = matchCase.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 37]).toArray())
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
