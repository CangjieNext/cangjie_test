/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/var_decl.cj
// (not Windows) EXEC: dos2unix var_decl.cj
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
        let node = parseFile("var_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testVar01() {
        @Expect(decls[0] is VarDecl)
        let decl = (decls[0] as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), "1")
        match(decl.kind) {
            case VarKind.Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "a")
        @Expect(decl.tyAnnotation.isNone(), true)
        @Expect(decl.toString().replace("\r\n", "\n"), "let a = 1")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        let pattern = (decl.pattern as VarPattern).getOrThrow()
        @Expect(pattern.toString().replace("\r\n", "\n"), "a")
        @Expect(pattern.name, "a")
        var pos = decl.getVarKindKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
        @Expect(decl.getTyAnnotationColonPos().isNone())
        pos = decl.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 6]).toArray())
        pos = decl.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 10]).toArray())
    }

    @TestCase
    func testVar02() {
        @Expect(decls[1] is VarDecl)
        let decl = (decls[1] as VarDecl).getOrThrow()
        let ret = decl.tyAnnotation.getOrThrow()

        @Expect(decl.initializer.isNone(), true)
        match(decl.kind) {
            case VarKind.Var => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "b")
        @Expect(ret.toString().replace("\r\n", "\n"), "Int64")
        @Expect(decl.toString().replace("\r\n", "\n"), "var b: Int64")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getVarKindKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 1, 2, 4]).toArray())
        pos = decl.getTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 7]).toArray())
        pos = decl.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
        @Expect(decl.getAssignPos().isNone())
    }

    @TestCase
    func testVar03() {
        @Expect(decls[2] is VarDecl)
        let decl = (decls[2] as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()
        let ret = decl.tyAnnotation.getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), "1")
        match(decl.kind) {
            case VarKind.Const => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "c")
        @Expect(ret.toString().replace("\r\n", "\n"), "Int64")
        @Expect(decl.toString().replace("\r\n", "\n"), "const c: Int64 = 1")
        var pos = decl.getVarKindKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 1, 3, 6]).toArray())
        pos = decl.getTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = decl.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 7, 3, 8]).toArray())
        pos = decl.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 16, 3, 17]).toArray())
    }

    @TestCase
    func testVar04() {
        @Expect(decls[9] is VarDecl)
        let decl = (decls[9] as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), ##"(1, "a")"##)
        match(decl.kind) {
            case VarKind.Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "")
        @Expect(decl.toString().replace("\r\n", "\n"), ##"let (a,b) = (1, "a")"##)
        let pattern = (decl.pattern as TuplePattern).getOrThrow()
        @Expect(pattern.toString().replace("\r\n", "\n"), "(a,b)")
        @Expect(pattern.subPatterns.size, 2)
        var subPattern = (pattern.subPatterns[0] as VarPattern).getOrThrow()
        @Expect(subPattern.toString().replace("\r\n", "\n"), "a")
        @Expect(subPattern.name, "a")
        subPattern = (pattern.subPatterns[1] as VarPattern).getOrThrow()
        @Expect(subPattern.toString().replace("\r\n", "\n"), "b")
        @Expect(subPattern.name, "b")
    }

    @TestCase
    func testVar05() {
        @Expect(decls[11] is VarDecl)
        let decl = (decls[11] as VarDecl).getOrThrow()
        var pos = decl.nodePos
        @Expect(pos.fileName, "var_decl.cj")
        @Expect(pos.filePath.contains("var_decl.cj"), true)
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 1, 12, 91]).toArray())
        pos = decl.annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 1, 12, 48]).toArray())
    }

    @TestCase
    func testVar06() {
        @Expect(decls[12] is VarDecl)
        let decl = (decls[12] as VarDecl).getOrThrow()
        var pos = decl.nodePos
        @Expect(pos.fileName, "var_decl.cj")
        println(pos.filePath)
        @Expect(pos.filePath.contains("var_decl.cj"), true)
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 1, 13, 61]).toArray())
        pos = decl.annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 1, 13, 48]).toArray())
    }

    @TestCase
    func testVar07() {
        let decl = (decls[13] as VarDecl).getOrThrow()
        @Expect(decl.toString().replace("\r\n", "\n"), "public const s1: Int64 = 0")
    }

    @TestCase
    func testVar08() {
        let decl = (decls[14] as VarDecl).getOrThrow()
        @Expect(decl.toString().replace("\r\n", "\n"), "public const s1: A = 1")
    }

    @TestCase
    func testVar09() {
        @Expect(decls[15] is VarDecl)
        let decl = (decls[15] as VarDecl).getOrThrow()
        @Expect(decl.name, "")
        @Expect(decl.toString().replace("\r\n", "\n"), ##"let _ = 1"##)
        let pattern = (decl.pattern as WildcardPattern).getOrThrow()
        @Expect(pattern.toString().replace("\r\n", "\n"), "_")
    }

    @TestCase
    func testVar10() {
        @Expect(decls[16] is VarDecl)
        let decl = (decls[16] as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), "1")
        match(decl.kind) {
            case VarKind.Var => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "a")
        @Expect(decl.tyAnnotation.isNone(), true)
        @Expect(decl.toString().replace("\r\n", "\n"), "var a = 1")
        let pattern = (decl.pattern as VarPattern).getOrThrow()
        @Expect(pattern.toString().replace("\r\n", "\n"), "a")
        @Expect(pattern.name, "a")
        var pos = decl.getVarKindKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 1, 17, 4]).toArray())
        @Expect(decl.getTyAnnotationColonPos().isNone())
        pos = decl.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 5, 17, 6]).toArray())
        pos = decl.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 7, 17, 8]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 1, 17, 10]).toArray())
    }

    @TestCase
    func testVarDeclInit01() {
        let decl = (decls[2] as VarDecl).getOrThrow()
        let varDecl = VarDecl(decl.initializer, decl.kind, decl.name, decl.pattern, decl.tyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        let initializer = (varDecl.initializer).getOrThrow()
        let ret = varDecl.tyAnnotation.getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), "1")
        match(varDecl.kind) {
            case VarKind.Const => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(varDecl.name, "c")
        @Expect(ret.toString().replace("\r\n", "\n"), "Int64")
        @Expect(varDecl.toString().replace("\r\n", "\n"), "const c: Int64 = 1")
        var pos = varDecl.getVarKindKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = varDecl.getTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
        pos = varDecl.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        pos = varDecl.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 16, 1, 17]).toArray())
    }

    @TestCase
    func testVarDeclInit02() {
        let decl = (decls[0] as VarDecl).getOrThrow()
        let varDecl = VarDecl(decl.initializer, decl.kind, decl.name, decl.pattern, decl.tyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        let initializer = (varDecl.initializer).getOrThrow()

        @Expect(initializer.toString().replace("\r\n", "\n"), "1")
        match(varDecl.kind) {
            case VarKind.Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(varDecl.name, "a")
        @Expect(varDecl.tyAnnotation.isNone(), true)
        @Expect(varDecl.toString().replace("\r\n", "\n"), "let a = 1")
        let pattern = (varDecl.pattern as VarPattern).getOrThrow()
        @Expect(pattern.toString().replace("\r\n", "\n"), "a")
        @Expect(pattern.name, "a")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("var_decl.cj")
        let input = String.fromUtf8(File.readFrom("var_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

