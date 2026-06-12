/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/macro_decl.cj
// (not Windows) EXEC: dos2unix macro_decl.cj
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
        let node = parseFile("macro_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as MacroDecl).getOrThrow()
        @Expect(decl.name, "testMacro")
        let params = decl.params
        @Expect(params.toString().replace("\r\n", "\n"), "(a: Tokens)")
        @Expect(params.params.size, 1)
        @Expect(params.params[0].toString().replace("\r\n", "\n"), "a: Tokens")
        @Expect(decl.retTyAnnotation.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ a }")
        @Expect(decl.toString().replace("\r\n", "\n"), "public macro testMacro(a: Tokens) { a }")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))

        var pos = decl.getMacroKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 13]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 14, 3, 23]).toArray())
        pos = params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 23, 3, 24]).toArray())
        @Expect(params.getParamsCommasPos().size, 0)
        pos = params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 33, 3, 34]).toArray())
        @Expect(decl.getRetTyAnnotationColonPos().isNone())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 1, 3, 40]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as MacroDecl).getOrThrow()
        @Expect(decl.name, "testMacro")
        let params = decl.params
        @Expect(params.toString().replace("\r\n", "\n"), "(a: Tokens, b: Tokens)")
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString().replace("\r\n", "\n"), "a: Tokens")
        @Expect(params.params[1].toString().replace("\r\n", "\n"), "b: Tokens")
        @Expect(decl.retTyAnnotation.getOrThrow().toString().replace("\r\n", "\n"), "Tokens")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ return quote() }")
        @Expect(decl.toString().replace("\r\n", "\n"), "public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getMacroKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 13]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 14, 4, 23]).toArray())
        pos = params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 23, 4, 24]).toArray())
        @Expect(params.getParamsCommasPos().size, 1)
        pos = params.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 33, 4, 34]).toArray())
        pos = params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 44, 4, 45]).toArray())
        pos = decl.getRetTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 45, 4, 46]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 1, 4, 72]).toArray())
    }

    @TestCase
    func testMacroDeclInit() {
        let decl = (decls[1] as MacroDecl).getOrThrow()
        let marcoDecl = MacroDecl(decl.body, decl.name, decl.params, decl.retTyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(marcoDecl.name, "testMacro")
        let params = marcoDecl.params
        @Expect(params.toString().replace("\r\n", "\n"), "(a: Tokens, b: Tokens)")
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString().replace("\r\n", "\n"), "a: Tokens")
        @Expect(params.params[1].toString().replace("\r\n", "\n"), "b: Tokens")
        @Expect(marcoDecl.retTyAnnotation.getOrThrow().toString().replace("\r\n", "\n"), "Tokens")
        let block = Block(marcoDecl.body.nodes)
        @Expect(block.toString().replace("\r\n", "\n"), #"{
    return quote()
}"#)
        @Expect(block.nodes[0].toString().replace("\r\n", "\n"), "return quote()")
        @Expect(marcoDecl.toString().replace("\r\n", "\n"), "public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }")
        var pos = marcoDecl.getMacroKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 13]).toArray())
        pos = marcoDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 23]).toArray())
        pos = params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 23, 1, 24]).toArray())
        @Expect(params.getParamsCommasPos().size, 1)
        pos = params.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 33, 1, 34]).toArray())
        pos = params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 44, 1, 45]).toArray())
        pos = marcoDecl.getRetTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 45, 1, 46]).toArray())
        pos = marcoDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 72]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("macro_decl.cj")
        let input = String.fromUtf8(File.readFrom("macro_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

