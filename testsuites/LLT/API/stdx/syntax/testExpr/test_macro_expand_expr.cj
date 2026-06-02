/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/macro_expand_expr.cj
// (not Windows) EXEC: dos2unix macro_expand_expr.cj
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
        let node = parseFile("macro_expand_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as MacroExpandExpr).getOrThrow()
        @Expect(expr.calleeMacro.toString().replace("\r\n", "\n"), "testMacro")
        @Expect(expr.macroAttrs.toString().replace("\r\n", "\n"), "public func")
        let macroInput = match (expr.macroInputs) {
            case MacroExpandInput.WithParens(r) => r
            case _ => @FailExpect("kind wrong")
        }
        let input = (macroInput as Tokens).getOrThrow()
        @Expect(input.toString().replace("\r\n", "\n"), "let a = 1")
        @Expect(expr.toString().replace("\r\n", "\n"), "@testMacro[public func](let a = 1)")
        @Expect(expr.toTokens().toString().replace("\r\n", "\n"), "@testMacro[public func](let a = 1)")

        var pos = expr.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
        pos = expr.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 15, 2, 16]).toArray())
        pos = expr.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 27, 2, 28]).toArray())
        pos = expr.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 28, 2, 29]).toArray())
        pos = expr.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 38, 2, 39]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 39]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as MacroExpandExpr).getOrThrow()
        @Expect(expr.calleeMacro.toString().replace("\r\n", "\n"), "macroPackage.testMacro")
        @Expect(expr.macroAttrs.toString().replace("\r\n", "\n"), "")
        let macroInput = match (expr.macroInputs) {
            case MacroExpandInput.WithParens(r) => r
            case _ => @FailExpect("kind wrong")
        }
        let input = (macroInput as Tokens).getOrThrow()
        @Expect(input.toString().replace("\r\n", "\n"), "1")
        @Expect(expr.toString().replace("\r\n", "\n"), "@macroPackage.testMacro(1)")

        var pos = expr.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        @Expect(expr.getLSquarePos().isNone())
        @Expect(expr.getRSquarePos().isNone())
        pos = expr.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 28, 3, 29]).toArray())
        pos = expr.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 30, 3, 31]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 31]).toArray())
    }

    // testcase added by dts
    @TestCase
    func testExpr03() {
        let expr_1 = (nodes[2] as MacroExpandExpr).getOrThrow()
        @Expect(expr_1.toString().replace("\r\n", "\n"), ##"@M1 @M2(foo())"##)
        @Assert(expr_1.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(expr_1.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(expr_1.macroInputs) {
            case WithoutParens(Decl) =>
                // MacroExpandExpr
                @Expect(Decl is MacroExpandDecl)
                @Expect(Decl.toString().replace("\r\n", "\n"), ##"@M2(foo())"##)
            case _ => @Assert(false)
        }

        let expr_2 = (nodes[3] as MacroExpandExpr).getOrThrow()
        @Expect(expr_2.toString().replace("\r\n", "\n"), ##"@M1[a: T, b: U](a = b)"##)
        @Assert(expr_2.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(expr_2.macroAttrs.toString().replace("\r\n", "\n"), "a: T, b: U")
        match(expr_2.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        let expr_3 = (nodes[4] as MacroExpandExpr).getOrThrow()
        @Expect(expr_3.toString().replace("\r\n", "\n"), ##"@M1(if (a) {b} else {c})"##)
        @Assert(expr_3.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(expr_3.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(expr_3.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }
        
        let expr_4 = (nodes[5] as MacroExpandExpr).getOrThrow()
        @Expect(expr_4.toString().replace("\r\n", "\n"), ##"@pkg1.pkg2.M1[aaaaaa](
        a ** b
    )"##)
        @Assert(expr_4.calleeMacro.toString().replace("\r\n", "\n"), "pkg1.pkg2.M1")
        @Assert(expr_4.macroAttrs.toString().replace("\r\n", "\n"), "aaaaaa")
        match(expr_4.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("macro_expand_expr.cj")
        let input = String.fromUtf8(File.readFrom("macro_expand_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as MacroExpandExpr).getOrThrow()
        let expr = MacroExpandExpr(tmp.calleeMacro, tmp.macroAttrs, tmp.macroInputs)
        @Expect(expr.calleeMacro.toString().replace("\r\n", "\n"), "testMacro")
        @Expect(expr.macroAttrs.toString().replace("\r\n", "\n"), "public func")
        let macroInput = match (expr.macroInputs) {
            case MacroExpandInput.WithParens(r) => r
            case _ => @FailExpect("kind wrong")
        }
        let input = (macroInput as Tokens).getOrThrow()
        @Expect(input.toString().replace("\r\n", "\n"), "let a = 1")
        @Expect(expr.macroAttrs.size, 2)
        @Expect(input.size, 4)
        @Expect(tmp.macroAttrs.size, 2)
        @Expect(expr.toString().replace("\r\n", "\n"), "@testMacro[public func](let a = 1)")

        var pos = expr.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = expr.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = expr.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 23, 1, 24]).toArray())
        pos = expr.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 24, 1, 25]).toArray())
        pos = expr.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 34, 1, 35]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 35]).toArray())
    }
}

