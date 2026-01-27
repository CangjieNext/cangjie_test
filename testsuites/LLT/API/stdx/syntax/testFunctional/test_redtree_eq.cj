/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_eq_hash_input.cj
// (not Windows) EXEC: dos2unix test_eq_hash_input.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.{ArrayList, HashSet}

@Test
class Test {
    var files = ArrayList<SourceFile>()

    @BeforeAll
    func readSourceFile(): Unit {
        let node0 = parseFile("test_eq_hash_input.cj")
        let node1 = parseFile("test_eq_hash_input.cj")
        files.add((node0.node.getOrThrow() as SourceFile).getOrThrow())
        files.add((node1.node.getOrThrow() as SourceFile).getOrThrow())
    }

    @TestCase
    func PackageHeaderTest() {
        let header0 = files[0].pkgHeader.getOrThrow()
        let header1 = files[1].pkgHeader.getOrThrow()
        @Expect((header0 == header1), false)
        @Expect((header0 == header0), true)
    }

    @TestCase
    func ImportContentTest() {
        let content0 = files[0].importLists[0]
        let content1 = files[1].importLists[0]
        @Expect((content0 == content1), false)
        @Expect((content0 == content0), true)
    }

    @TestCase
    func FuncDeclTest() {
        let funcDecl0 = (files[0].topLevelDecls[0] as FuncDecl).getOrThrow()
        let funcDecl1 = (files[1].topLevelDecls[0] as FuncDecl).getOrThrow()
        @Expect((funcDecl0 == funcDecl1), false)
        @Expect((funcDecl0 == funcDecl0), true)
    }

    @TestCase
    func GenericConstraintTest() {
        let funcDecl0 = (files[0].topLevelDecls[0] as FuncDecl).getOrThrow()
        let funcDecl1 = (files[1].topLevelDecls[0] as FuncDecl).getOrThrow()
        let gcs0 = funcDecl0.genericConstraints.getOrThrow()
        let gcs1 = funcDecl1.genericConstraints.getOrThrow()
        @Expect(gcs0.constraints.size, 1)
        @Expect(gcs1.constraints.size, 1)
        @Expect(gcs0.toString().replace("\r\n", "\n"), "where T <: ToString")
        @Expect(gcs1.toString().replace("\r\n", "\n"), "where T <: ToString")
        @Expect((gcs0 == gcs1), false)
        @Expect((gcs0 == gcs0), true)
    }

    @TestCase
    func ArrayLiteralTest() {
        let funcDecl0 = (files[0].topLevelDecls[0] as FuncDecl).getOrThrow()
        let funcDecl1 = (files[1].topLevelDecls[0] as FuncDecl).getOrThrow()
        let varDecl0 = (funcDecl0.body.getOrThrow().nodes[0] as VarDecl).getOrThrow()
        let varDecl1 = (funcDecl1.body.getOrThrow().nodes[0] as VarDecl).getOrThrow()
        let arrayLiteral0 = (varDecl0.initializer.getOrThrow() as ArrayLiteral).getOrThrow()
        let arrayLiteral1 = (varDecl1.initializer.getOrThrow() as ArrayLiteral).getOrThrow()
        @Expect((arrayLiteral0 == arrayLiteral1), false)
        @Expect((arrayLiteral0 == arrayLiteral0), true)
    }

    @TestCase
    func FuncTypeTest() {
        let funcDecl0 = (files[0].topLevelDecls[0] as FuncDecl).getOrThrow()
        let funcDecl1 = (files[1].topLevelDecls[0] as FuncDecl).getOrThrow()
        let varDecl0 = (funcDecl0.body.getOrThrow().nodes[1] as VarDecl).getOrThrow()
        let varDecl1 = (funcDecl1.body.getOrThrow().nodes[1] as VarDecl).getOrThrow()
        let funcType0 = (varDecl0.tyAnnotation.getOrThrow() as FuncType).getOrThrow()
        let funcType1 = (varDecl1.tyAnnotation.getOrThrow() as FuncType).getOrThrow()
        @Expect((funcType0 == funcType1), false)
        @Expect((funcType0 == funcType0), true)
    }

    @TestCase
    func ConstPatternTest() {
        let funcDecl0 = (files[0].topLevelDecls[0] as FuncDecl).getOrThrow()
        let funcDecl1 = (files[1].topLevelDecls[0] as FuncDecl).getOrThrow()
        let varDecl0 = (funcDecl0.body.getOrThrow().nodes[2] as VarDecl).getOrThrow()
        let varDecl1 = (funcDecl1.body.getOrThrow().nodes[2] as VarDecl).getOrThrow()
        let matchExpr0 = (varDecl0.initializer.getOrThrow() as MatchExpr).getOrThrow()
        let matchExpr1 = (varDecl1.initializer.getOrThrow() as MatchExpr).getOrThrow()
        let constPattern0 = (matchExpr0.matchCases[0].patterns[0] as ConstPattern).getOrThrow()
        let constPattern1 = (matchExpr1.matchCases[0].patterns[0] as ConstPattern).getOrThrow()
        @Expect((constPattern0 == constPattern1), false)
        @Expect((constPattern0 == constPattern0), true)
    }
}