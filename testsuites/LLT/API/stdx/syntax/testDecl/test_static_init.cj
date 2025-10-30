// DEPENDENCE: sourceFile/static_init.cj
// (not Windows) EXEC: dos2unix static_init.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("static_init.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let classDecl = (decls[0] as ClassDecl).getOrThrow()
        let decl = (classDecl.body.memberDecls[0] as StaticInit).getOrThrow()
        @Expect(decl.body.toString(), "{}")
        @Expect(decl.toString(), "static init() {}")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
        var pos = decl.getStaticKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 11]).toArray())
        pos = decl.getInitKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 12, 2, 16]).toArray())
        pos = decl.getParamsLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 16, 2, 17]).toArray())
        pos = decl.getParamsRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 17, 2, 18]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 21]).toArray())
    }

    @TestCase
    func testDecl02() {
        let classDecl = (decls[1] as ClassDecl).getOrThrow()
        let decl = (classDecl.body.memberDecls[0] as StaticInit).getOrThrow()
        @Expect(decl.body.toString(), """
{
        a = 1
        println()
    }""")
        @Expect(decl.toString(), """
static init() {
        a = 1
        println()
    }""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
        var pos = decl.getStaticKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 11]).toArray())
        pos = decl.getInitKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 12, 6, 16]).toArray())
        pos = decl.getParamsLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 16, 6, 17]).toArray())
        pos = decl.getParamsRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 17, 6, 18]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 9, 6]).toArray())
    }

    @TestCase
    func testStaticInitInit() {
        let classDecl = (decls[1] as ClassDecl).getOrThrow()
        let decl = (classDecl.body.memberDecls[0] as StaticInit).getOrThrow()
        let staticInit = StaticInit(decl.body, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(staticInit.body.toString(), """
{
        a = 1
        println()
    }""")
        @Expect(staticInit.toString(), """
static init() {
        a = 1
        println()
    }""")
        var pos = staticInit.getStaticKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = staticInit.getInitKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 12]).toArray())
        pos = staticInit.getParamsLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 13]).toArray())
        pos = staticInit.getParamsRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 13, 1, 14]).toArray())
        pos = staticInit.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 4, 6]).toArray())
    }


    @TestCase
    func testFileToString() {
        let node = parseFile("static_init.cj")
        let input = String.fromUtf8(File.readFrom("static_init.cj"))
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
