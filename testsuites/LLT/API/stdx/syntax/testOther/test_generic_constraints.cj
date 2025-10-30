// DEPENDENCE: sourceFile/generic_constraints.cj
// (not Windows) EXEC: dos2unix generic_constraints.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("generic_constraints.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func test01() {
        let decl = (decls[0] as FuncDecl).getOrThrow()
        let gcs = decl.genericConstraints.getOrThrow()
        @Expect(gcs.constraints.size, 1)
        @Expect(gcs.toString(), "where T<: ToString")
        @Expect(gcs.toTokens().toString(), "where T <: ToString")

        let gc = gcs.constraints[0]
        @Expect(gc.typeArgument.toString(), "T")
        @Expect(gc.upperBounds.size, 1)
        @Expect(gc.upperBounds[0].toString(), "ToString")
    }

    @TestCase
    func test02() {
        let decl = (decls[1] as FuncDecl).getOrThrow()
        let gcs = decl.genericConstraints.getOrThrow()
        @Expect(gcs.constraints.size, 2)
        @Expect(gcs.toString(), "where T1 <:ToString, T2 <: ToString")

        let gc1 = gcs.constraints[0]
        @Expect(gc1.typeArgument.toString(), "T1")
        @Expect(gc1.upperBounds.size, 1)
        @Expect(gc1.upperBounds[0].toString(), "ToString")

        let gc2 = gcs.constraints[1]
        @Expect(gc2.typeArgument.toString(), "T2")
        @Expect(gc2.upperBounds.size, 1)
        @Expect(gc2.upperBounds[0].toString(), "ToString")
    }

    @TestCase
    func test03() {
        let decl = (decls[2] as FuncDecl).getOrThrow()
        let gcs = decl.genericConstraints.getOrThrow()
        @Expect(gcs.constraints.size, 2)
        @Expect(gcs.toString(), "where T1 <:ToString & Equatable<Int32>, T2 <: ToString")

        let gc1 = gcs.constraints[0]
        @Expect(gc1.typeArgument.toString(), "T1")
        @Expect(gc1.upperBounds.size, 2)
        @Expect(gc1.upperBounds[0].toString(), "ToString")
        @Expect(gc1.upperBounds[1].toString(), "Equatable<Int32>")

        let gc2 = gcs.constraints[1]
        @Expect(gc2.typeArgument.toString(), "T2")
        @Expect(gc2.upperBounds.size, 1)
        @Expect(gc2.upperBounds[0].toString(), "ToString")
    }

    @TestCase
    func testGenericConstraintsInit() {
        let decl = (decls[2] as FuncDecl).getOrThrow()
        let gcs = decl.genericConstraints.getOrThrow()
        let genericConstraints = GenericConstraints(gcs.constraints)
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.toString(), "where T1 <:ToString & Equatable<Int32>, T2 <: ToString")

        let gc1 = genericConstraints.constraints[0]
        var genConstraint = GenericConstraint(gc1.typeArgument, gc1.upperBounds)
        @Expect(genConstraint.typeArgument.toString(), "T1")
        @Expect(genConstraint.upperBounds.size, 2)
        @Expect(genConstraint.upperBounds[0].toString(), "ToString")
        @Expect(genConstraint.upperBounds[1].toString(), "Equatable<Int32>")

        let gc2 = genericConstraints.constraints[1]
        genConstraint = GenericConstraint(gc2.typeArgument, gc2.upperBounds)
        @Expect(genConstraint.typeArgument.toString(), "T2")
        @Expect(genConstraint.upperBounds.size, 1)
        @Expect(genConstraint.upperBounds[0].toString(), "ToString")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("generic_constraints.cj")
        let input = String.fromUtf8(File.readFrom("generic_constraints.cj"))
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
