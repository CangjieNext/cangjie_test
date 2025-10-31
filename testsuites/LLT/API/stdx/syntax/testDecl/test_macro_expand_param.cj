// DEPENDENCE: sourceFile/macro_expand_param.cj
// (not Windows) EXEC: dos2unix macro_expand_param.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var params: ?ParameterList = None
    var decls: Array<Decl> = []
    var _decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("macro_expand_param.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let decl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let _decl = (file.topLevelDecls[1] as ClassDecl).getOrThrow()
        params = decl.params
        _decls = _decl.body.memberDecls
        decls = file.topLevelDecls
    }

    @TestCase
    func testParam01() {
        let paramList = params.getOrThrow()
        let param = (paramList.params[0] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "testMacro")
        @Expect(param.macroAttrs.toString(), "public func")
        match(param.macroInputs) {
            case WithoutParens(v) => @Expect(v.toString(), "a: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@testMacro[public func]a: Int64")
        @Expect(param.toTokens().toString(), "@testMacro[public func] a: Int64")

        var pos = param.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 15, 1, 16]).toArray())
        pos = param.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 25, 1, 26]).toArray())
        pos = param.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 37, 1, 38]).toArray())
        @Expect(param.getLParenPos().isNone())
        @Expect(param.getRParenPos().isNone())
    }

    @TestCase
    func testParam02() {
        let paramList = params.getOrThrow()
        let param = (paramList.params[1] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "macroPackage.testMacro")
        @Expect(param.macroAttrs.toString(), "")
        match(param.macroInputs) {
            case WithParens(v) => @Expect(v.toString(), "b!: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@macroPackage.testMacro(b!: Int64)")

        var pos = param.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 71, 1, 72]).toArray())
        pos = param.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 81, 1, 82]).toArray())
    }

    // testcase added from dts
    @TestCase
    func testParam03() {
        var funcdecl_1 = (_decls[0] as FuncDecl).getOrThrow()
        @Expect(funcdecl_1.toString(), ##"private C1(@M1 (var c: Int64), @M1 [x: Int64](public var d!: ?Int64), @M1[abcd](private let e!: R = R())) {
    }"##)
        let params = funcdecl_1.params
        @Assert(params.params.size, 3)
        let param_1: MacroExpandParam = (params.params[0] as MacroExpandParam).getOrThrow()
        @Assert(param_1.toString(), "@M1 (var c: Int64)")
        @Assert(param_1.calleeMacro.toString(), "M1")
        @Assert(param_1.macroAttrs.toString(), "")
        match(param_1.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        let param_2: MacroExpandParam = (params.params[1] as MacroExpandParam).getOrThrow()
        @Assert(param_2.toString(), "@M1 [x: Int64](public var d!: ?Int64)")
        @Assert(param_2.calleeMacro.toString(), "M1")
        @Assert(param_2.macroAttrs.toString(), "x: Int64")
        match(param_2.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        let param_3: MacroExpandParam = (params.params[2] as MacroExpandParam).getOrThrow()
        @Assert(param_3.toString(), "@M1[abcd](private let e!: R = R())")
        @Assert(param_3.calleeMacro.toString(), "M1")
        @Assert(param_3.macroAttrs.toString(), "abcd")
        match(param_3.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testParam04() {
        let decl = (decls[2] as FuncDecl).getOrThrow()
        let params = decl.params
        var param = (params.params[0] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "testMacro")
        @Expect(param.macroAttrs.toString(), "public func")
        match(param.macroInputs) {
            case WithoutParens(v) => 
                        @Expect(v.toString(), "a: Int64")
                        var pos = v.nodePos
                        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 39, 7, 47]).toArray())
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@testMacro[public func] a: Int64")
        var pos = param.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 15, 7, 47]).toArray())

        param = (params.params[1] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "macroPackage.testMacro")
        @Expect(param.macroAttrs.toString(), "")
        match(param.macroInputs) {
            case WithoutParens(v) => 
                    @Expect(v.toString(), "b!: Int64")
                    pos = v.nodePos
                    @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 77, 7, 86]).toArray())
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@macroPackage.testMacro     b!: Int64")
        pos = param.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 49, 7, 86]).toArray())
    }

    @TestCase
    func testMacroExpandParamInit01() {
        let paramList = params.getOrThrow()
        let param = (paramList.params[0] as MacroExpandParam).getOrThrow()
        let macroExpandParam = MacroExpandParam(param.calleeMacro, param.macroAttrs, param.macroInputs, annotations: param.annotations, modifiers: param.modifiers)
        @Expect(macroExpandParam.calleeMacro.toString(), "testMacro")
        @Expect(macroExpandParam.macroAttrs.toString(), "public func")
        match(macroExpandParam.macroInputs) {
            case WithoutParens(v) => @Expect(v.toString(), "a: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(macroExpandParam.toString(), "@testMacro[public func] a: Int64")

        @Expect(macroExpandParam.getLParenPos().isNone())
        @Expect(macroExpandParam.getRParenPos().isNone())
    }

    @TestCase
    func testMacroExpandParamInit02() {
        let paramList = params.getOrThrow()
        let param = (paramList.params[1] as MacroExpandParam).getOrThrow()
        let macroExpandParam = MacroExpandParam(param.calleeMacro, param.macroAttrs, param.macroInputs, annotations: param.annotations, modifiers: param.modifiers)
        @Expect(macroExpandParam.calleeMacro.toString(), "macroPackage.testMacro")
        @Expect(macroExpandParam.macroAttrs.toString(), "")
        match(macroExpandParam.macroInputs) {
            case WithParens(v) => @Expect(v.toString(), "b!: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(macroExpandParam.toString(), "@macroPackage.testMacro(b!: Int64)")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("macro_expand_param.cj")
        let input = String.fromUtf8(File.readFrom("macro_expand_param.cj"))
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
