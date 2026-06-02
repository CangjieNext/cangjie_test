/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/annotation.cj
// (not Windows) EXEC: dos2unix annotation.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("annotation.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func test01() {
        let annotations = decls[0].annotations
        @Expect(annotations.size, 1)

        @Expect(annotations[0].identifier, "Frozen")
        @Expect(annotations[0].arguments.size, 0)
        @Expect(annotations[0].toString().replace("\r\n", "\n"), "@Frozen")
        @Expect(annotations[0].toTokens().toString().replace("\r\n", "\n"), "@Frozen")
        var pos = annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 8]).toArray())
        pos = annotations[0].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = annotations[0].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 8]).toArray())
        @Expect(annotations[0].getLSquarePos().isNone(), true)
        @Expect(annotations[0].getRSquarePos().isNone(), true)
    }

    @TestCase
    func test02() {
        let annotations = decls[1].annotations
        @Expect(annotations.size, 1)

        @Expect(annotations[0].identifier, "Deprecated")
        @Expect(annotations[0].arguments.size, 1)
        @Expect(annotations[0].arguments[0].toString().replace("\r\n", "\n"), "message: \'tt\'")
        @Expect(annotations[0].toString().replace("\r\n", "\n"), "@Deprecated[ message: \'tt\' ]")
        @Expect(annotations[0].toTokens().toString().replace("\r\n", "\n"), "@Deprecated[message: \'tt\']")
    }

    @TestCase
    func test03() {
        let annotations = decls[2].annotations
        @Expect(annotations.size, 2)

        @Expect(annotations[0].identifier, "When")
        @Expect(annotations[0].arguments.size, 1)
        @Expect(annotations[0].toString().replace("\r\n", "\n"), "@When[os == \"Windows\" || os == \"macOS\"]")

        @Expect(annotations[1].identifier, "Deprecated")
        @Expect(annotations[1].arguments.size, 2)
        @Expect(annotations[1].arguments[0].toString().replace("\r\n", "\n"), "message: \"tt\"")
        @Expect(annotations[1].arguments[1].toString().replace("\r\n", "\n"), "since: \"1.3.4\"")
        @Expect(annotations[1].toString().replace("\r\n", "\n"), "@Deprecated[ message: \"tt\", since: \"1.3.4\" ]")

        var pos = annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 1, 7, 40]).toArray())
        pos = annotations[0].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 1, 7, 2]).toArray())
        pos = annotations[0].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 2, 7, 6]).toArray())
        pos = annotations[0].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 6, 7, 7]).toArray())
        pos = annotations[0].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 39, 7, 40]).toArray())
        pos = annotations[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 1, 8, 45]).toArray())
        pos = annotations[1].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 1, 8, 2]).toArray())
        pos = annotations[1].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 2, 8, 12]).toArray())
        pos = annotations[1].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 12, 8, 13]).toArray())
        pos = annotations[1].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 44, 8, 45]).toArray())
    }

    @TestCase
    func test04() {
        var structDecl = (decls[3] as StructDecl).getOrThrow()
        @Expect(structDecl.toString().replace("\r\n", "\n"), ##"@Deprecated[ message: "tt", since: "1.3.4" ]
   @!Anno1[message: "tt"]
     @When[os == "Windows" || os == "macOS"]
private struct MyStruct<A, B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z> <: I1 & I2  where T <: I1<T> & I2<T> {
    public var s1: T
    mut prop p1: ?Int64 {
        get() { None }
        set(v) {}
    }
    public init(a: T) { s1 = a }
    func foo<S>(a!: T): T {
        return a
    }
}"##)
        @Expect(structDecl.annotations.size, 3)
        @Expect(structDecl.annotations[0].toString().replace("\r\n", "\n"), ##"@Deprecated[ message: "tt", since: "1.3.4" ]"##)
        @Expect(structDecl.annotations[0].identifier, "Deprecated")
        @Expect(structDecl.annotations[1].toString().replace("\r\n", "\n"), ##"@!Anno1[message: "tt"]"##)
        @Expect(structDecl.annotations[1].identifier, "Anno1")
        @Expect(structDecl.annotations[2].toString().replace("\r\n", "\n"), ##"@When[os == "Windows" || os == "macOS"]"##)
        @Expect(structDecl.annotations[2].identifier, "When")
        let annotations = structDecl.annotations
        var pos = annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 12, 11, 56]).toArray())
        pos = annotations[0].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 12, 11, 13]).toArray())
        pos = annotations[0].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 13, 11, 23]).toArray())
        pos = annotations[0].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 23, 11, 24]).toArray())
        pos = annotations[0].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 55, 11, 56]).toArray())
        pos = annotations[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 4, 12, 26]).toArray())
        pos = annotations[1].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 4, 12, 6]).toArray())
        pos = annotations[1].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 6, 12, 11]).toArray())
        pos = annotations[1].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 11, 12, 12]).toArray())
        pos = annotations[1].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 25, 12, 26]).toArray())
        pos = annotations[2].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 6, 13, 45]).toArray())
        pos = annotations[2].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 6, 13, 7]).toArray())
        pos = annotations[2].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 7, 13, 11]).toArray())
        pos = annotations[2].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 11, 13, 12]).toArray())
        pos = annotations[2].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 44, 13, 45]).toArray())
    }

    @TestCase
    func test05() {
        var funcDecl = (decls[4] as FuncDecl).getOrThrow()
        let params = (funcDecl.params as ParameterList).getOrThrow().params
        let param = (params[0] as FuncParam).getOrThrow()
        @Expect(param.toString().replace("\r\n", "\n"), ##"@!testMacro[message: "tt"]a: Int64"##)
        @Expect(param.annotations.size, 1)
        @Expect(param.annotations[0].toString().replace("\r\n", "\n"), ##"@!testMacro[message: "tt"]"##)
        @Expect(param.annotations[0].identifier, "testMacro")
        let annotations = param.annotations
        var pos = annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 15, 26, 41]).toArray())
        pos = annotations[0].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 15, 26, 17]).toArray())
        pos = annotations[0].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 17, 26, 26]).toArray())
        pos = annotations[0].getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 26, 26, 27]).toArray())
        pos = annotations[0].getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 40, 26, 41]).toArray())
    }

    @TestCase
    func test06() {
        var structDecl = (decls[5] as StructDecl).getOrThrow()
        @Expect(structDecl.toString().replace("\r\n", "\n"), ##"@!Anno1
private struct MyStruct<A> {
    public var s1: T
}"##)
        @Expect(structDecl.annotations.size, 1)
        @Expect(structDecl.annotations[0].toString().replace("\r\n", "\n"), ##"@!Anno1"##)
        @Expect(structDecl.annotations[0].identifier, "Anno1")
        let annotations = structDecl.annotations
        var pos = annotations[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 1, 28, 8]).toArray())
        pos = annotations[0].getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 1, 28, 3]).toArray())
        pos = annotations[0].getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 3, 28, 8]).toArray())
        @Expect(annotations[0].getLSquarePos().isNone())
        @Expect(annotations[0].getRSquarePos().isNone())
    }

    @TestCase
    func test07() {
        var decl_2: VarDecl = (decls[6] as VarDecl).getOrThrow()
        @Assert(decl_2.toString().replace("\r\n", "\n"), ##"@Deprecated ["abc仓颉", strict : false] var a = 2"##)
        let anno_2: Annotation = decl_2.annotations[0]
        @Assert(anno_2.toString().replace("\r\n", "\n"), ##"@Deprecated ["abc仓颉", strict : false]"##)
        @Assert(anno_2.arguments.toString().replace("\r\n", "\n"), ##"["abc仓颉", strict : false]"##)
        @Assert(anno_2.identifier.toString().replace("\r\n", "\n"), ##"Deprecated"##)

        var pos = anno_2.getAtOpPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 1, 33, 2]).toArray())
        var argument = anno_2.arguments[0]
        var value = (argument.value as LitConstExpr).getOrThrow()
        @Assert(value.rawValue, "abc仓颉")
        @Assert(value.rawValue.toRuneArray().size, 5)

        pos = anno_2.arguments[0].nodePos
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 14, 33, 21]).toArray())
        var posList = anno_2.getCommasPos()
        @Assert(posList.size == 1, true)
        @Assert([posList[0].beginLine, posList[0].beginColumn, posList[0].endLine, posList[0].endColumn], ArrayList<Int32>([33, 21, 33, 22]).toArray())
        pos = anno_2.getIdentifierPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 2, 33, 12]).toArray())
        pos = anno_2.getLSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 13, 33, 14]).toArray())
        pos = anno_2.getRSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 37, 33, 38]).toArray())
    }

    @TestCase
    func test08() {
        var decl_2: VarDecl = (decls[7] as VarDecl).getOrThrow()
        @Assert(decl_2.toString().replace("\r\n", "\n"), ##"@Attribute[State] var cnt = 0"##)
        let anno_2: Annotation = decl_2.annotations[0]
        @Assert(anno_2.toString().replace("\r\n", "\n"), ##"@Attribute[State]"##)
        @Assert(anno_2.arguments.toString().replace("\r\n", "\n"), ##"[State]"##)
        @Assert(anno_2.identifier.toString().replace("\r\n", "\n"), ##"Attribute"##)
 
        var pos = anno_2.getAtOpPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 1, 35, 2]).toArray())
        var argument = anno_2.arguments[0]
        var value = (argument.value as SymbolRef).getOrThrow()
        @Assert(value.name, "State")
        @Assert(value.name.toRuneArray().size, 5)
 
        pos = anno_2.arguments[0].nodePos
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 12, 35, 17]).toArray())
        @Assert(anno_2.getCommasPos().size, 0)
        pos = anno_2.getIdentifierPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 2, 35, 11]).toArray())
        pos = anno_2.getLSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 11, 35, 12]).toArray())
        pos = anno_2.getRSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 17, 35, 18]).toArray())
    }
 
    @TestCase
    func test09() {
        var decl_2: VarDecl = (decls[8] as VarDecl).getOrThrow()
        @Assert(decl_2.toString().replace("\r\n", "\n"), ##"@Attribute['Binding', "ovo", 'hello'] var bcnt = 0"##)
        let anno_2: Annotation = decl_2.annotations[0]
        @Assert(anno_2.toString().replace("\r\n", "\n"), ##"@Attribute['Binding', "ovo", 'hello']"##)
        @Assert(anno_2.arguments.toString().replace("\r\n", "\n"), ##"['Binding', "ovo", 'hello']"##)
        @Assert(anno_2.identifier.toString().replace("\r\n", "\n"), ##"Attribute"##)
 
        var pos = anno_2.getAtOpPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 1, 36, 2]).toArray())
        var argument = anno_2.arguments[1]
        var value = (argument.value as LitConstExpr).getOrThrow()
        @Assert(value.rawValue, "ovo")
        @Assert(value.rawValue.toRuneArray().size, 3)
 
        pos = anno_2.arguments[0].nodePos
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 12, 36, 21]).toArray())
        var posList = anno_2.getCommasPos()
        @Assert(posList.size == 2, true)
        @Assert([posList[0].beginLine, posList[0].beginColumn, posList[0].endLine, posList[0].endColumn], ArrayList<Int32>([36, 21, 36, 22]).toArray())
        @Assert([posList[1].beginLine, posList[1].beginColumn, posList[1].endLine, posList[1].endColumn], ArrayList<Int32>([36, 28, 36, 29]).toArray())
        pos = anno_2.getIdentifierPos()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 2, 36, 11]).toArray())
        pos = anno_2.getLSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 11, 36, 12]).toArray())
        pos = anno_2.getRSquarePos().getOrThrow()
        @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 37, 36, 38]).toArray())
    }

    @TestCase
    func testAnnotationInit01() {
        var structDecl = (decls[5] as StructDecl).getOrThrow()
        @Expect(structDecl.annotations.size, 1)
        let structAnno = structDecl.annotations[0]
        let anno = Annotation(structAnno.arguments, structAnno.identifier, structAnno.opKind)
        @Expect(anno.toString().replace("\r\n", "\n"), ##"@!Anno1"##)
        @Expect(anno.identifier, "Anno1")
        var pos = anno.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 8]).toArray())
        pos = anno.getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 3]).toArray())
        pos = anno.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 8]).toArray())
        @Expect(anno.getLSquarePos().isNone())
        @Expect(anno.getRSquarePos().isNone())
    }

    @TestCase
    func testAnnotationInit02() {
        let annotations = decls[1].annotations
        @Expect(annotations.size, 1)
        let anno = Annotation(annotations[0].arguments, annotations[0].identifier, annotations[0].opKind)

        @Expect(anno.identifier, "Deprecated")
        @Expect(anno.arguments.size, 1)
        @Expect(anno.arguments[0].toString().replace("\r\n", "\n"), "message: \'tt\'")
        @Expect(anno.toString().replace("\r\n", "\n"), "@Deprecated[message: \'tt\']")
    }

    @TestCase
    func testAnnotationInit03() {
        let annotations = decls[2].annotations
        @Expect(annotations.size, 2)
        var anno = Annotation(annotations[0].arguments, annotations[0].identifier, annotations[0].opKind)
        
        
        @Expect(anno.identifier, "When")
        @Expect(anno.arguments.size, 1)
        @Expect(anno.toString().replace("\r\n", "\n"), "@When[os == \"Windows\" || os == \"macOS\"]")
        var pos = anno.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 40]).toArray())
        pos = anno.getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = anno.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 6]).toArray())
        pos = anno.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        pos = anno.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 39, 1, 40]).toArray())

        anno = Annotation(annotations[1].arguments, annotations[1].identifier, annotations[1].opKind)
        @Expect(anno.identifier, "Deprecated")
        @Expect(anno.arguments.size, 2)
        @Expect(anno.arguments[0].toString().replace("\r\n", "\n"), "message: \"tt\"")
        @Expect(anno.arguments[1].toString().replace("\r\n", "\n"), "since: \"1.3.4\"")
        @Expect(anno.toString().replace("\r\n", "\n"), "@Deprecated[message: \"tt\", since: \"1.3.4\"]")
        pos = anno.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 43]).toArray())
        pos = anno.getAtOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = anno.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 12]).toArray())
        pos = anno.getLSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 13]).toArray())
        pos = anno.getRSquarePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 42, 1, 43]).toArray())
    }

    @TestCase
    func testArgumentInit() {
        let annotations = decls[1].annotations
        @Expect(annotations.size, 1)
        let anno = Annotation(annotations[0].arguments, annotations[0].identifier, annotations[0].opKind)

        @Expect(anno.identifier, "Deprecated")
        @Expect(anno.arguments.size, 1)
        let argument = Argument(anno.arguments[0].identifier, anno.arguments[0].isInOut, anno.arguments[0].value)
        @Expect(argument.toString().replace("\r\n", "\n"), "message: \'tt\'")
        @Expect(argument.isNamed, true)
        @Expect(argument.isInOut, false)
        @Expect(argument.value.toString().replace("\r\n", "\n"), "\'tt\'")
        @Expect(anno.toString().replace("\r\n", "\n"), "@Deprecated[message: \'tt\']")
    }

    @TestCase
    func testAnnotationIdentifier() {
        let annotations = decls[2].annotations
        @Expect(annotations.size, 2)
        @AssertThrows[Exception](Annotation(annotations[0].arguments, "*&(%)", annotations[0].opKind))
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("annotation.cj")
        let input = String.fromUtf8(File.readFrom("annotation.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

