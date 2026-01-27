/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/enum_decl.cj
// (not Windows) EXEC: dos2unix enum_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList
import std.reflect.*

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("enum_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "A")
        @Expect(decl.isNonExhaustive, false)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ Enum }")
        @Expect(decl.toString().replace("\r\n", "\n"), "enum A { Enum }")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))

        let nodes = decl.body.memberDecls
        @Expect(nodes.size, 1)
        let constructor = (nodes[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "Enum")
        @Expect(constructor.paramTyAnnotations.size, 0)
        @Expect(constructor.toString().replace("\r\n", "\n"), "Enum")

        var pos = decl.getEnumKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
        @Expect(decl.getCaseSeparatorsPos().size, 0)
        @Expect(decl.getNonExhaustiveTripleDotPos().isNone())

        pos = constructor.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 10, 1, 14]).toArray())
        @Expect(constructor.getParamsLParenPos().isNone())
        @Expect(constructor.getParamsCommasPos().size, 0)
        @Expect(constructor.getParamsRParenPos().isNone())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.name, "B")
        @Expect(decl.isNonExhaustive, true)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), """
{
    | Enum(Int64, A) | ...
    func a() {}
}""")
        @Expect(decl.toString().replace("\r\n", "\n"), """
public enum B {
    | Enum(Int64, A) | ...
    func a() {}
}""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))

        let nodes = decl.body.memberDecls
        @Expect(nodes.size, 2)
        let constructor = (nodes[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "Enum")
        @Expect(constructor.paramTyAnnotations.size, 2)
        @Expect(constructor.paramTyAnnotations[0].toString().replace("\r\n", "\n"), "Int64")
        @Expect(constructor.paramTyAnnotations[1].toString().replace("\r\n", "\n"), "A")
        @Expect(constructor.toString().replace("\r\n", "\n"), "Enum(Int64, A)")

        var pos = decl.getEnumKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 12]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 13, 3, 14]).toArray())
        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
        @Expect(decl.getCaseSeparatorsPos().size, 2)
        pos = decl.getCaseSeparatorsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 6]).toArray())
        pos = decl.getCaseSeparatorsPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 22, 4, 23]).toArray())
        pos = decl.getNonExhaustiveTripleDotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 24, 4, 27]).toArray())

        pos = constructor.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 11]).toArray())
        pos = constructor.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 11, 4, 12]).toArray())
        @Expect(constructor.getParamsCommasPos().size, 1)
        pos = constructor.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 17, 4, 18]).toArray())
        pos = constructor.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 20, 4, 21]).toArray())
        pos = constructor.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 21]).toArray())
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[2] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "C")
        @Expect(decl.isNonExhaustive, false)
        @Expect(decl.superTyAnnotations.size, 1)
        @Expect(decl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "B")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ Enum1 | Enum2 }")
        @Expect(decl.toString().replace("\r\n", "\n"), "enum C <: B { Enum1 | Enum2 }")

        let nodes = decl.body.memberDecls
        @Expect(nodes.size, 2)
        let constructor = (nodes[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "Enum1")
        @Expect(constructor.paramTyAnnotations.size, 0)
        @Expect(constructor.toString().replace("\r\n", "\n"), "Enum1")
        let constructor2 = (nodes[1] as EnumConstructor).getOrThrow()
        @Expect(constructor2.name, "Enum2")
        @Expect(constructor2.paramTyAnnotations.size, 0)
        @Expect(constructor2.toString().replace("\r\n", "\n"), "Enum2")
    }

    @TestCase
    func testDecl04() {
        let decl = (decls[3] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "D")
        @Expect(decl.isNonExhaustive, false)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 1)
        @Expect(decl.genericParams[0].name, "T")
        let genericConstraints =  decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 1)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "T <: B")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ Enum }")
        @Expect(decl.toString().replace("\r\n", "\n"), "enum D<T> where T <: B { Enum }")
    }

    @TestCase
    func testDecl05() {
        let decl = (decls[4] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "E")
        @Expect(decl.isNonExhaustive, false)
        @Expect(decl.superTyAnnotations.size, 2)
        @Expect(decl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "ToString")
        @Expect(decl.superTyAnnotations[1].toString().replace("\r\n", "\n"), "Inter<S, V>")
        @Expect(decl.genericParams.size, 2)
        @Expect(decl.genericParams[0].name, "S")
        @Expect(decl.genericParams[1].name, "V")
        let genericConstraints =  decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "S <: B")
        @Expect(genericConstraints.constraints[1].toString().replace("\r\n", "\n"), "V <: ToString")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{ Enum }")
        @Expect(decl.toString().replace("\r\n", "\n"), "enum E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString { Enum }")

        var pos = decl.getEnumKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 1, 12, 5]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 6, 12, 7]).toArray())
        pos = decl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 7, 12, 8]).toArray())
        @Expect(decl.getGenericParamsCommasPos().size, 1)
        pos = decl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 9, 12, 10]).toArray())
        pos = decl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 12, 12, 13]).toArray())
        pos = decl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 14, 12, 16]).toArray())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = decl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 26, 12, 27]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 1, 12, 76]).toArray())
    }

    @TestCase
    func testDecl06() {
        let decl = (decls[5] as EnumDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "F")
        @Expect(decl.isNonExhaustive, false)
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), """
{
    Enum
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString().replace("\r\n", "\n"), """
enum F {
    Enum
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testDecl07() {
        let enumDecl = (decls[7] as EnumDecl).getOrThrow()
        @Assert(enumDecl.toString().replace("\r\n", "\n"), ##"@Deprecated["aaa"]
enum E1 {
    A1 | B1 | C1(Int64) | D1(Int64, String) | ...
    prop p1: Int64 {
        get() {0}
    }
    func foo() {}
}"##)
        @Assert(enumDecl.body.memberDecls.size, 6)
        @Assert(enumDecl.body.memberDecls[4] is PropDecl)
        @Assert(enumDecl.body.memberDecls[4].toString().replace("\r\n", "\n"), ##"prop p1: Int64 {
        get() {0}
    }"##)
        @Assert(enumDecl.body.memberDecls[5] is FuncDecl)
        @Assert(enumDecl.body.memberDecls[5].toString().replace("\r\n", "\n"), ##"func foo() {}"##)

        @Assert(enumDecl.name, "E1")
        @Assert(enumDecl.isNonExhaustive, true)
        @Assert(enumDecl.genericConstraints.isNone())
        @Assert(enumDecl.genericParams.size, 0)
        @Assert(enumDecl.superTyAnnotations.size, 0)
        @Assert(enumDecl.annotations.size, 1)
        @Assert(enumDecl.annotations[0].toString().replace("\r\n", "\n"), ##"@Deprecated["aaa"]"##)
    }

    @TestCase
    func testDecl08() {
        let enumDecl = (decls[8] as EnumDecl).getOrThrow()
        let nodes = enumDecl.body.memberDecls
        var constructor = (nodes[0] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "EnumA")
        @Expect(constructor.paramTyAnnotations.size, 0)
        @Expect(constructor.toString().replace("\r\n", "\n"), """
@Deprecated["EnumA"]
    EnumA""")

        var decl = (nodes[1] as MacroExpandDecl).getOrThrow()
        @Expect(decl.calleeMacro.toString().replace("\r\n", "\n"), "EnumField")
        @Expect(decl.macroAttrs.toString().replace("\r\n", "\n"),  ##""EnumB""##)
        match (decl.macroInputs) {
            case WithoutParens(v) =>
                @Expect(v is EnumConstructor)
                @Expect(v.toString().replace("\r\n", "\n"), "EnumB")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString().replace("\r\n", "\n"), """
@EnumField["EnumB"]
    EnumB""")
        @Expect(decl.toTokens().toString().replace("\r\n", "\n"), """
@EnumField["EnumB"]
EnumB""")
        var pos = decl.getAtPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 7, 45, 8]).toArray())
        pos = decl.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 17, 45, 18]).toArray())
        pos = decl.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 25, 45, 26]).toArray())
        @Expect(decl.getLParenPos().isNone())
        @Expect(decl.getRParenPos().isNone())
        
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 7, 46, 10]).toArray())

        constructor = (nodes[4] as EnumConstructor).getOrThrow()
        @Expect(constructor.name, "EnumE")
        @Expect(constructor.paramTyAnnotations.size, 2)
        @Expect(constructor.toString().replace("\r\n", "\n"), """
@!EnumField[v: "EnumE"]
    EnumE(a, b)""")

        decl = (nodes[5] as MacroExpandDecl).getOrThrow()
        @Expect(decl.calleeMacro.toString().replace("\r\n", "\n"), "EnumField")
        @Expect(decl.macroAttrs.toString().replace("\r\n", "\n"),  ##"v: "EnumF""##)
        match (decl.macroInputs) {
            case WithoutParens(v) =>
                @Expect(v is EnumConstructor)
                @Expect(v.toString().replace("\r\n", "\n"), """
@!EnumField[v: "EnumF"]
    EnumF(a, b)""")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(decl.toString().replace("\r\n", "\n"), """
@!EnumField
    @EnumField[v: "EnumF"]
    @!EnumField[v: "EnumF"]
    EnumF(a, b)""")

    }

    @TestCase
    func testEnumDeclInit01() {
        let decl = (decls[1] as EnumDecl).getOrThrow()
        let enumDecl = EnumDecl(Body([]), [(decl.body.memberDecls[0] as EnumConstructor).getOrThrow()], decl.genericConstraints,
                                decl.genericParams, decl.isNonExhaustive, decl.name, decl.superTyAnnotations, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(enumDecl.modifiers.size, 1)
        @Expect(enumDecl.name, "B")
        @Expect(enumDecl.isNonExhaustive, true)
        @Expect(enumDecl.superTyAnnotations.size, 0)
        @Expect(enumDecl.genericParams.size, 0)
        @Expect(enumDecl.genericConstraints.isNone())
        @Expect(enumDecl.body.toString().replace("\r\n", "\n"), """
{
    | Enum(Int64, A)
    | ...
}""")
        @Expect(enumDecl.toString().replace("\r\n", "\n"), """
public enum B {
    | Enum(Int64, A)
    | ...
}""")

        let nodes = enumDecl.body.memberDecls
        @Expect(nodes.size, 1)
        let constructor = (nodes[0] as EnumConstructor).getOrThrow()
        let enumConstructor = EnumConstructor(constructor.name, constructor.paramTyAnnotations, annotations: constructor.annotations)
        @Expect(enumConstructor.name, "Enum")
        @Expect(enumConstructor.paramTyAnnotations.size, 2)
        @Expect(enumConstructor.paramTyAnnotations[0].toString().replace("\r\n", "\n"), "Int64")
        @Expect(enumConstructor.paramTyAnnotations[1].toString().replace("\r\n", "\n"), "A")
        @Expect(enumConstructor.toString().replace("\r\n", "\n"), "Enum(Int64, A)")

        var pos = enumDecl.getEnumKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 12]).toArray())
        pos = enumDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 13, 1, 14]).toArray())
        @Expect(enumDecl.getGenericParamsLAnglePos().isNone())
        @Expect(enumDecl.getGenericParamsCommasPos().size, 0)
        @Expect(enumDecl.getGenericParamsRAnglePos().isNone())
        @Expect(enumDecl.getUpperBoundPos().isNone())
        @Expect(enumDecl.getSuperTyAnnotationsBitAndsPos().size, 0)
        @Expect(enumDecl.getCaseSeparatorsPos().size, 2)
        pos = enumDecl.getCaseSeparatorsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
        pos = enumDecl.getCaseSeparatorsPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        pos = enumDecl.getNonExhaustiveTripleDotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 7, 3, 10]).toArray())

        pos = enumConstructor.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = enumConstructor.getParamsLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 6]).toArray())
        @Expect(enumConstructor.getParamsCommasPos().size, 1)
        pos = enumConstructor.getParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = enumConstructor.getParamsRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = enumConstructor.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 15]).toArray())
    }

    @TestCase
    func testEnumDeclInit02() {
        let decl = (decls[4] as EnumDecl).getOrThrow()
        let enumDecl = EnumDecl(Body(), [(decl.body.memberDecls[0] as EnumConstructor).getOrThrow()], decl.genericConstraints,
                                decl.genericParams, decl.isNonExhaustive, decl.name, decl.superTyAnnotations, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(enumDecl.modifiers.size, 0)
        @Expect(enumDecl.name, "E")
        @Expect(enumDecl.isNonExhaustive, false)
        @Expect(enumDecl.superTyAnnotations.size, 2)
        @Expect(enumDecl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "ToString")
        @Expect(enumDecl.superTyAnnotations[1].toString().replace("\r\n", "\n"), "Inter<S, V>")
        @Expect(enumDecl.genericParams.size, 2)
        @Expect(enumDecl.genericParams[0].name, "S")
        @Expect(enumDecl.genericParams[1].name, "V")
        let genericConstraints =  enumDecl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "S <: B")
        @Expect(genericConstraints.constraints[1].toString().replace("\r\n", "\n"), "V <: ToString")
        @Expect(enumDecl.body.toString().replace("\r\n", "\n"), ##"{
    | Enum
}"##)
        @Expect(enumDecl.toString().replace("\r\n", "\n"), ##"enum E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {
    | Enum
}"##)

        var pos = enumDecl.getEnumKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = enumDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        pos = enumDecl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        @Expect(enumDecl.getGenericParamsCommasPos().size, 1)
        pos = enumDecl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 9, 1, 10]).toArray())
        pos = enumDecl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 13]).toArray())
        pos = enumDecl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 16]).toArray())
        @Expect(enumDecl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = enumDecl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 26, 1, 27]).toArray())
        pos = enumDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 3, 2]).toArray())
    }

    @TestCase
    func testEnumConstructorInit01() {
        let enumConstructor = EnumConstructor("EnumA", Array<TypeAnnotation>())
        @Expect(enumConstructor.name, "EnumA")
        @Expect(enumConstructor.toString().replace("\r\n", "\n"), "EnumA")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("enum_decl.cj")
        let input = String.fromUtf8(File.readFrom("enum_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}