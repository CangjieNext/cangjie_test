// DEPENDENCE: sourceFile/main_decl.cj
// (not Windows) EXEC: dos2unix main_decl.cj
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
        let node = parseFile("main_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testMain01() {
        @Expect(decls[0] is MainDecl)
        let decl = (decls[0] as MainDecl).getOrThrow()

        @Expect(decl.body.nodes.size, 0)
        @Expect(decl.params.params.size, 0)
        @Expect(decl.retTyAnnotation.isNone(), true)
        @Expect(decl.toString(), "main() {}")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
    }

    @TestCase
    func testMain02() {
        @Expect(decls[1] is MainDecl)
        let decl = (decls[1] as MainDecl).getOrThrow()
        let ret = decl.retTyAnnotation.getOrThrow()
        let params = decl.params

        @Expect(decl.body.nodes.size, 4)
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "param1: Int64")
        @Expect(params.params[1].toString(), "param2: Int64")
        @Expect(ret is AtomicType)
        @Expect(ret.toString(), "Int64")

        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 1, 8, 2]).toArray())
        pos = decl.getMainKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 1, 3, 5]).toArray())
        pos = params.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 35]).toArray())
        pos = params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        pos = params.params[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 6, 3, 19]).toArray())
        pos = params.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 19, 3, 20]).toArray())
        pos = params.params[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 21, 3, 34]).toArray())
        pos = params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 34, 3, 35]).toArray())
        pos = decl.getRetTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 35, 3, 36]).toArray())
        pos = decl.retTyAnnotation.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 37, 3, 42]).toArray())
        pos = decl.body.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 43, 3, 44]).toArray())
        pos = decl.body.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 1, 8, 2]).toArray())
        @Expect(decl.toString(), """
main(param1: Int64, param2: Int64): Int64 {
    1
    1 + 1
    "a"
    0
}""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
    }

    @TestCase
    func testMain03() {
        let decl = (decls[2] as MainDecl).getOrThrow()
        @Expect(decl.body.nodes.size, 1)
        let params = decl.params
        @Expect(params.params.size, 1)
        let param = (params.params[0] as MacroExpandParam).getOrThrow()
        @Expect(param.toString(), "@M param1: Int64")
        @Expect(param.calleeMacro.toString(), "M")
    }

    @TestCase
    func testMainDeclInit01() {
        let decl = (decls[1] as MainDecl).getOrThrow()
        let mainDecl = MainDecl(decl.body, decl.params, decl.retTyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        let ret = mainDecl.retTyAnnotation.getOrThrow()
        let params = mainDecl.params

        @Expect(mainDecl.body.nodes.size, 4)
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "param1: Int64")
        @Expect(params.params[1].toString(), "param2: Int64")
        @Expect(ret is AtomicType)
        @Expect(ret.toString(), "Int64")

        @Expect(mainDecl.toString(), """
main(param1: Int64, param2: Int64): Int64 {
    1
    1 + 1
    "a"
    0
}""")
    }

    @TestCase
    func testMainDeclInit02() {
        let decl = (decls[2] as MainDecl).getOrThrow()
        let mainDecl = MainDecl(decl.body, decl.params, decl.retTyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(mainDecl.body.nodes.size, 1)
        let params = mainDecl.params
        @Expect(params.params.size, 1)
        let param = (params.params[0] as MacroExpandParam).getOrThrow()
        let macroExpandParam = MacroExpandParam(param.calleeMacro, param.macroAttrs, param.macroInputs, annotations: param.annotations, modifiers: param.modifiers)
        @Expect(macroExpandParam.toString(), "@M param1: Int64")
        @Expect(macroExpandParam.calleeMacro.toString(), "M")
    }

    @TestCase
    func testBlockInit() {
        let varDecl = parseText("var a = 1").node.getOrThrow()
        let funcDecl = parseText("func foo(a: Int64)").node.getOrThrow()
        let block = Block([varDecl, funcDecl])
        @Expect(block.toString(), ##"{
    var a = 1
    func foo(a: Int64)
}"##)
        @Expect(block.nodes.size, 2)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("main_decl.cj")
        let input = String.fromUtf8(File.readFrom("main_decl.cj"))
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
