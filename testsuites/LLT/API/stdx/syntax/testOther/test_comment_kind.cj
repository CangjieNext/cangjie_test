/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/comment_kind.cj
// (not Windows) EXEC: dos2unix comment_kind.cj
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
        let node = parseFile("comment_kind.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testCommentKind() {
        let comments = file.getOrThrow().comments
        @Expect(comments.size, 7)
        @Expect(comments[1].content, ##"//"##)
        match (comments[1].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[1].toString().replace("\r\n", "\n"), ##"//"##)


        @Expect(comments[2].content, ##"// "##)
        match (comments[2].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[2].toString().replace("\r\n", "\n"), ##"// "##)

        @Expect(comments[3].content.replace("\r\n", "\n"), ##"/*
*/"##)
        match (comments[3].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[3].toString().replace("\r\n", "\n"), ##"/*
*/"##)

        @Expect(comments[4].content.replace("\r\n", "\n"), ##"/**
*/"##)
        match (comments[4].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[4].toString().replace("\r\n", "\n"), ##"/**
*/"##)

        @Expect(comments[5].content, ##"/**/"##)
        match (comments[5].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[5].toString().replace("\r\n", "\n"), ##"/**/"##)

        @Expect(comments[6].content, ##"/***/"##)
        match (comments[6].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[6].toString().replace("\r\n", "\n"), ##"/***/"##)
    }

    
    @TestCase
    func testFileToString() {
        let node = parseFile("comment_kind.cj")
        let input = String.fromUtf8(File.readFrom("comment_kind.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}