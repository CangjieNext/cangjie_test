/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/enum_ctor_comment.cj
// (not Windows) EXEC: dos2unix enum_ctor_comment.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []
    var file: ?SourceFile = None

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("enum_ctor_comment.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    func getCtor(enumDecl: EnumDecl, index: Int64): EnumConstructor {
        (enumDecl.body.memberDecls[index] as EnumConstructor).getOrThrow()
    }

    @TestCase
    func testMixedStatusCtorComments() {
        /*
        // leading comment belong to enumDecl
        enum MixedStatus {
            doc comment belong to Unhealthy
            Unhealthy
            doc comment belong to Degraded
            | Degraded
            doc comment belong to Healthy
            | Healthy
        }
        */
        let enumDecl = (decls[0] as EnumDecl).getOrThrow()
        @Expect(enumDecl.comments.size, 1)
        var pos = enumDecl.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 38]).toArray())

        @Expect(enumDecl.body.comments.size, 0)
        @Expect(enumDecl.getCaseSeparatorsPos().size, 2)

        let unhealthy = getCtor(enumDecl, 0)
        @Expect(unhealthy.name, "Unhealthy")
        @Expect(unhealthy.comments.size, 1)
        @Expect(unhealthy.comments[0].content.replace("\r\n", "\n"), ##"/**
     * doc comment belong to Unhealthy
     */"##)
        match (unhealthy.comments[0].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }
        pos = unhealthy.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 5, 8]).toArray())
        pos = unhealthy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 6, 14]).toArray())

        let degraded = getCtor(enumDecl, 1)
        @Expect(degraded.name, "Degraded")
        @Expect(degraded.comments.size, 1)
        @Expect(degraded.comments[0].content.replace("\r\n", "\n"), ##"/**
     * doc comment belong to Degraded
     */"##)
        pos = degraded.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 5, 9, 8]).toArray())
        pos = degraded.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 7, 10, 15]).toArray())

        let healthy = getCtor(enumDecl, 2)
        @Expect(healthy.name, "Healthy")
        @Expect(healthy.comments.size, 1)
        @Expect(healthy.comments[0].content.replace("\r\n", "\n"), ##"/**
     * doc comment belong to Healthy
     */"##)
        pos = healthy.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 5, 13, 8]).toArray())
        pos = healthy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([14, 7, 14, 14]).toArray())
    }

    @TestCase
    func testAllPipeStatusCtorComments() {
        /*
        // leading comment belong to enumDecl
        enum AllPipeStatus {
            // comment belong to Unhealthy
            | Unhealthy
            // comment belong to Degraded
            | Degraded
            // comment belong to Healthy
            | Healthy
        }
        */
        let enumDecl = (decls[1] as EnumDecl).getOrThrow()
        @Expect(enumDecl.comments.size, 1)
        var pos = enumDecl.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 1, 17, 38]).toArray())

        @Expect(enumDecl.body.comments.size, 0)
        @Expect(enumDecl.getCaseSeparatorsPos().size, 3)

        let unhealthy = getCtor(enumDecl, 0)
        @Expect(unhealthy.name, "Unhealthy")
        @Expect(unhealthy.comments.size, 1)
        @Expect(unhealthy.comments[0].content, "// comment belong to Unhealthy")
        match (unhealthy.comments[0].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        pos = unhealthy.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 5, 19, 35]).toArray())
        pos = unhealthy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 7, 20, 16]).toArray())

        let degraded = getCtor(enumDecl, 1)
        @Expect(degraded.name, "Degraded")
        @Expect(degraded.comments.size, 1)
        @Expect(degraded.comments[0].content, "// comment belong to Degraded")
        pos = degraded.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 5, 21, 34]).toArray())
        pos = degraded.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 7, 22, 15]).toArray())

        let healthy = getCtor(enumDecl, 2)
        @Expect(healthy.name, "Healthy")
        @Expect(healthy.comments.size, 1)
        @Expect(healthy.comments[0].content, "// comment belong to Healthy")
        pos = healthy.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 5, 23, 33]).toArray())
        pos = healthy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([24, 7, 24, 14]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("enum_ctor_comment.cj")
        let input = String.fromUtf8(File.readFrom("enum_ctor_comment.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString().replace("\r\n", "\n"), input.replace("\r\n", "\n"))
    }

    @TestCase
    func testRewriterIdentityWalk() {
        // Regression guard for the comment binding fix: the rewriter pairs every
        // green CommentGroupList child of a Body with the red-tree comment queue
        // one by one. The doc comments of pipe-prefixed constructors are reported
        // through the constructors themselves, so an identity rewrite must neither
        // throw nor lose/misplace those comments.
        let node = parseFile("enum_ctor_comment.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let rewriter = ASTRewriter()
        let newFile = rewriter.walk(file)
        @Assert((newFile as SourceFile).isSome())
        for (decl in file.topLevelDecls) {
            if (let Some(enumDecl) <- (decl as EnumDecl)) {
                let newDecl = rewriter.walk(enumDecl)
                if (let Some(newEnum) <- (newDecl as EnumDecl)) {
                    @Expect(newEnum.name, enumDecl.name)
                    @Expect(newEnum.toString(), enumDecl.toString())
                    for (member in newEnum.body.memberDecls) {
                        if (let Some(ctor) <- (member as EnumConstructor)) {
                            @Expect(ctor.comments.size, 1)
                        }
                    }
                } else {
                    @FailExpect("rewritten decl is not an EnumDecl")
                }
            }
        }
    }

    @TestCase
    func testRewriterWalkEnumDeclIdentity() {
        // Focused guard for ASTRewriter().walk(enumDecl): an identity rewrite of
        // a single EnumDecl must keep the text byte-exact and keep the doc
        // comments bound to the pipe-prefixed constructors.
        let node = parseFile("enum_ctor_comment.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        var enumDeclCount = 0
        for (decl in file.topLevelDecls) {
            if (let Some(enumDecl) <- (decl as EnumDecl)) {
                enumDeclCount++
                let rewritten = ASTRewriter().walk(enumDecl)
                let newEnum = (rewritten as EnumDecl).getOrThrow()
                @Expect(newEnum.toString().replace("\r\n", "\n"), enumDecl.toString().replace("\r\n", "\n"))
                @Expect(newEnum.body.memberDecls.size, enumDecl.body.memberDecls.size)
                for (i in 0..enumDecl.body.memberDecls.size) {
                    let oldCtor = (enumDecl.body.memberDecls[i] as EnumConstructor).getOrThrow()
                    let newCtor = (newEnum.body.memberDecls[i] as EnumConstructor).getOrThrow()
                    @Expect(newCtor.name, oldCtor.name)
                    @Expect(newCtor.comments.size, oldCtor.comments.size)
                }
            }
        }
        @Expect(enumDeclCount, 2)
    }
}
