/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/foreign_decl.cj
// (not Windows) EXEC: dos2unix foreign_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.unittest.testmacro.*
import std.collection.ArrayList

@Test
class Test {
    var file: ?SourceFile = None

    var diags: Array<Diagnostic> = []

    @BeforeAll
    func readInput(): Unit {
        let node = parseFile("foreign_decl.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        diags = node.diags
    }

    // Guard against issue: parsing a file with `@When` annotated `foreign` declarations
    // used to produce drifted/beyond-boundary positions for the members of a
    // `foreign {}` block, because the block-level annotations propagated by the
    // compiler were expanded inside each member and dragged the cursor backwards.

    @TestCase
    func testForeignFuncWithWhen(): Unit {
        // Standalone `foreign func` keeps its own annotation and exact positions.
        let funcDecl = (file.getOrThrow().topLevelDecls[0] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Foreign => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "start")
        @Expect(funcDecl.annotations.size, 1)
        @Expect(funcDecl.annotations[0].identifier, "When")
        @Expect(funcDecl.annotations[0].toString().replace("\r\n", "\n"), "@When[os != \"Windows\"]")
        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 1, 4, 38]).toArray())
        pos = funcDecl.getFuncKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 1, 4, 8]).toArray())
        pos = funcDecl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 9, 4, 13]).toArray())
        @Expect(funcDecl.toString().replace("\r\n", "\n"), "@When[os != \"Windows\"]\nforeign func start(pid: Int32): Int64")
    }

    @TestCase
    func testForeignBlockMemberPositions(): Unit {
        // The first member of a `foreign {}` block starts at its own `func` keyword.
        // The block-level `@When` must not be expanded into the member's text
        // and must not shift the member's positions.
        let funcDecl = (file.getOrThrow().topLevelDecls[1] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Foreign => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "open")
        @Expect(funcDecl.annotations.size, 0)
        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 43]).toArray())
        pos = funcDecl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 12, 8, 16]).toArray())

        // The second member keeps its own positions as well.
        let second = (file.getOrThrow().topLevelDecls[2] as FuncDecl).getOrThrow()
        @Expect(second.name, "close")
        @Expect(second.annotations.size, 0)
        pos = second.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 5, 10, 39]).toArray())
        pos = second.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 12, 10, 16]).toArray())
    }

    @TestCase
    func testForeignBlockWithLeadingComment(): Unit {
        // Leading comments inside a `foreign {}` block belong to the member
        // following them (existing behaviour of stdx.syntax).
        let funcDecl = (file.getOrThrow().topLevelDecls[4] as FuncDecl).getOrThrow()
        @Expect(funcDecl.name, "read")
        @Expect(funcDecl.annotations.size, 0)
        let pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 5, 20, 32]).toArray())

        let second = (file.getOrThrow().topLevelDecls[5] as FuncDecl).getOrThrow()
        @Expect(second.name, "write")
        @Expect(second.annotations.size, 0)
        let pos2 = second.nodePos
        @Expect([pos2.beginLine, pos2.beginColumn, pos2.endLine, pos2.endColumn], ArrayList<Int32>([21, 5, 21, 40]).toArray())
    }

    @TestCase
    func testForeignFuncWithMultipleAnnotations(): Unit {
        // Multiple annotations on a standalone `foreign func` are kept in order.
        let funcDecl = (file.getOrThrow().topLevelDecls[3] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Foreign => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "stop")
        @Expect(funcDecl.annotations.size, 2)
        @Expect(funcDecl.annotations[0].identifier, "When")
        @Expect(funcDecl.annotations[1].identifier, "Deprecated")
        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 1, 15, 36]).toArray())
        pos = funcDecl.annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 1, 13, 23]).toArray())
        pos = funcDecl.annotations[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([14, 1, 14, 45]).toArray())
        pos = funcDecl.getFuncKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([15, 1, 15, 8]).toArray())
    }

    @TestCase
    func testForeignBlockMemberWithOwnAnnotation(): Unit {
        // A member's own annotation (written directly on the member, after the block-level
        // ones) must still be kept and expanded, while the block-level `@When` propagated
        // by the compiler is filtered out.
        let funcDecl = (file.getOrThrow().topLevelDecls[6] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Foreign => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "hook")
        @Expect(funcDecl.annotations.size, 1)
        @Expect(funcDecl.annotations[0].identifier, "Deprecated")
        var pos = funcDecl.annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 5, 26, 33]).toArray())
        pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 5, 27, 31]).toArray())
    }

    @TestCase
    func testTopLevelDeclsCount(): Unit {
        let f = file.getOrThrow()
        @Expect(diags.size, 0)
        @Expect(f.topLevelDecls.size, 7)
    }
}
