// DEPENDENCE: sourceFile/func_type.cj
// (not Windows) EXEC: dos2unix func_type.cj
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
        let node = parseFile("func_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as FuncType).getOrThrow()

        @Expect(ty.paramTypes.size, 0)
        @Expect(ty.labels.size, 0)
        @Expect(ty.retType is AtomicType)
        let priTy = (ty.retType as AtomicType).getOrThrow()
        match (priTy.kind) {
            case UnitType => ()
            case _ => @FailExpect("The primitive kind is wrong.")
        }
        @Expect(ty.toString(), "() -> Unit")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 18]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 10]).toArray())
        @Expect(ty.getCommasPos().size, 0)
        @Expect(ty.getLabelsPos().size, 0)
        @Expect(ty.getColonsPos().size, 0)
        pos = ty.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 13]).toArray())
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as FuncType).getOrThrow()

        @Expect(ty.paramTypes.size, 1)
        @Expect(ty.paramTypes[0] is AtomicType)
        @Expect(ty.paramTypes[0].toString(), "Int32")
        @Expect(ty.labels.size, 1)
        @Expect(ty.labels[0], "x")
        @Expect(ty.retType is CompositeType)
        @Expect(ty.retType.toString(), "A")
        @Expect(ty.toString(), "(x: Int32) -> A")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 23]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 17, 3, 18]).toArray())
        @Expect(ty.getCommasPos().size, 0)
        pos = ty.getLabelsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
        pos = ty.getColonsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 10, 3, 11]).toArray())
        pos = ty.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 19, 3, 21]).toArray())
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as FuncType).getOrThrow()

        @Expect(ty.paramTypes.size, 3)
        @Expect(ty.paramTypes[0] is CompositeType)
        @Expect(ty.paramTypes[1] is CompositeType)
        @Expect(ty.paramTypes[2] is TupleType)
        @Expect(ty.paramTypes[0].toString(), "A<B>")
        @Expect(ty.paramTypes[1].toString(), "T.C")
        @Expect(ty.paramTypes[2].toString(), "((String), VArray<Int64, $3>)")
        @Expect(ty.labels.size, 0)
        @Expect(ty.retType is TupleType)
        @Expect(ty.retType.toString(), "(?Int32, () -> Unit)")
        @Expect(ty.toString(), "(A<B>, T.C, ((String), VArray<Int64, $3>)) -> (?Int32, () -> Unit)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 74]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 49, 4, 50]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 13, 4, 14]).toArray())
        pos = ty.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 18, 4, 19]).toArray())
        @Expect(ty.getLabelsPos().size, 0)
        @Expect(ty.getColonsPos().size, 0)
        pos = ty.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 51, 4, 53]).toArray())
    }

    @TestCase
    func testCFunc01() {
        let varDecl = (decls[4] as VarDecl).getOrThrow()
        // CFunc<() -> Unit>
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()
        @Expect(ty.typeArguments.size, 1)
        let fnTy = (ty.typeArguments[0] as FuncType).getOrThrow()
        @Expect(fnTy.paramTypes.size, 0)
        @Expect(fnTy.retType is AtomicType)
        let priTy = (fnTy.retType as AtomicType).getOrThrow()
        match (priTy.kind) {
            case UnitType => ()
            case _ => @FailExpect("The primitive kind is wrong.")
        }
        @Expect(ty.toString(), "CFunc<() -> Unit>")

        var pos = fnTy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 24]).toArray())
        pos = fnTy.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 15]).toArray())
        pos = fnTy.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 15, 5, 16]).toArray())
        @Expect(fnTy.getCommasPos().size, 0)
        @Expect(fnTy.getLabelsPos().size, 0)
        @Expect(fnTy.getColonsPos().size, 0)
        pos = fnTy.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 17, 5, 19]).toArray())
    }

    @TestCase
    func testCFunc02() {
        let varDecl = (decls[5] as VarDecl).getOrThrow()
        // CFunc<(CPointer<Int8>) -> CPointer<Int8>>
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()
        @Expect(ty.typeArguments.size, 1)
        let fnTy = (ty.typeArguments[0] as FuncType).getOrThrow()
        @Expect(fnTy.paramTypes.size, 1)
        @Expect(fnTy.paramTypes[0] is CompositeType)
        @Expect(fnTy.paramTypes[0].toString(), "CPointer<Int8>")
        @Expect(fnTy.retType is CompositeType)
        @Expect(fnTy.retType.toString(), "CPointer<Int8>")
        @Expect(ty.toString(), "CFunc<(CPointer<Int8>) -> CPointer<Int8>>")

        var pos = fnTy.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 14, 6, 48]).toArray())
        pos = fnTy.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 14, 6, 15]).toArray())
        pos = fnTy.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 29, 6, 30]).toArray())
        @Expect(fnTy.getCommasPos().size, 0)
        @Expect(fnTy.getLabelsPos().size, 0)
        @Expect(fnTy.getColonsPos().size, 0)
        pos = fnTy.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 31, 6, 33]).toArray())
    }

    @TestCase
    func testPos01() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as FuncType).getOrThrow()

        @Expect(ty.toString(), "(a: Int64, b: Int64) -> Int64")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 47]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 37, 1, 38]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 27, 1, 28]).toArray())
        pos = ty.getLabelsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 20]).toArray())
        pos = ty.getColonsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 20, 1, 21]).toArray())
        pos = ty.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 39, 1, 41]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("func_type.cj")
        let input = String.fromUtf8(File.readFrom("func_type.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as FuncType).getOrThrow()
        let funcType = FuncType(ty.paramTypes, ty.labels, ty.retType)

        @Expect(funcType.paramTypes.size, 1)
        @Expect(funcType.paramTypes[0] is AtomicType)
        @Expect(funcType.paramTypes[0].toString(), "Int32")
        @Expect(funcType.labels.size, 1)
        @Expect(funcType.labels[0], "x")
        @Expect(funcType.retType is CompositeType)
        @Expect(funcType.retType.toString(), "A")
        @Expect(funcType.toString(), "(x: Int32) -> A")

        var pos = funcType.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 16]).toArray())
        pos = funcType.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = funcType.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 10, 1, 11]).toArray())
        @Expect(funcType.getCommasPos().size, 0)
        pos = funcType.getLabelsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
        pos = funcType.getColonsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 4]).toArray())
        pos = funcType.getArrowPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 14]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
