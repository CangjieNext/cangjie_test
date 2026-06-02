/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/type_alias.cj
// (not Windows) EXEC: dos2unix type_alias.cj
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
        let node = parseFile("type_alias.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as TypeAlias).getOrThrow()
        @Expect(decl.aliasName, "NewType")
        @Expect(decl.typeParameters.size, 0)
        @Expect(decl.originalTyAnnotation.toString().replace("\r\n", "\n"), "Int64")
        @Expect(decl.toString().replace("\r\n", "\n"), "type NewType = Int64")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getTypeAliasKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 13]).toArray())
        pos = decl.getAssignPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 21]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as TypeAlias).getOrThrow()
        @Expect(decl.aliasName, "NewType")
        @Expect(decl.typeParameters.size, 2)
        @Expect(decl.typeParameters[0].toString().replace("\r\n", "\n"), "S")
        @Expect(decl.typeParameters[1].toString().replace("\r\n", "\n"), "T")
        @Expect(decl.originalTyAnnotation.toString().replace("\r\n", "\n"), "packageName.className<S, T>")
        @Expect(decl.toString().replace("\r\n", "\n"), "type NewType<S, T> = packageName.className<S, T>")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getTypeAliasKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 1, 2, 5]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 13]).toArray())
        pos = decl.getAssignPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 20, 2, 21]).toArray())
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[8] as TypeAlias).getOrThrow()
        var pos = decl.nodePos
        @Expect(pos.fileName, "type_alias.cj")
        @Expect(pos.filePath.contains("type_alias.cj"), true)
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 1, 9, 65]).toArray())
        pos = decl.annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 1, 9, 48]).toArray())
    }

    @TestCase
    func testTypeAliasInit() {
        let decl = (decls[1] as TypeAlias).getOrThrow()
        let typeAlias = TypeAlias(decl.aliasName, decl.originalTyAnnotation, decl.typeParameters, modifiers: decl.modifiers)
        @Expect(typeAlias.aliasName, "NewType")
        @Expect(typeAlias.typeParameters.size, 2)
        @Expect(typeAlias.typeParameters[0].toString().replace("\r\n", "\n"), "S")
        @Expect(typeAlias.typeParameters[1].toString().replace("\r\n", "\n"), "T")
        @Expect(typeAlias.originalTyAnnotation.toString().replace("\r\n", "\n"), "packageName.className<S, T>")
        @Expect(typeAlias.toString().replace("\r\n", "\n"), "type NewType<S, T> = packageName.className<S, T>")
        var pos = typeAlias.getTypeAliasKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = typeAlias.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 13]).toArray())
        pos = typeAlias.getAssignPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 20, 1, 21]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("type_alias.cj")
        let input = String.fromUtf8(File.readFrom("type_alias.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

