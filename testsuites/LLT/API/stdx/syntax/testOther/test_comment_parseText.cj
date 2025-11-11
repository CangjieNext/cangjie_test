/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.ArrayList

@Test
class Test {
    @TestCase
    func testVarDeclComment() {
        let node = parseText("let a = 1 /*comment*/")
        let decl = (node.node.getOrThrow() as VarDecl).getOrThrow()
        @Expect(decl.toString(), "let a = 1 /*comment*/")
        var comments = decl.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/*comment*/")

        let text = """
// leading comment
let (a, b): (Int64, String) = (1, "hello")
// trailing comment"""
        let decl_1 = (parseText(text).node.getOrThrow() as VarDecl).getOrThrow()
        @Expect(decl_1.toString(), text)
        comments = decl_1.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, "// leading comment")
        @Expect(comments[1].content, "// trailing comment")
    }

    @TestCase
    func testBinaryExprComment() {
        let node = parseText("""
/* leading comment */
a + b""")
        let expr = (node.node.getOrThrow() as BinaryExpr).getOrThrow()
        var comments = expr.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* leading comment */")
        
        @Expect(expr.toString(), """
/* leading comment */
a + b""")

    }
}