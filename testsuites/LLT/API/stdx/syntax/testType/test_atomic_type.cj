// DEPENDENCE: sourceFile/atomic_type.cj
// (not Windows) EXEC: dos2unix atomic_type.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readTypes(): Unit {
        let node = parseFile("atomic_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case Int16Type => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "Int16")
        @Expect(ty.toTokens().toString(), "Int16")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 13]).toArray())
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case UIntNativeType => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "UIntNative")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 18]).toArray())
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case RuneType => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "Rune")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 12]).toArray())
    }

    @TestCase
    func testType04() {
        let varDecl = (decls[4] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case BoolType => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "Bool")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 12]).toArray())
    }

    @TestCase
    func testType05() {
        let varDecl = (decls[5] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case UnitType => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "Unit")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 8, 6, 12]).toArray())
    }

    @TestCase
    func testType06() {
        let classDecl = (decls[6] as ClassDecl).getOrThrow()
        let funcDecl = (classDecl.body.memberDecls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case ThisType => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "This")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 15, 8, 19]).toArray())
    }

    @TestCase
    func testType07() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as AtomicType).getOrThrow()

        match (ty.kind) {
            case Int16Type => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(ty.toString(), "Int16")
        let pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 23]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("atomic_type.cj")
        let input = String.fromUtf8(File.readFrom("atomic_type.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as AtomicType).getOrThrow()
        let atomicType = AtomicType(ty.kind)

        match (atomicType.kind) {
            case Int16Type => ()
            case _ => @FailExpect("The atomic kind is wrong.")
        }
        @Expect(atomicType.toString(), "Int16")
        let pos = atomicType.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
