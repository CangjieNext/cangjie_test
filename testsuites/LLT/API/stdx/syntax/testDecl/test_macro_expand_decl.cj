/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/macro_expand_decl.cj
// (not Windows) EXEC: dos2unix macro_expand_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var topLevelDecls: Array<Decl> = []
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("macro_expand_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        topLevelDecls = file.topLevelDecls
        let decl = (topLevelDecls[1] as ClassDecl).getOrThrow()
        decls = decl.body.memberDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (topLevelDecls[0] as MacroExpandDecl).getOrThrow()
        @Expect(decl.calleeMacro.toString().replace("\r\n", "\n"), "testMacro")
        @Expect(decl.macroAttrs.toString().replace("\r\n", "\n"), "")
        match (decl.macroInputs) {
            case WithoutParens(v) =>
                @Expect(v is ClassDecl)
                @Expect(v.toString().replace("\r\n", "\n"), "class A {}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString().replace("\r\n", "\n"), """
@testMacro
class A {}""")
        @Expect(decl.toTokens().toString().replace("\r\n", "\n"), """
@testMacro
class A { }""")
        var pos = decl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        @Expect(decl.getLSquarePos().isNone())
        @Expect(decl.getRSquarePos().isNone())
        @Expect(decl.getLParenPos().isNone())
        @Expect(decl.getRParenPos().isNone())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 2, 11]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[0] as MacroExpandDecl).getOrThrow()
        @Expect(decl.calleeMacro.toString().replace("\r\n", "\n"), "testMacro")
        @Expect(decl.macroAttrs.toString().replace("\r\n", "\n"), "public func")
        match (decl.macroInputs) {
            case WithoutParens(v) =>
                @Expect(v is FuncDecl)
                @Expect(v.toString().replace("\r\n", "\n"), "func a() {}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString().replace("\r\n", "\n"), """
@testMacro[public func]
    func a() {}""")
        @Expect(decl.toTokens().toString().replace("\r\n", "\n"), """
@testMacro[public func]
func a() { }""")
        var pos = decl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 5, 6]).toArray())
        pos = decl.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 15, 5, 16]).toArray())
        pos = decl.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 27, 5, 28]).toArray())
        @Expect(decl.getLParenPos().isNone())
        @Expect(decl.getRParenPos().isNone())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 6, 16]).toArray())
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[1] as MacroExpandDecl).getOrThrow()
        @Expect(decl.calleeMacro.toString().replace("\r\n", "\n"), "macroPackage.testMacro")
        @Expect(decl.macroAttrs.toString().replace("\r\n", "\n"), "")
        match (decl.macroInputs) {
            case WithParens(v) => @Expect(v.toString().replace("\r\n", "\n"), "var b = 1")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString().replace("\r\n", "\n"), "@macroPackage.testMacro(var b = 1)")
        var pos = decl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 6]).toArray())
        @Expect(decl.getLSquarePos().isNone())
        @Expect(decl.getRSquarePos().isNone())
        pos = decl.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 28, 8, 29]).toArray())
        pos = decl.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 38, 8, 39]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 39]).toArray())
    }

    // testcases add by dts
    @TestCase
    func testDecl04() {
        var decl_1: MacroExpandDecl = (topLevelDecls[2] as MacroExpandDecl).getOrThrow()
        @Expect(decl_1.toString().replace("\r\n", "\n"), ##"@p1.M1[tok1]( func foo(): Int64 {
    return 1
})"##)
        @Assert(decl_1.calleeMacro.toString().replace("\r\n", "\n"), "p1.M1")
        @Assert(decl_1.macroAttrs.toString().replace("\r\n", "\n"), "tok1")
        decl_1.macroAttrs.append(Token())
        match(decl_1.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }
        var decl_2: MacroExpandDecl = (topLevelDecls[3] as MacroExpandDecl).getOrThrow()
        @Assert(decl_2.toString().replace("\r\n", "\n"), ##"@M1[a: tok1, b: tok2]
func foo<T>(a: T, b!: Int64 = 0) {
    return a
}"##)
        @Assert(decl_2.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(decl_2.macroAttrs.toString().replace("\r\n", "\n"), "a: tok1, b: tok2")
        match(decl_2.macroInputs) {
            case WithoutParens(_) => ()
            case _ => @Assert(false)
        }

        var decl_3: MacroExpandDecl = (topLevelDecls[4] as MacroExpandDecl).getOrThrow()
        @Assert(decl_3.toString().replace("\r\n", "\n"), ##"@M_A_B(func foo() {})"##)
        @Assert(decl_3.calleeMacro.toString().replace("\r\n", "\n"), "M_A_B")
        @Assert(decl_3.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(decl_3.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        var decl_4: MacroExpandDecl = (topLevelDecls[5] as MacroExpandDecl).getOrThrow()
        @Assert(decl_4.toString().replace("\r\n", "\n"), ##"@M1
func foo(a: T) : (T, T) {
    (a, a)
}"##)
        @Assert(decl_4.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(decl_4.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(decl_4.macroInputs) {
            case WithoutParens(Decl) => @Assert(Decl is FuncDecl)
            case _ => @Assert(false)
        }

        decl_1 = (topLevelDecls[6] as MacroExpandDecl).getOrThrow()
        @Expect(decl_1.toString().replace("\r\n", "\n"), ##"@p1.M1[tok1](@Deprecated["a"] class C1 {
    public C1(var a: Int64) {}
})"##)
        @Assert(decl_1.calleeMacro.toString().replace("\r\n", "\n"), "p1.M1")
        @Assert(decl_1.macroAttrs.toString().replace("\r\n", "\n"), "tok1")
        match(decl_1.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        decl_2 = (topLevelDecls[7] as MacroExpandDecl).getOrThrow()
        @Expect(decl_2.toString().replace("\r\n", "\n"), ##"@M1[a: tok1, b: tok2]
@Deprecated["a"]
class C1<T, U> <: I1 & C2<T> where T <: I1 & I2, U <: I3 {
    public C1(var a: T, public let b: U) {}
}"##)
        @Assert(decl_2.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(decl_2.macroAttrs.toString().replace("\r\n", "\n"), "a: tok1, b: tok2")
        match(decl_2.macroInputs) {
            case WithoutParens(Decl) => @Expect(Decl.annotations.toString().replace("\r\n", "\n"), ##"[@Deprecated["a"]]"##)
            case _ => @Assert(false)
        }

        decl_3 = (topLevelDecls[8] as MacroExpandDecl).getOrThrow()
        @Expect(decl_3.toString().replace("\r\n", "\n"), ##"@M_A_B(class C1 {})"##)
        @Assert(decl_3.calleeMacro.toString().replace("\r\n", "\n"), "M_A_B")
        @Assert(decl_3.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(decl_3.macroInputs) {
            case WithParens(_) => ()
            case _ => @Assert(false)
        }

        decl_4 = (topLevelDecls[9] as MacroExpandDecl).getOrThrow()
        @Expect(decl_4.toString().replace("\r\n", "\n"), ##"@M1
@Deprecated["a"]
class C1 <: C2 {
    init() {
        super()
    }
    func foo() {
        return 100
    }
}"##)
        @Assert(decl_4.calleeMacro.toString().replace("\r\n", "\n"), "M1")
        @Assert(decl_4.macroAttrs.toString().replace("\r\n", "\n"), "")
        match(decl_4.macroInputs) {
            case WithoutParens(Decl) => 
                @Assert(Decl is ClassDecl)
                @Expect(Decl.annotations.toString().replace("\r\n", "\n"), ##"[@Deprecated["a"]]"##)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testMacroExpandDeclInit01() {
        let decl = (decls[0] as MacroExpandDecl).getOrThrow()
        let macroExpandDecl = MacroExpandDecl(decl.calleeMacro, decl.macroAttrs, decl.macroInputs, annotations: decl.annotations)
        @Expect(macroExpandDecl.calleeMacro.toString().replace("\r\n", "\n"), "testMacro")
        @Expect(macroExpandDecl.macroAttrs.toString().replace("\r\n", "\n"), "public func")
        match (macroExpandDecl.macroInputs) {
            case WithoutParens(v) =>
                @Expect(v is FuncDecl)
                @Expect(v.toString().replace("\r\n", "\n"), "func a() {}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(macroExpandDecl.toString().replace("\r\n", "\n"), """
@testMacro[public func]
func a() {}""")
        var pos = macroExpandDecl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = macroExpandDecl.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = macroExpandDecl.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 23, 1, 24]).toArray())
        @Expect(macroExpandDecl.getLParenPos().isNone())
        @Expect(macroExpandDecl.getRParenPos().isNone())
        pos = macroExpandDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 2, 12]).toArray())
    }

    @TestCase
    func testMacroExpandDeclInit02() {
        let decl = (decls[1] as MacroExpandDecl).getOrThrow()
        let macroExpandDecl = MacroExpandDecl(decl.calleeMacro, decl.macroAttrs, decl.macroInputs, annotations: decl.annotations)
        @Expect(macroExpandDecl.calleeMacro.toString().replace("\r\n", "\n"), "macroPackage.testMacro")
        @Expect(macroExpandDecl.macroAttrs.toString().replace("\r\n", "\n"), "")
        match (macroExpandDecl.macroInputs) {
            case WithParens(v) => @Expect(v.toString().replace("\r\n", "\n"), "var b = 1")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(macroExpandDecl.toString().replace("\r\n", "\n"), "@macroPackage.testMacro(var b = 1)")
        var pos = macroExpandDecl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        @Expect(macroExpandDecl.getLSquarePos().isNone())
        @Expect(macroExpandDecl.getRSquarePos().isNone())
        pos = macroExpandDecl.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 24, 1, 25]).toArray())
        pos = macroExpandDecl.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 34, 1, 35]).toArray())
        pos = macroExpandDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 35]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("macro_expand_decl.cj")
        let input = String.fromUtf8(File.readFrom("macro_expand_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

