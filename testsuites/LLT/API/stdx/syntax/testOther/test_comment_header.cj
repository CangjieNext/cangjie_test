/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/comment_header.cj
// (not Windows) EXEC: dos2unix comment_header.cj
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
        let node = parseFile("comment_header.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testCommentKind() {
        let comments = file.getOrThrow().comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */""")
        match (comments[0].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[0].toString().replace("\r\n", "\n"), """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */""")
    }

    
    @TestCase
    func testFileToString() {
        let node = parseFile("comment_header.cj")
        let input = String.fromUtf8(File.readFrom("comment_header.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}