// DEPENDENCE: sourceFile/func_decl.cj
// (not Windows) EXEC: dos2unix func_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.unittest.testmacro.*
import std.collection.ArrayList

@Test
class Test {
    var file: ?SourceFile = None
    var decls: Array<Decl> = []

    @BeforeAll
    func readInput(): Unit {
        let node = parseFile("func_decl.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let classDecl = (file.getOrThrow().topLevelDecls[1] as ClassDecl).getOrThrow()
        decls = classDecl.body.memberDecls
    }

    @TestCase
    func TestCase01(): Unit {
        let funcDecl = (file.getOrThrow().topLevelDecls[0] as FuncDecl).getOrThrow()
        @Expect(funcDecl.name, "b")
        let paramList = funcDecl.params
        @Expect(paramList.toString(), "(param1: Int64)")
        @Expect(paramList.params.size, 1)
        let param = (paramList.params[0] as FuncParam).getOrThrow()
        @Expect(param.name, "param1")
        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 5, 2]).toArray())
        pos = funcDecl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = funcDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        pos = paramList.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 22]).toArray())
        pos = param.nodePos
        pos = paramList.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        pos = param.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 21]).toArray())
        pos = paramList.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 21, 1, 22]).toArray())
        pos = funcDecl.getRetTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 22, 1, 23]).toArray())
        pos = funcDecl.retTyAnnotation.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 24, 1, 29]).toArray())  
        pos = funcDecl.body.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 30, 5, 2]).toArray())
        pos = funcDecl.body.getOrThrow().getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 30, 1, 31]).toArray())
        pos = funcDecl.body.getOrThrow().getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 1, 5, 2]).toArray())
        match (funcDecl.kind) {
            case Normal => ()
            case _ => @FailExpect("kind wrong")
        }
        let retTy = (funcDecl.retTyAnnotation).getOrThrow()
        let retType = (retTy as AtomicType).getOrThrow()
        match (retType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        let body = funcDecl.body.getOrThrow()
        @Expect(body.nodes.size, 3)
        @Expect((body.nodes[0] as LitConstExpr).getOrThrow().rawValue, "1")
        @Expect((body.nodes[2] as LitConstExpr).getOrThrow().rawValue, "a")
    }

    @TestCase
    func testCase02(): Unit {
        let decl = (decls[0] as FuncDecl).getOrThrow()
        @Expect(decl.name, "A")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.params.params.size, 0)
        @Expect(decl.retTyAnnotation.isNone())
        if (let Some(body) <- decl.body) {
            @Expect(body.toString(), "{}")
        }
        match (decl.kind) {
            case PrimaryConstructor => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString(), "public A() {}")
        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 18]).toArray())
        @Expect(decl.getFuncKindKeyWordPos().isNone(), true)
        @Expect(decl.getFuncKeyWordPos().isNone(), true)
        pos = decl.modifiers[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 11]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 12, 8, 13]).toArray())
    }

    @TestCase
    func testCase03(): Unit {
        let decl = (decls[1] as FuncDecl).getOrThrow()
        @Expect(decl.name, "init")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.params.params.size, 1)
        @Expect(decl.retTyAnnotation.isNone())
        if (let Some(body) <- decl.body) {
            @Expect(body.toString(), """
{
        println(a)
    }""")
        }
        match (decl.kind) {
            case Constructor => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString(), """
public init(a: A) {
        println(a)
    }""")
        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 11, 6]).toArray())
        @Expect(decl.getFuncKindKeyWordPos().isNone(), true)
        @Expect(decl.getFuncKeyWordPos().isNone(), true)
        pos = decl.modifiers[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 9, 11]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 12, 9, 16]).toArray())
    }

    @TestCase
    func testCase04(): Unit {
        let decl = (decls[2] as FuncDecl).getOrThrow()
        @Expect(decl.name, "+")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.params.params.size, 1)
        if (let Some(retTyAnnotation) <- decl.retTyAnnotation) {
            @Expect(retTyAnnotation.toString(), "A")
        }
        if (let Some(body) <- decl.body) {
            @Expect(body.toString(), """
{
        right
    }""")
        }
        match (decl.kind) {
            case Operator => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString(), """
public operator func +(right: A): A {
        right
    }""")
        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 5, 14, 6]).toArray())
        pos = decl.modifiers[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 5, 12, 11]).toArray())
        pos = decl.modifiers[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 12, 12, 20]).toArray())
        pos = decl.getFuncKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 12, 12, 20]).toArray())
        pos = decl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 21, 12, 25]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 26, 12, 27]).toArray())
    }

    @TestCase
    func testCase05(): Unit {
        let decl = (decls[3] as FuncDecl).getOrThrow()
        @Expect(decl.name, "function")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.params.params.size, 0)
        if (let Some(body) <- decl.body) {
            @Expect(body.toString(), "{}")
        }
        @Expect(decl.modifiers.size, 2)
        match (decl.modifiers[0].kind) {
            case Public => ()
            case _ => @FailExpect("kind wrong")
        }
        match (decl.modifiers[1].kind) {
            case Open => ()
            case _ => @FailExpect("kind wrong")
        }
        match (decl.kind) {
            case Normal => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString(), "public open func function(): Unit {}")
    }

    @TestCase
    func testCase06(): Unit {
        let decl = (decls[4] as FuncDecl).getOrThrow()
        let paramList = decl.params
        @Expect(decl.name, "~init")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(paramList.params.size, 0)
        @Expect(decl.retTyAnnotation.isNone())
        if (let Some(body) <- decl.body) {
            @Expect(body.toString(), "{}")
        }
        match (decl.kind) {
            case Finalizer => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString(), "~ init() {}")
        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 5, 17, 16]).toArray())
        pos = decl.getFuncKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 5, 17, 6]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 7, 17, 11]).toArray())
        pos = paramList.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 11, 17, 12]).toArray())
        pos = paramList.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([17, 12, 17, 13]).toArray())
    }

    @TestCase
    func TestCase07(): Unit {
        let funcDecl = (file.getOrThrow().topLevelDecls[2] as FuncDecl).getOrThrow()
        @Expect(funcDecl.name, "c")
        let paramList = funcDecl.params
        @Expect(paramList.params.size, 1)
        @Expect((paramList.params[0] as FuncParam).getOrThrow().name, "param1")
        match (funcDecl.kind) {
            case Normal => ()
            case _ => @FailExpect("kind wrong")
        }
        let retTy = (funcDecl.retTyAnnotation).getOrThrow()
        let retType = (retTy as AtomicType).getOrThrow()
        match (retType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        let genericConstraints = funcDecl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString(), "T <: A<S>")
        @Expect(genericConstraints.constraints[1].toString(), "S <: ToString & B")

        var pos = genericConstraints.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 36, 20, 70]).toArray())
        pos = genericConstraints.getWhereKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 36, 20, 41]).toArray())
        pos = genericConstraints.constraints[0].getUpperBoundPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 44, 20, 46]).toArray())
        pos = genericConstraints.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 51, 20, 52]).toArray())
        pos = genericConstraints.constraints[1].getUpperBoundPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 55, 20, 57]).toArray())
        pos = genericConstraints.constraints[1].getBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 67, 20, 68]).toArray())

        let body = funcDecl.body.getOrThrow()
        @Expect(body.nodes.size, 0)
        @Expect(funcDecl.toString(), "func c<T, S>(param1: Int64): Int64 where T <: A<S>, S <: ToString & B {}")
    }

    @TestCase
    func TestCase08(): Unit {
        let funcDecl = (file.getOrThrow().topLevelDecls[3] as FuncDecl).getOrThrow()
        @Expect(funcDecl.name, "a")
        @Expect(funcDecl.params.params.size, 0)
        match (funcDecl.kind) {
            case Normal => ()
            case _ => @FailExpect("kind wrong")
        }
        let body = funcDecl.body.getOrThrow()
        @Expect(body.nodes.size, 1)
        @Expect((body.nodes[0] as UnsafeExpr).getOrThrow().toString(), "unsafe {println()}")
        @Expect(funcDecl.toString(), """
func a() {
    unsafe {println()}
}""")
    }

    @TestCase
    func TestCase09(): Unit {
        let funcDecl = (file.getOrThrow().topLevelDecls[4] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Foreign => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "foo")
        @Expect(funcDecl.params.toString(), "()")

        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 1, 26, 26]).toArray())
        pos = funcDecl.getFuncKindKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 1, 26, 8]).toArray())
        pos = funcDecl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 9, 26, 13]).toArray())
        pos = funcDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 14, 26, 17]).toArray())
        pos = funcDecl.params.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 17, 26, 19]).toArray())
        pos = funcDecl.params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 17, 26, 18]).toArray())
        pos = funcDecl.params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 18, 26, 19]).toArray())
        pos = funcDecl.getRetTyAnnotationColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 19, 26, 20]).toArray())
        pos = funcDecl.retTyAnnotation.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 21, 26, 26]).toArray())
        @Expect(funcDecl.toString(), """
foreign func foo(): Int64""")
    }

    @TestCase
    func TestCase10(): Unit {
        let funcDecl = (file.getOrThrow().topLevelDecls[5] as FuncDecl).getOrThrow()
        match (funcDecl.kind) {
            case Normal => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(funcDecl.name, "func_1")
        @Expect(funcDecl.modifiers.size, 1)
        @Expect(funcDecl.modifiers.toString(), "[const]")

        var pos = funcDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 1, 28, 23]).toArray())
        pos = funcDecl.getFuncKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 7, 28, 11]).toArray())
        pos = funcDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 12, 28, 18]).toArray())
        pos = funcDecl.params.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 18, 28, 19]).toArray())
        pos = funcDecl.params.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 19, 28, 20]).toArray())
        @Expect(funcDecl.toString(), "const func func_1() {}")
    }

    @TestCase
    func TestCase11(): Unit {
        let classDecl = (file.getOrThrow().topLevelDecls[6] as ClassDecl).getOrThrow()
        let decls = classDecl.body.memberDecls
        let decl = (decls[0] as FuncDecl).getOrThrow()

        @Expect(decl.name, "init")
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.modifiers.toString(), "[const]")

        var pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([31, 5, 33, 6]).toArray())
        @Expect(decl.getFuncKindKeyWordPos().isNone(), true)
        @Expect(decl.getFuncKeyWordPos().isNone(), true)
        pos = decl.modifiers[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([31, 5, 31, 10]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([31, 11, 31, 15]).toArray())
        @Expect(decl.toString(), ##"const init(b: B) {
        println(b)
    }"##)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("func_decl.cj")
        let input = String.fromUtf8(File.readFrom("func_decl.cj"))
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
