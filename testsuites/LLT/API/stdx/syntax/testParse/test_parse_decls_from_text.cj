// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.ArrayList

@Test
class Test {
    @TestCase
    func testVarDecl() {
        let node = parseText("let a = 1")
        let decl = (node.node.getOrThrow().getOrThrow() as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()

        @Expect(initializer.toString(), "1")
        match(decl.kind) {
            case VarKind.Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "a")
        @Expect(decl.tyAnnotation.isNone(), true)
        @Expect(decl.toString(), "let a = 1")
        let pattern = (decl.pattern as VarPattern).getOrThrow()
        @Expect(pattern.toString(), "a")
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

        let text = #"@Deprecated["This API will be deprecated soon"] let (a, b): (Int64, String) = (1, "hello")"#
        let decl_1 = (parseText(text).node.getOrThrow().getOrThrow() as VarDecl).getOrThrow()
        @Expect(decl_1.toString(), text)
    }

    @TestCase
    func testTypeAlias02() {
        let text = "type NewType<S, T> = packageName.className<S, T>"
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as TypeAlias).getOrThrow()
        @Expect(decl.aliasName, "NewType")
        @Expect(decl.typeParameters.size, 2)
        @Expect(decl.typeParameters[0].toString(), "S")
        @Expect(decl.typeParameters[1].toString(), "T")
        @Expect(decl.originalTyAnnotation.toString(), "packageName.className<S, T>")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func testStructDecl06() {
        let text = """
struct F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func testStaticInit() {
        let text = """
static init() {
        a = 1
        println()
    }"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as StaticInit).getOrThrow()
        @Expect(decl.body.toString(), """
{
        a = 1
        println()
    }""")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func testPropDecl02() {
        let text = """
mut prop b: Int64 {
        get() {
            1
        }
        set(v) {
            println(v)
        }
    }"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as PropDecl).getOrThrow()
        @Expect(decl.name, "b")
        @Expect(decl.tyAnnotation.toString(), "Int64")
        let getter = decl.getter.getOrThrow()
        @Expect(getter.identifier.isNone())
        @Expect(getter.isGetter, true)
        @Expect(getter.block.toString(), """
{
            1
        }""")
        @Expect(getter.toString(), """
get() {
            1
        }""")
        let setter = decl.setter.getOrThrow()
        @Expect(setter.identifier.getOrThrow().toString(), "v")
        @Expect(setter.isGetter, false)
        @Expect(setter.block.toString(), """
{
            println(v)
        }""")
        @Expect(setter.toString(), """
set(v) {
            println(v)
        }""")
        @Expect(decl.toString(), text)
        @Expect(getter.getSetKeyWordPos().isNone())
        @Expect(getter.getIdentifierPos().isNone())
        @Expect(setter.getGetKeyWordPos().isNone())
    }

    @TestCase
    func testMainDecl02() {
        let text = """
main(param1: Int64, param2: Int64): Int64 {
    1
    1 + 1
    "a"
    0
}"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as MainDecl).getOrThrow()
        let ret = decl.retTyAnnotation.getOrThrow()
        let params = decl.params

        @Expect(decl.body.nodes.size, 4)
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "param1: Int64")
        @Expect(params.params[1].toString(), "param2: Int64")
        @Expect(ret is AtomicType)
        @Expect(ret.toString(), "Int64")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func testMacroExpandParam01() {
        let decl = (parseText("func function(@testMacro[public func]a: Int64, @macroPackage.testMacro(b!: Int64)){}").node.getOrThrow().getOrThrow() as FuncDecl).getOrThrow()
        let param = (decl.params.params[0] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "testMacro")
        @Expect(param.macroAttrs.toString(), "public func")
        match(param.macroInputs) {
            case WithoutParens(v) => @Expect(v.toString(), "a: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@testMacro[public func]a: Int64")
        @Expect(param.getLParenPos().isNone())
        @Expect(param.getRParenPos().isNone())
    }

    @TestCase
    func testMacroDecl02() {
        let text = "public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }"
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as MacroDecl).getOrThrow()
        @Expect(decl.name, "testMacro")
        let params = decl.params
        @Expect(params.toString(), "(a: Tokens, b: Tokens)")
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "a: Tokens")
        @Expect(params.params[1].toString(), "b: Tokens")
        @Expect(decl.retTyAnnotation.getOrThrow().toString(), "Tokens")
        @Expect(decl.body.toString(), "{ return quote() }")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func test_InterfaceDecl_01() {
        let text = ##"@Deprecated["aaa"]
    public interface I1<T> <: S1<T> where T <: I2<T> {
        static mut prop p1: Int64
        func foo(): Int64
    }"##
        let res = parseText(text)
        var diags = res.diags
        @Assert(diags.size, 0)

        var interfaceDecl: InterfaceDecl = (res.node.getOrThrow().getOrThrow() as InterfaceDecl).getOrThrow()
        @Expect(interfaceDecl.toString(), text)
        @Assert(interfaceDecl.body.memberDecls.size, 2)
        @Assert(interfaceDecl.body.memberDecls[0] is PropDecl)
        @Assert(interfaceDecl.body.memberDecls[0].toString(), ##"static mut prop p1: Int64"##)
        @Assert(interfaceDecl.body.memberDecls[1] is FuncDecl)
        @Assert(interfaceDecl.body.memberDecls[1].toString(), ##"func foo(): Int64"##)

        @Assert(interfaceDecl.name, "I1")
        @Assert(interfaceDecl.genericConstraints.isSome())
        @Assert(interfaceDecl.genericConstraints.getOrThrow().toString(), "where T <: I2<T>")
        @Assert(interfaceDecl.genericParams.size, 1)
        @Assert(interfaceDecl.genericParams[0].toString(), "T")
        @Assert(interfaceDecl.superTyAnnotations.size, 1)
        @Assert(interfaceDecl.superTyAnnotations[0].toString(), "S1<T>")
        @Assert(interfaceDecl.annotations.size, 1)
        @Assert(interfaceDecl.annotations[0].toString(), ##"@Deprecated["aaa"]"##)
    }

    @TestCase
    func TestFuncDecl01(): Unit {
        let text = #"func b(param1: Int64): Int64 {
    1
    1 + 1
    "a"
}"#
        let funcDecl = (parseText(text).node.getOrThrow().getOrThrow() as FuncDecl).getOrThrow()
        @Expect(funcDecl.name, "b")
        let paramList = funcDecl.params
        @Expect(paramList.toString(), "(param1: Int64)")
        @Expect(paramList.params.size, 1)
        let param = (paramList.params[0] as FuncParam).getOrThrow()
        @Expect(param.name, "param1")
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
    func testForeign() {
        let text = #"foreign {
    func f(): Int8
}"#
        let node = parseText(text).node.getOrThrow()
        @Expect(node.isNone())
    }

    @TestCase
    func testExtendDecl06() {
        let text = """
extend F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString(), "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), text)
    }

    @TestCase
    func testEnumDecl02() {
        let text = """
public enum B {
    | Enum(Int64, A) | ...
    func a() {}
}"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.name, "B")
        @Expect(decl.isNonExhaustive, true)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    | Enum(Int64, A) | ...
    func a() {}
}""")
        @Expect(decl.toString(), text)

        let nodes = decl.body.memberDecls
        @Expect(nodes.size, 2)
        let constructor = (nodes[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "Enum")
        @Expect(constructor.paramTyAnnotations.size, 2)
        @Expect(constructor.paramTyAnnotations[0].toString(), "Int64")
        @Expect(constructor.paramTyAnnotations[1].toString(), "A")
        @Expect(constructor.toString(), "Enum(Int64, A)")

        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
        @Expect(decl.getCaseSeparatorsPos().size, 2)
    }

    @TestCase
    func testDecl06() {
        let text = """
class F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}"""
        let decl = (parseText(text).node.getOrThrow().getOrThrow() as ClassDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), text)
    }

}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
