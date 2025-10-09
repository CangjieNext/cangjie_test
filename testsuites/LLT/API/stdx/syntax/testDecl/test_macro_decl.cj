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
        @Expect(params.toString(), "(a: Tokens)")
        @Expect(params.params.size, 1)
        @Expect(params.params[0].toString(), "a: Tokens")
        @Expect(decl.retTyAnnotation.isNone())
        @Expect(decl.body.toString(), "{ a }")
        @Expect(decl.toString(), "public macro testMacro(a: Tokens) { a }")

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
        @Expect(params.toString(), "(a: Tokens, b: Tokens)")
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "a: Tokens")
        @Expect(params.params[1].toString(), "b: Tokens")
        @Expect(decl.retTyAnnotation.getOrThrow().toString(), "Tokens")
        @Expect(decl.body.toString(), "{ return quote() }")
        @Expect(decl.toString(), "public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }")
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
    func testFileToString() {
        let node = parseFile("macro_decl.cj")
        let input = String.fromUtf8(File.readFrom("macro_decl.cj"))
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
