/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/if_expr.cj
// (not Windows) EXEC: dos2unix if_expr.cj
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
        let node = parseFile("if_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "true")
        @Expect(expr.ifBlock.toString().replace("\r\n", "\n"), "{}")
        @Expect(expr.elseBlock.isNone())
        @Expect(expr.toString().replace("\r\n", "\n"), "if (true) {}")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        var pos = expr.getIfKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 7]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 13, 2, 14]).toArray())
        @Expect(expr.getElseKeyWordPos().isNone())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x == 1")
        @Expect(expr.ifBlock.toString().replace("\r\n", "\n"), "{}")
        if (let Some(elseBlock) <- expr.elseBlock) {
            @Expect(elseBlock.toString().replace("\r\n", "\n"), "{}")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "if (x == 1) {} else {}")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        var pos = expr.getElseKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 20, 3, 24]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 2")
        @Expect(expr.ifBlock.toString().replace("\r\n", "\n"), """
{
        println()
    }""")
        @Expect(expr.elseBlock.isNone())

        let elseIf = expr.elseIf.getOrThrow()
        @Expect(elseIf.condition.toString().replace("\r\n", "\n"), "let Some(f) <- d && f > 3")
        @Expect(elseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
        println()
    }""")
        @Expect(elseIf.elseBlock.isNone())

        let elseElseIf = elseIf.elseIf.getOrThrow()
        @Expect(elseElseIf.condition.toString().replace("\r\n", "\n"), "let Some(_) <- a || let Some(_) <- d")
        @Expect(elseElseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
        return
    }""")
        if (let Some(elseBlock) <- elseElseIf.elseBlock) {
            @Expect(elseBlock.toString().replace("\r\n", "\n"), """
{
        return
    }""")
        }

        @Expect(expr.toString().replace("\r\n", "\n"), """
if (x && y + 1 > 2) {
        println()
    } else if (let Some(f) <- d && f > 3) {
        println()
    } else if (let Some(_) <- a || let Some(_) <- d) {
        return
    } else {
        return
    }""")
    }

    @TestCase
    func testExpr05() {
        let expr = (nodes[4] as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "a == 1 || b > 3 && (c < 1 && let Some(d) <- f)")

        let condition = (expr.condition as DisjunctionCondition).getOrThrow()
        var posArray = condition.getOrsPos()
        var pos = posArray[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 16, 20, 18]).toArray())
        @Expect(condition.cond.size, 2)

        let conjunctionCond = (condition.cond[1] as ConjunctionCondition).getOrThrow()
        posArray = conjunctionCond.getAndsPos()
        pos = posArray[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 25, 20, 27]).toArray())
        @Expect(conjunctionCond.cond.size, 2)
 
        let optionParenCond = match (conjunctionCond.cond[1]) {
            case AtomicCondition.ParenConditionConstructor(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<ParenCondition>.None
        }
        let parenCond = optionParenCond.getOrThrow()
        let parenCondition = (parenCond as ParenCondition).getOrThrow()
        pos = parenCondition.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 28, 20, 29]).toArray())
        pos = parenCondition.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 54, 20, 55]).toArray())
        @Expect(parenCondition.cond.toString().replace("\r\n", "\n"), "c < 1 && let Some(d) <- f")

        let disCondition = (parenCondition.cond as DisjunctionCondition).getOrThrow()
        let conCondition = (disCondition.cond[0] as ConjunctionCondition).getOrThrow()
        @Expect(conCondition.cond.size, 2)

        let optionLetPattern = match (conCondition.cond[1]) {
            case AtomicCondition.LetPatternCondition(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<LetPattern>.None
        }
        let letPattern = optionLetPattern.getOrThrow()
        let letPatternCond = (letPattern as LetPattern).getOrThrow()
        @Expect(letPatternCond.toString().replace("\r\n", "\n"), "let Some(d) <- f")

        @Expect(expr.ifBlock.toString().replace("\r\n", "\n"), "{}")
        @Expect(expr.toString().replace("\r\n", "\n"), "if (a == 1 || b > 3 && (c < 1 && let Some(d) <- f)) {}")
    }

    @TestCase
    func testExpr06() {
        let expr = (nodes[5] as IfExpr).getOrThrow()

        var pos = expr.getIfKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 5, 21, 7]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 8, 21, 9]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 33, 21, 34]).toArray())
        @Expect(expr.getElseKeyWordPos().isNone())
        let condition = (expr.condition as DisjunctionCondition).getOrThrow()
        let conjunctionCond = (condition.cond[0] as ConjunctionCondition).getOrThrow()
        let optionLetPattern = match (conjunctionCond.cond[0]) {
            case AtomicCondition.LetPatternCondition(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<LetPattern>.None
        }
        let letPattern = optionLetPattern.getOrThrow()
        let letpat = (letPattern as LetPattern).getOrThrow()
        pos = letpat.getLetKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 9, 21, 12]).toArray())
        pos = letpat.getBackArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 15, 21, 17]).toArray())
        
    }

    @TestCase
    func testIfExprInit01() {
        let expr = (nodes[2] as IfExpr).getOrThrow()
        let ifExpr = IfExpr(expr.condition, expr.elseBlock, expr.elseIf, expr.ifBlock)
        @Expect(ifExpr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 2")
        @Expect(ifExpr.ifBlock.toString().replace("\r\n", "\n"), """
{
        println()
    }""")
        @Expect(ifExpr.elseBlock.isNone())

        let elseIf = ifExpr.elseIf.getOrThrow()
        @Expect(elseIf.condition.toString().replace("\r\n", "\n"), "let Some(f) <- d && f > 3")
        @Expect(elseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
        println()
    }""")
        @Expect(elseIf.elseBlock.isNone())

        let elseElseIf = elseIf.elseIf.getOrThrow()
        @Expect(elseElseIf.condition.toString().replace("\r\n", "\n"), "let Some(_) <- a || let Some(_) <- d")
        @Expect(elseElseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
        return
    }""")
        if (let Some(elseBlock) <- elseElseIf.elseBlock) {
            @Expect(elseBlock.toString().replace("\r\n", "\n"), """
{
        return
    }""")
        }

        @Expect(ifExpr.toString().replace("\r\n", "\n"), """
if (x && y + 1 > 2) {
        println()
    } else if (let Some(f) <- d && f > 3) {
        println()
    } else if (let Some(_) <- a || let Some(_) <- d) {
        return
    } else {
        return
    }""")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("if_expr.cj")
        let input = String.fromUtf8(File.readFrom("if_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testParenConditionInit01() {
        let expr = (nodes[4] as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "a == 1 || b > 3 && (c < 1 && let Some(d) <- f)")

        let condition = (expr.condition as DisjunctionCondition).getOrThrow()
        let conjunctionCond = (condition.cond[1] as ConjunctionCondition).getOrThrow()
        let optionParenCond = match (conjunctionCond.cond[1]) {
            case AtomicCondition.ParenConditionConstructor(r) => r
            case _ => 
                @FailExpect("kind wrong")
                Option<ParenCondition>.None
        }
        let parenCond = optionParenCond.getOrThrow()
        let tmp = (parenCond as ParenCondition).getOrThrow()
        let parenCondition = ParenCondition(tmp.cond)
        var pos = parenCondition.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = parenCondition.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 27, 1, 28]).toArray())
        @Expect(parenCondition.toString().replace("\r\n", "\n"), "(c < 1 && let Some(d) <- f)")
        @Expect(parenCondition.cond.toString().replace("\r\n", "\n"), "c < 1 && let Some(d) <- f")
    }

    @TestCase
    func testIfExprInit02() {
        let expr = (nodes[1] as IfExpr).getOrThrow()
        let elseIf = (nodes[0] as IfExpr).getOrThrow()
        let ifExpr = IfExpr(expr.condition, expr.elseBlock, elseIf, expr.ifBlock)
        @Expect(ifExpr.toString().replace("\r\n", "\n"), "if (x == 1) {} else if (true) {} else {}")
    }
}