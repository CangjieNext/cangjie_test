/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.ArrayList

@Test
class Test {
    @TestCase
    func testVarDecl01() {
        let input = quote(
            let a = (1 <  0)
        )
        let node = parseTokens(input)
        let decl = (node.node.getOrThrow() as VarDecl).getOrThrow()
        @Expect(decl.toString(), "let a =(1 < 0)")
    }

    @TestCase
    func testUnsupported() {
        try {
            parseTokens(quote(
                foreign {
                    func f(): Int8
                }
            ))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseTokens function:"), true)
        }

        try {
            parseTokens(quote(
                public Rectangle(let width: Int64, let height: Int64) {}
            ))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseTokens function:"), true)
        }

        try {
            parseTokens(quote(a: Int64))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseTokens function:"), true)
        }
    }

    @TestCase
    func testVarDecl() {
        let input = quote(
            let a = Array<Int64>()
        )
        let node = parseTokens(input)
        let decl = (node.node.getOrThrow() as VarDecl).getOrThrow()
        let initializer = (decl.initializer).getOrThrow()

        match(decl.kind) {
            case VarKind.Let => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.name, "a")
        @Expect(decl.tyAnnotation.isNone(), true)
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

        let tokens = quote(@Deprecated["This API will be deprecated soon"] let (a, b): (Int64, String) = (1, "hello"))
        let decl_1 = (parseTokens(tokens).node.getOrThrow() as VarDecl).getOrThrow()
        @Expect(decl_1.toString(), #"@Deprecated["This API will be deprecated soon"] let(a, b):(Int64, String) =(1, "hello")"#)
    }

    @TestCase
    func testTypeAlias02() {
        let tokens = quote(type NewType<S, T> = packageName.className<S, T>)
        let decl = (parseTokens(tokens).node.getOrThrow() as TypeAlias).getOrThrow()
        @Expect(decl.aliasName, "NewType")
        @Expect(decl.typeParameters.size, 2)
        @Expect(decl.typeParameters[0].toString(), "S")
        @Expect(decl.typeParameters[1].toString(), "T")
    }

    @TestCase
    func testStructDecl06() {
        let tokens = quote(
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
})
        let decl = (parseTokens(tokens).node.getOrThrow() as StructDecl).getOrThrow()
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

    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), """
struct F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testStaticInit() {
        let tokens = quote(
static init() {
        a = 1
        println()
    })
        let decl = (parseTokens(tokens).node.getOrThrow() as StaticInit).getOrThrow()
        @Expect(decl.body.toString(), """
{
    a = 1
    println()
}""")
        @Expect(decl.toString(), """
static init() {
    a = 1
    println()
}""")
    }

    @TestCase
    func testPropDecl02() {
        let tokens = quote(
mut prop b: Int64 {
    get() {
        1
    }
    set(v) {
        println(v)
    }
})
        let decl = (parseTokens(tokens).node.getOrThrow() as PropDecl).getOrThrow()
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
        @Expect(decl.toString(), """
mut prop b: Int64 {
    get() {
        1
    }
    set(v) {
        println(v)
    }
}""")
        @Expect(getter.getSetKeyWordPos().isNone())
        @Expect(getter.getIdentifierPos().isNone())
        @Expect(setter.getGetKeyWordPos().isNone())
    }

    @TestCase
    func testMainDecl02() {
        let tokens = quote(
main(param1: Int64, param2: Int64): Int64 {
    1
    1 + 1
    "a"
    0
})
        let decl = (parseTokens(tokens).node.getOrThrow() as MainDecl).getOrThrow()
        let ret = decl.retTyAnnotation.getOrThrow()
        let params = decl.params

        @Expect(decl.body.nodes.size, 4)
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "param1: Int64")
        @Expect(params.params[1].toString(), "param2: Int64")
        @Expect(ret is AtomicType)
        @Expect(ret.toString(), "Int64")
        @Expect(decl.toString(), """
main(param1: Int64, param2: Int64): Int64 {
    1
    1 + 1
    "a"
    0
}""")
    }

    @TestCase
    func testMacroExpandParam01() {
        let decl = (parseTokens(quote(func function(@testMacro[public func]a: Int64, @macroPackage.testMacro(b!: Int64)){})).node.getOrThrow() as FuncDecl).getOrThrow()
        let param = (decl.params.params[0] as MacroExpandParam).getOrThrow()
        @Expect(param.calleeMacro.toString(), "testMacro")
        @Expect(param.macroAttrs.toString(), "public func")
        match(param.macroInputs) {
            case WithoutParens(v) => @Expect(v.toString(), "a: Int64")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(param.toString(), "@testMacro[public func] a: Int64")
        @Expect(param.getLParenPos().isNone())
        @Expect(param.getRParenPos().isNone())
    }

    @TestCase
    func testMacroDecl02() {
        let tokens = quote(public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() })
        let decl = (parseTokens(tokens).node.getOrThrow() as MacroDecl).getOrThrow()
        @Expect(decl.name, "testMacro")
        let params = decl.params
        @Expect(params.toString(), "(a: Tokens, b: Tokens)")
        @Expect(params.params.size, 2)
        @Expect(params.params[0].toString(), "a: Tokens")
        @Expect(params.params[1].toString(), "b: Tokens")
        @Expect(decl.retTyAnnotation.getOrThrow().toString(), "Tokens")
        @Expect(decl.body.toString(), "{ return quote() }")
        @Expect(decl.toString(), "public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }")
    }

    @TestCase
    func testInterfaceDecl_01() {
        let tokens = quote(@Deprecated["aaa"]
    public interface I1<T> <: S1<T> where T <: I2<T> {
        static mut prop p1: Int64
        func foo(): Int64
    })
        let res = parseTokens(tokens)
        var diags = res.diags
        @Assert(diags.size, 0)

        var interfaceDecl: InterfaceDecl = (res.node.getOrThrow() as InterfaceDecl).getOrThrow()

        @Assert(interfaceDecl.body.memberDecls.size, 2)
        @Assert(interfaceDecl.body.memberDecls[0] is PropDecl)
        @Assert(interfaceDecl.body.memberDecls[0].toString(), ##"static mut prop p1: Int64"##)
        @Assert(interfaceDecl.body.memberDecls[1] is FuncDecl)
        @Assert(interfaceDecl.body.memberDecls[1].toString(), ##"func foo(): Int64"##)

        @Assert(interfaceDecl.name, "I1")
        @Assert(interfaceDecl.genericConstraints.isSome())
        @Assert(interfaceDecl.genericParams.size, 1)
        @Assert(interfaceDecl.genericParams[0].toString(), "T")
        @Assert(interfaceDecl.superTyAnnotations.size, 1)
        @Assert(interfaceDecl.annotations.size, 1)
        @Assert(interfaceDecl.annotations[0].toString(), ##"@Deprecated["aaa"]"##)
    }

    @TestCase
    func TestFuncDecl01(): Unit {
        let tokens = quote(func b(param1: Int64): Int64 {
    1
    1 + 1
    "a"
})
        let funcDecl = (parseTokens(tokens).node.getOrThrow() as FuncDecl).getOrThrow()
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
    func testExtendDecl06() {
        let tokens = quote(
extend F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
})
        let decl = (parseTokens(tokens).node.getOrThrow() as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString(), "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), """
extend F {
    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testEnumDecl02() {
        let tokens = quote(
public enum B {
    | Enum(Int64, A) | ...
    func a() {}
})
        let decl = (parseTokens(tokens).node.getOrThrow() as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.name, "B")
        @Expect(decl.isNonExhaustive, true)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    | Enum(Int64, A) | ...
    func a() { }
}""")
        @Expect(decl.toString(), """
public enum B {
    | Enum(Int64, A) | ...
    func a() { }
}""")

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
        let tokens = quote(
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
})
        let decl = (parseTokens(tokens).node.getOrThrow() as ClassDecl).getOrThrow()
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

    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), """
class F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) { }

    prop e: String {
        get() { return "hello" }
    }
}""")
    }
}

let _quote = quote(
    class A {
        let x = 1
    }
)

@Test
func test_RefreshPos() {
    let res = parseTokens(_quote, refreshPos: false)
    let sourceNode: SyntaxTreeNode = res.node.getOrThrow()
    var classDecl: ClassDecl = (sourceNode as ClassDecl).getOrThrow()
    
    @Assert(classDecl.toString(), ##"class A {
        let x = 1
    }"##)
    @Assert(classDecl.nodePos.fileName, "")
    @Assert(classDecl.nodePos.filePath, "")

    var pos = classDecl.nodePos
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([469, 5, 471, 6]).toArray())
}