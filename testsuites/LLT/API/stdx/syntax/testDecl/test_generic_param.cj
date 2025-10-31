// DEPENDENCE: sourceFile/generic_param.cj
// (not Windows) EXEC: dos2unix generic_param.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var params: Array<GenericParam> = []
    var funcDecl: ?FuncDecl = None

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("generic_param.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        params = funcDecl.getOrThrow().genericParams
    }

    @TestCase
    func test01() {
        @Expect(params.size, 2)
        @Expect(params[0].name, "T1")
        @Expect(params[0].toString(), "T1")

        @Expect(params[1].name, "T2")
        @Expect(params[1].toString(), "T2")

        let decl = funcDecl.getOrThrow()
        var pos = decl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = decl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 17, 1, 18]).toArray())
        pos = decl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 21, 1, 22]).toArray())
        pos = params[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 15, 1, 17]).toArray())
        pos = params[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 21]).toArray())
    }

    @TestCase
    func testGenericParamInit() {
        @Expect(params.size, 2)
        var genericParam = GenericParam(params[0].name, annotations: params[0].annotations, modifiers: params[0].modifiers)
        @Expect(genericParam.name, "T1")
        @Expect(genericParam.toString(), "T1")
        genericParam = GenericParam(params[1].name, annotations: params[1].annotations, modifiers: params[1].modifiers)
        @Expect(genericParam.name, "T2")
        @Expect(genericParam.toString(), "T2")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("generic_param.cj")
        let input = String.fromUtf8(File.readFrom("generic_param.cj"))
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
