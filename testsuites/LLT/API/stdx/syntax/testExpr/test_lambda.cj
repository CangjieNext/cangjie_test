// DEPENDENCE: sourceFile/lambda.cj
// (not Windows) EXEC: dos2unix lambda.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var nodes: Array<SyntaxTreeNode> = []

    @BeforeAll
    func readNodes(): Unit {
        let node = parseFile("lambda.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.params.size, 0)
        @Expect(expr.body.size, 1)
        @Expect(expr.body[0].toString(), "1")
        @Expect(expr.toString(), "{ => 1 }")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
        pos = expr.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 12, 2, 13]).toArray())
        pos = expr.getDoubleArrowPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 7, 2, 9]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 13]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.params.size, 1)
        let param = (params.params[0] as LambdaParam).getOrThrow()
        @Expect(params.params[0].toString(), "a: Int64")
        @Expect(expr.body.size, 1)
        @Expect(expr.body[0].toString(), "1")
        @Expect(expr.toString(), "{ a: Int64 => 1 }")
        var pos = expr.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        pos = expr.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 21, 3, 22]).toArray())
        pos = expr.getDoubleArrowPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 16, 3, 18]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 7, 3, 8]).toArray())
        pos = param.getTypeAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        @Expect(param.typeAnnotation.getOrThrow().toString(), "Int64")
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.params.size, 2)
        @Expect(params.toString(), "a: (Int64, (Int64)), b: A")
        @Expect(params.params[0].toString(), "a: (Int64, (Int64))")
        @Expect(params.params[1].toString(), "b: A")
        @Expect(expr.body.size, 2)
        @Expect(expr.body[0].toString(), "let c = a * b")
        @Expect(expr.body[1].toString(), "return c")
        @Expect(expr.toString(), #"{ a: (Int64, (Int64)), b: A => let c = a * b
                                   return c }"#)
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 6]).toArray())
        pos = expr.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 45, 5, 46]).toArray())
        pos = expr.getDoubleArrowPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 33, 4, 35]).toArray())
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[7] as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.toString(), "a")
        @Expect(params.getParamsLParenPos().isNone(), true)
        @Expect(params.getParamsCommasPos().size, 0)
        @Expect(params.getParamsRParenPos().isNone(), true)
        @Expect(params.toString(), "a")
        @Expect(params.params.size, 1)
        let param = (params.params[0] as LambdaParam).getOrThrow()
        @Expect(param.toString(), "a")
        @Expect(expr.body.size, 1)
        @Expect(expr.body[0].toString(), "a + 1")
        @Expect(expr.toString(), #"{ a => a + 1 }"#)
        var pos = expr.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 5, 10, 6]).toArray())
        pos = expr.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 18, 10, 19]).toArray())
        pos = expr.getDoubleArrowPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 9, 10, 11]).toArray())
        pos = param.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 7, 10, 8]).toArray())
        @Expect(param.getTypeAnnotationColonPos().isNone(), true)
        @Expect(param.typeAnnotation.isNone(), true)
    }

    @TestCase
    func testLambdaInit() {
        let expr = (nodes[7] as Lambda).getOrThrow()
        let lambdaExpr = Lambda(expr.body, expr.params)
        let params = lambdaExpr.params
        @Expect(params.toString(), "a")
        @Expect(params.getParamsLParenPos().isNone(), true)
        @Expect(params.getParamsCommasPos().size, 0)
        @Expect(params.getParamsRParenPos().isNone(), true)
        @Expect(params.toString(), "a")
        @Expect(params.params.size, 1)
        let param = (params.params[0] as LambdaParam).getOrThrow()
        let lambdaParam = LambdaParam(param.name, param.typeAnnotation)
        @Expect(lambdaParam.toString(), "a")
        @Expect(lambdaExpr.body.size, 1)
        @Expect(lambdaExpr.body[0].toString(), "a + 1")
        @Expect(lambdaExpr.toString(), #"{ a => a + 1 }"#)
        var pos = lambdaExpr.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = lambdaExpr.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = lambdaExpr.getDoubleArrowPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 7]).toArray())
        pos = lambdaParam.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        @Expect(lambdaParam.getTypeAnnotationColonPos().isNone(), true)
        @Expect(lambdaParam.typeAnnotation.isNone(), true)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("lambda.cj")
        let input = String.fromUtf8(File.readFrom("lambda.cj"))
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
