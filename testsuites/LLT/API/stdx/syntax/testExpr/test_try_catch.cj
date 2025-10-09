// DEPENDENCE: sourceFile/try_catch.cj
// (not Windows) EXEC: dos2unix try_catch.cj
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
        let node = parseFile("try_catch.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as TryCatch).getOrThrow()
        @Expect(expr.tryBlock.toString(), """
{
        var a = 1
        a += 1
    }""")
        @Expect(expr.catchPatterns.size, 1)
        @Expect(expr.catchPatterns[0].toString(), "e: Exception")
        @Expect(expr.catchBlocks.size, 1)
        @Expect(expr.catchBlocks[0].toString(), "{}")
        @Expect(expr.finallyBlock.isNone())
        @Expect(expr.resourceSpec.size, 0)
        @Expect(expr.toString(), """
try {
        var a = 1
        a += 1
    } catch (e: Exception) {}""")
        @Expect(expr.getResourceSpecLParenPos().isNone())
        @Expect(expr.getResourceSpecRParenPos().isNone())
        var pos = expr.getTryKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 8]).toArray())
        pos = expr.getCatchKeyWordsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 7, 5, 12]).toArray())
        pos = expr.catchPatterns[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 26]).toArray())
        pos = expr.getCatchLParensPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 13, 5, 14]).toArray())
        pos = expr.getCatchRParensPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 26, 5, 27]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 5, 30]).toArray())
    }


    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as TryCatch).getOrThrow()
        @Expect(expr.catchPatterns.size, 2)
        @Expect(expr.catchPatterns[0].toString(), "e: ExceptionA | ExceptionB")
        @Expect(expr.catchPatterns[1].toString(), "e: Error")
        @Expect(expr.catchBlocks.size, 2)
        @Expect(expr.catchBlocks[0].toString(), """
{
        print(111)
        print(e)
    }""")
        @Expect(expr.catchBlocks[1].toString(), "{}")
        @Expect(expr.finallyBlock.getOrThrow().toString(), """
{
        return ()
    }""")
        @Expect(expr.getResourceSpecLParenPos().isNone())
        @Expect(expr.getResourceSpecRParenPos().isNone())
        @Expect(expr.resourceSpec.size, 0)
        var pos = expr.catchPatterns[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 14, 10, 40]).toArray())
        pos = expr.catchPatterns[0].pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 14, 10, 15]).toArray())
        pos = expr.catchPatterns[0].getColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 15, 10, 16]).toArray())
        pos = expr.catchPatterns[0].exceptionType[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 17, 10, 27]).toArray())
        pos = expr.catchPatterns[0].getBitOrsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 28, 10, 29]).toArray())
        pos = expr.catchPatterns[0].exceptionType[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 30, 10, 40]).toArray())


        @Expect(expr.toString(), """
try {
        var b = 1
        b += 1
    } catch (e: ExceptionA | ExceptionB) {
        print(111)
        print(e)
    } catch(e: Error) {} finally {
        return ()
    }""")
        pos = expr.getTryKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 5, 7, 8]).toArray())
        pos = expr.getFinallyKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 26, 13, 33]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as TryCatch).getOrThrow()
        @Expect(expr.tryBlock.toString(), "{}")
        @Expect(expr.catchPatterns.size, 0)
        @Expect(expr.catchBlocks.size, 0)
        @Expect(expr.finallyBlock.isNone())
        @Expect(expr.resourceSpec.size, 2)
        @Expect(expr.resourceSpec[0].toString(), "r1 = ResourceClass()")
        @Expect(expr.resourceSpec[1].toString(), "r2 = ResourceClass()")
        @Expect(expr.toString(), "try (r1 = ResourceClass(), r2 = ResourceClass()) {}")
        var pos = expr.getTryKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 5, 17, 8]).toArray())
        pos = expr.getResourceSpecLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 9, 17, 10]).toArray())
        pos = expr.getResourceSpecCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 30, 17, 31]).toArray())
        pos = expr.getResourceSpecRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 52, 17, 53]).toArray())
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[3] as TryCatch).getOrThrow()
        @Expect(expr.toString(), ##"try {
        a
    } catch (e: Exception | IOException) {
        b
    } catch (_) {
        c
    }"##)
        @Expect(expr.tryBlock.toString(), ##"{
        a
    }"##)
        @Expect(expr.catchBlocks.size, 2)
        @Expect(expr.catchBlocks[0].toString(), ##"{
        b
    }"##)
        @Expect(expr.catchBlocks[1].toString(), ##"{
        c
    }"##)
        @Expect(expr.catchPatterns.size, 2)
        expr.catchPatterns.toString() |> println
        @Expect(expr.catchPatterns[0].toString(), "e: Exception | IOException")
        @Expect(expr.catchPatterns[1].toString(), "_")
        @Expect(expr.finallyBlock.isNone())
        @Expect(expr.resourceSpec.size, 0)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("try_catch.cj")
        let input = String.fromUtf8(File.readFrom("try_catch.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
