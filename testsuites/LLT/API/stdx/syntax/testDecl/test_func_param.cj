// DEPENDENCE: sourceFile/func_param.cj
// (not Windows) EXEC: dos2unix func_param.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var params: ?ParameterList = None
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("func_param.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let decl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        params = decl.params
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        @Expect(params.getOrThrow().toString(), 
"""
(
    a: Int64,
    b: String,
    c: (Int64) -> Int64,
    f: ?Int64,
    g: T.A,
    h: (A, Int64),
    i: VArray<Int64, $3>,
    d!: Int64,
    e!: String = ""
    )"""
    )
        let param = (params.getOrThrow().params[0] as FuncParam).getOrThrow()
        @Expect(param.name, "a")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.toString(), "a: Int64")
    }

    @TestCase
    func testType02() {
        let param = (params.getOrThrow().params[1] as FuncParam).getOrThrow()
        @Expect(param.name, "b")
        @Expect(param.typeAnnotation is CompositeType)
        @Expect(param.typeAnnotation.toString(), "String")
        @Expect(param.defaultValue.isNone())
        @Expect(param.toString(), "b: String")
    }

    @TestCase
    func testType03() {
        let param = (params.getOrThrow().params[2] as FuncParam).getOrThrow()
        @Expect(param.name, "c")
        @Expect(param.typeAnnotation is FuncType)
        @Expect(param.typeAnnotation.toString(), "(Int64) -> Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.toString(), "c: (Int64) -> Int64")
        var pos = param.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 24]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 6]).toArray())
        @Expect(param.getNotPos().isNone(), true)
        pos = param.getTypeAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 6, 4, 7]).toArray())
        pos = param.typeAnnotation.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 24]).toArray())
        @Expect(param.getAssignPos().isNone(), true)
        @Expect(param.defaultValue.isNone(), true)
    }

    @TestCase
    func testNamedParam01() {
        let param = (params.getOrThrow().params[7] as FuncParam).getOrThrow()
        @Expect(param.name, "d")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.toString(), "d!: Int64")
        var pos = param.nodePos
        @Expect(pos.fileName, "func_param.cj")
        @Expect(pos.filePath.contains("func_param.cj"))
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 9, 14]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 9, 6]).toArray())
        pos = param.getNotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 6, 9, 7]).toArray())
        pos = param.getTypeAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 7, 9, 8]).toArray())
        pos = param.typeAnnotation.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 9, 9, 14]).toArray())
        @Expect(param.getAssignPos().isNone(), true)
        @Expect(param.defaultValue.isNone(), true)
    }

    @TestCase
    func testNamedParam02() {
        let param = (params.getOrThrow().params[8] as FuncParam).getOrThrow()
        @Expect(param.name, "e")
        @Expect(param.typeAnnotation is CompositeType)
        @Expect(param.typeAnnotation.toString(), "String")
        @Expect(param.defaultValue.getOrThrow().toString(), "\"\"")
        @Expect(param.toString(), "e!: String = \"\"")
        var pos = param.nodePos
        @Expect(pos.fileName, "func_param.cj")
        @Expect(pos.filePath.contains("func_param.cj"))
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 5, 10, 20]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 5, 10, 6]).toArray())
        pos = param.getNotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 6, 10, 7]).toArray())
        pos = param.getTypeAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 7, 10, 8]).toArray())
        pos = param.typeAnnotation.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 9, 10, 15]).toArray())
        pos = param.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 16, 10, 17]).toArray())
        pos = param.defaultValue.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 18, 10, 20]).toArray())
    }

    @TestCase
    func testPrimaryInitParam01() {
        let decl = (decls[1] as ClassDecl).getOrThrow()
        let funcDecl = (decl.body.memberDecls[0] as FuncDecl).getOrThrow()
        @Expect(funcDecl.params.toString(), """
(
        a: Int64,
        b!: Int64,
        c!: Int64 = 1,
        public var d!: Int64,
        private let e!: Int64 = 3
    )""")
        let params = funcDecl.params
        let primaryParams = params.params
        var param = (primaryParams[0] as FuncParam).getOrThrow()
        @Expect(param.name, "a")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.kind.isNone())
        @Expect(param.toString(), "a: Int64")

        param = (primaryParams[3] as FuncParam).getOrThrow()
        @Expect(param.name, "d")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        var kind = param.kind.getOrThrow()
        match(kind) {
            case Var => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.modifiers.toString(), "[public]")
        @Expect(param.toString(), "public var d!: Int64")
        var pos1 = param.getVarKindKeyWordPos().getOrThrow()
        @Expect([pos1.beginLine, pos1.beginColumn, pos1.endLine, pos1.endColumn], ArrayList<Int32>([18, 16, 18, 19]).toArray())

        param = (primaryParams[4] as FuncParam).getOrThrow()
        @Expect(param.name, "e")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.getOrThrow().toString(), "3")
        kind = param.kind.getOrThrow()
        match(kind) {
            case Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.modifiers.toString(), "[private]")
        @Expect(param.toString(), "private let e!: Int64 = 3")

        var pos = params.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([14, 15, 20, 6]).toArray())
        pos = params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([14, 15, 14, 16]).toArray())
        pos = params.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([15, 17, 15, 18]).toArray())
        pos = params.getParamsCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([16, 18, 16, 19]).toArray())
        pos = params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 5, 20, 6]).toArray())
        pos = param.nodePos
        @Expect(pos.fileName, "func_param.cj")
        @Expect(pos.filePath.contains("func_param.cj"))
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 9, 19, 34]).toArray())
        pos = param.modifiers[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 9, 19, 16]).toArray())
        pos = param.getVarKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 17, 19, 20]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 21, 19, 22]).toArray())
        pos = param.getNotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 22, 19, 23]).toArray())
        pos = param.getTypeAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 23, 19, 24]).toArray())
        pos = param.typeAnnotation.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 25, 19, 30]).toArray())
        pos = param.getAssignPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 31, 19, 32]).toArray())
        pos = param.defaultValue.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 33, 19, 34]).toArray())
    }

    @TestCase
    func testParam03() {
        let funcDecl = (decls[2] as FuncDecl).getOrThrow()
        @Expect(funcDecl.params.toString(), 
        """
(  a: Int64,     b: String,
     c: Int64)"""
        )
        let primaryParams = funcDecl.params.params
        var param = (primaryParams[0] as FuncParam).getOrThrow()
        @Expect(param.name, "a")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.kind.isNone())
        @Expect(param.toString(), "a: Int64")

        param = (primaryParams[1] as FuncParam).getOrThrow()
        @Expect(param.name, "b")
        @Expect(param.typeAnnotation is CompositeType)
        @Expect(param.typeAnnotation.toString(), "String")
        @Expect(param.defaultValue.isNone())
        @Expect(param.kind.isNone())
        @Expect(param.toString(), "b: String")

        param = (primaryParams[2] as FuncParam).getOrThrow()
        @Expect(param.name, "c")
        @Expect(param.typeAnnotation is AtomicType)
        @Expect(param.typeAnnotation.toString(), "Int64")
        @Expect(param.defaultValue.isNone())
        @Expect(param.kind.isNone())
        @Expect(param.toString(), "c: Int64")

    }



    @TestCase
    func testFileToString() {
        let node = parseFile("func_param.cj")
        let input = String.fromUtf8(File.readFrom("func_param.cj"))
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
