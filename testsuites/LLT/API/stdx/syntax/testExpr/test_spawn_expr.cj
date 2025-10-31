// DEPENDENCE: sourceFile/spawn_expr.cj
// (not Windows) EXEC: dos2unix spawn_expr.cj
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
        let node = parseFile("spawn_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as SpawnExpr).getOrThrow()
        @Expect(expr.threadContext.isNone())
        @Expect(expr.trailingLambdaExpr.toString(), """
{ =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    }""")
        @Expect(expr.toString(), """
spawn { =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    }""")
        var pos = expr.getSpawnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        @Expect(expr.getThreadContextLParenPos().isNone())
        @Expect(expr.getThreadContextRParenPos().isNone())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 6, 6]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as SpawnExpr).getOrThrow()
        @Expect(expr.threadContext.getOrThrow().toString(), "a")
        @Expect(expr.trailingLambdaExpr.toString(), """
{ =>
        sleep(Duration.second)
        return 1
    }""")
        @Expect(expr.toString(), """
spawn (a) { =>
        sleep(Duration.second)
        return 1
    }""")
        var pos = expr.getSpawnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 10]).toArray())
        pos = expr.getThreadContextLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 11, 8, 12]).toArray())
        pos = expr.getThreadContextRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 13, 8, 14]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 11, 6]).toArray())
    }

    @TestCase
    func testSpawnExprInit() {
        let expr = (nodes[1] as SpawnExpr).getOrThrow()
        let spawnExpr = SpawnExpr(expr.threadContext, expr.trailingLambdaExpr)
        @Expect(spawnExpr.threadContext.getOrThrow().toString(), "a")
        @Expect(spawnExpr.trailingLambdaExpr.toString(), """
{ =>
        sleep(Duration.second)
        return 1
    }""")
        @Expect(spawnExpr.toString(), """
spawn (a) { =>
        sleep(Duration.second)
        return 1
    }""")
        var pos = spawnExpr.getSpawnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = spawnExpr.getThreadContextLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        pos = spawnExpr.getThreadContextRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 9, 1, 10]).toArray())
        pos = spawnExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 4, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("spawn_expr.cj")
        let input = String.fromUtf8(File.readFrom("spawn_expr.cj"))
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
