/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/comment_toString.cj
// (not Windows) EXEC: dos2unix comment_toString.cj
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
        let node = parseFile("comment_toString.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testCommentString() {
        let comments = file.getOrThrow().comments
        @Expect(comments.size, 8)
        @Expect(comments[1].content, ##"// aaa //bbb"##)
        match (comments[1].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[1].toString().replace("\r\n", "\n"), ##"// aaa //bbb"##)


        @Expect(comments[2].content, ##"// c"##)
        match (comments[2].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[2].toString().replace("\r\n", "\n"), ##"// c"##)


        @Expect(comments[3].content, ##"/* ddd */"##)
        match (comments[3].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[3].toString().replace("\r\n", "\n"), ##"/* ddd */"##)


        @Expect(comments[4].content, ##"/*eee*/"##)
        match (comments[4].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[4].toString().replace("\r\n", "\n"), ##"/*eee*/"##)


        @Expect(comments[5].content.replace("\r\n", "\n"), ##"/**
ffffff
*/"##)
        match (comments[5].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[5].toString().replace("\r\n", "\n"), ##"/**
ffffff
*/"##)


        @Expect(comments[6].content, ##"// ff"##)
        match (comments[6].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[6].toString().replace("\r\n", "\n"), ##"// ff"##)


        @Expect(comments[7].content, ##"// ggg"##)
        match (comments[7].kind) {
            case CommentKind.Line => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(comments[7].toString().replace("\r\n", "\n"), ##"// ggg"##)
    }

    @TestCase
    func testFuncDecl() {
        /*
        // line comment1
        func foo<T>(/** document comment1 */ a: T, /** document comment2 */ b!: Int64 = 0) /* block comment1 */ where T <: I1 /** document comment3 */ & I2 /* block comment2*/ {
            func goo(a0: Int64) : (Int64 /* block comment3 */, /* block comment4 */ Int64) { (a0, a0)}
            // line comment2

            return (0, a)
        } // line comment3
        */
        let funcDecl = (decls[1] as FuncDecl).getOrThrow()
        var comments = funcDecl.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, ##"// line comment1"##)
        @Expect(comments[1].content, ##"// line comment3"##)

        comments = funcDecl.params.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"/* block comment1 */"##)
    }

    @TestCase
    func testMacroExpandDecl() {
        /*
        @M1/* block comment1 */ [/* block comment2 */expr] /* block comment3 */var a = 1 // line comment1
        */
        let macroExpandDecl = (decls[2] as MacroExpandDecl).getOrThrow()
        let comments = macroExpandDecl.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, ##"/* block comment1 */"##)
        @Expect(comments[1].content, ##"// line comment1"##)
    }

    @TestCase
    func testMatchExpr01() {
        let funcDecl = (decls[4] as FuncDecl).getOrThrow()
        let nodes = funcDecl.body.getOrThrow().nodes
        let matchExpr = (nodes[1] as MatchExpr).getOrThrow()
        let matchCase = (matchExpr.matchCases[0] as MatchCase).getOrThrow()
        @Expect(matchCase.toString().replace("\r\n", "\n"), ##"case 1 =>
        // comment on 1
        1
        // comment on ()
        () // comment on matchCase"##)
        let body = matchCase.body
        var litConstExpr = (body[0] as LitConstExpr).getOrThrow()
        @Expect(litConstExpr.toString().replace("\r\n", "\n"), ##"// comment on 1
        1"##)
        var comments = litConstExpr.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// comment on 1"##)

        let bodyNode = body[1]
        comments = bodyNode.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// comment on ()"##)

        comments = matchCase.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// comment on matchCase"##)
    }

    @TestCase
    func testMatchExpr02() {
        let funcDecl = (decls[4] as FuncDecl).getOrThrow()
        let nodes = funcDecl.body.getOrThrow().nodes
        var matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        var matchCase = (matchExpr.matchCases[1] as MatchCase).getOrThrow()
        var comments = matchCase.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content.replace("\r\n", "\n"), ##"/*
             * comment on matchCase
             */"##)

        matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        matchCase = (matchExpr.matchCases[0] as MatchCase).getOrThrow()
        comments = matchCase.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// hello"##)

        matchExpr = (nodes[4] as MatchExpr).getOrThrow()
        matchCase = (matchExpr.matchCases[0] as MatchCase).getOrThrow()
        comments = matchCase.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// hello"##)

        matchExpr = (nodes[5] as MatchExpr).getOrThrow()
        matchCase = (matchExpr.matchCases[0] as MatchCase).getOrThrow()
        let caseCond = matchCase.caseCond.getOrThrow()
        comments = caseCond.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"/* comment */"##)
    }

    @TestCase
    func testEnumDecl01() {
        /*
        enum E1
        {
            | B1 /* block comment1 */ (/* block comment2 */T/* block comment3 */, /* block comment4 */R/* block comment5 */) // comment
        }
        */
        let enumDecl = (decls[5] as EnumDecl).getOrThrow()
        let constructor = (enumDecl.body.memberDecls[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.toString().replace("\r\n", "\n"), ##"B1 /* block comment1 */ (/* block comment2 */T/* block comment3 */, /* block comment4 */R/* block comment5 */) // comment"##)
        let comments = constructor.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, ##"/* block comment1 */"##)
        @Expect(comments[1].content, ##"// comment"##)
    }

    @TestCase
    func testEnumDecl02() {
        /*
        enum E {
            // comment
            | Enum
            | A
            | B
        }
        */
        let enumDecl = (decls[6] as EnumDecl).getOrThrow()
        let comments = enumDecl.body.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, ##"// comment"##)
    }

    
    @TestCase
    func testFileToString() {
        let node = parseFile("comment_toString.cj")
        let input = String.fromUtf8(File.readFrom("comment_toString.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}