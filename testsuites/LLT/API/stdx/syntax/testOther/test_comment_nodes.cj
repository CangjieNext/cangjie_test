/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/comment_nodes.cj
// (not Windows) EXEC: dos2unix comment_nodes.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []
    var file: ?SourceFile = None

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("comment_nodes.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testImportList() {
        let importLists = file.getOrThrow().importLists
        var comments = importLists[0].comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, "// comment belong to importList[0]")
        @Expect(comments[1].content, "// comment belong to importList[0]")
        var pos = importLists[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 1, 5, 61]).toArray())
    }

    @TestCase
    func testPackageHeader() {
        let pkgHeader = file.getOrThrow().pkgHeader.getOrThrow()
        var comments = pkgHeader.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, "// comment belong to package")
        @Expect(comments[1].content, "/* inner comment belong to pkg */")
        match(comments[1].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }

        var pos = pkgHeader.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 2, 57]).toArray())
        pos = comments[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 42]).toArray())
    }

    @TestCase
    func testExtendDecl() {
        /*
        // leading comment belong to extendDecl
        extend A {}
        */
        let extendDecl = (decls[0] as ExtendDecl).getOrThrow()
        let comments = extendDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 1, 7, 40]).toArray())
    }

    @TestCase
    func testEnumDecl() {
        /*
        // leading comment belong to enumDecl
        enum A {Enum}
        */
        let enumDecl = (decls[1] as EnumDecl).getOrThrow()
        let comments = enumDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 1, 10, 38]).toArray())
    }

    @TestCase
    func testMainDecl() {
        /*
        // leading comment belong to mainDecl
        main() {}
        */
        let mainDecl = (decls[2] as MainDecl).getOrThrow()
        let comments = mainDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 1, 13, 38]).toArray())
    }

    @TestCase
    func testStructDecl() {
        /*
        // leading comment belong to structDecl
        struct A {}
        */
        let structDecl = (decls[3] as StructDecl).getOrThrow()
        let comments = structDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([16, 1, 16, 40]).toArray())
    }

    @TestCase
    func testTypeAlias() {
        /*
        // leading comment belong to typeAlias
        type NewType = Int64
        */
        let typeAlias = (decls[4] as TypeAlias).getOrThrow()
        let comments = typeAlias.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([19, 1, 19, 39]).toArray())
    }

    @TestCase
    func testMacroExpandDecl() {
        /*
        // leading comment belong to macroExpandDecl
        @testMacro
        class A {}
        */
        let macroExpandDecl = (decls[5] as MacroExpandDecl).getOrThrow()
        let comments = macroExpandDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 1, 22, 45]).toArray())
    }

    @TestCase
    func testMacroExpandParam() {
        /*
        func a(/* leading comment belong to macroExpandParam */@testMacro[public func]a: Int64) {}
        */
        let funcDecl = (decls[6] as FuncDecl).getOrThrow()
        let comments = funcDecl.params.params[0].comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 8,  26, 56]).toArray())
    }

    @TestCase
    func testTypeAnnotation() {
        /*
        func divide(a: int, b: int): (
            int,    /* 商 */,
            bool    // 是否整除
        ) {}
        */
        let retTypeAnnotation = (decls[7] as FuncDecl).getOrThrow().retTyAnnotation.getOrThrow()
        let typeAnnotations = (retTypeAnnotation as TupleType).getOrThrow().elements
        var comments = typeAnnotations[0].comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([29, 12, 29, 19]).toArray())

        comments = typeAnnotations[1].comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([30, 12, 30, 19]).toArray())
    }

    @TestCase
    func testBinaryExpr() {
        /*
        func calculate(): int {
        let result = 10 + 
        // comment belong to `20 * 30` 
        20 * 
        30 /* comment belong to varDecl */
        return result
        }
        */

        let funcDecl = (decls[8] as FuncDecl).getOrThrow()
        let initializer = ((funcDecl.body.getOrThrow().nodes[0] as VarDecl).getOrThrow().initializer.getOrThrow() as BinaryExpr).getOrThrow()

        // let initializer = ((decls[8] as VarDecl).getOrThrow().initializer.getOrThrow() as BinaryExpr).getOrThrow()

        let rhs = initializer.rhs
        var comments = rhs.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "// comment belong to `20 * 30`")
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([35, 5, 35, 35]).toArray())

        let varDecl = (funcDecl.body.getOrThrow().nodes[0] as VarDecl).getOrThrow()
        comments = varDecl.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* comment belong to varDecl */")
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([37, 8, 37, 39]).toArray())
    }

    @TestCase
    func testArrayLiteral() {
        /*
        func printArray() {
            let nums = [
                1 /* the first element */,
                2,
                // the third element
                3
            ]
        }
        */

        let varDecl = ((decls[9] as FuncDecl).getOrThrow().body.getOrThrow().nodes[0] as VarDecl).getOrThrow()
        let arrayLiteral = (varDecl.initializer.getOrThrow() as ArrayLiteral).getOrThrow()
        let firstEle = arrayLiteral.elements[0]
        var comments = firstEle.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* the first element */")
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([43, 11, 43, 34]).toArray())

        let thirdEle = arrayLiteral.elements[2]
        comments = thirdEle.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "// the third element")
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 9, 45, 29]).toArray())
    }

    @TestCase
    func testBinaryExpr02() {
        /*
        func f5() {
            return 0 + /* comment belong to 5 */ 5
        }
        */

        let returnExpr = ((decls[10] as FuncDecl).getOrThrow().body.getOrThrow().nodes[0] as ReturnExpr).getOrThrow()
        let binaryExpr = (returnExpr.retVal.getOrThrow() as BinaryExpr).getOrThrow()
        let rhs = binaryExpr.rhs
        var comments = rhs.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* comment belong to 5 */")
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([51, 16, 51, 41]).toArray())
    }

    @TestCase
    func testParamList02() {
        /*
        main() // comment belong to paramterList
        {}
        */

        let mainDecl = (decls[11] as MainDecl).getOrThrow()
        let params = mainDecl.params
        var comments = params.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "// comment belong to paramterList")
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([54, 8, 54, 41]).toArray())
    }

    @TestCase
    func testPropGetterOrSetter() {
        /*
        // line comment1
        extend<T> A<T> /* block comment1 */ where T <: I1 {
            public func foo() {}
            // line comment2
            public mut prop _prop: Int64 {
                /* block comment2 */
                get( /** document comment1 */ ) { 0 /** document comment2 */}

                set(/* block comment3 */ v) {
                    // line comment3
                }
            }
        } // line comment4
        */

        let extendDecl = (decls[12] as ExtendDecl).getOrThrow()
        let propDecl = (extendDecl.body.memberDecls[1] as PropDecl).getOrThrow()
        let getter = propDecl.getter.getOrThrow()
        let setter = propDecl.setter.getOrThrow()
        var comments = getter.comments
        @Expect(comments.size, 2)
        @Expect(comments[0].content, "/* block comment2 */")
        @Expect(comments[1].content, "/** document comment1 */")

        comments = setter.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* block comment3 */")
    }

    @TestCase
    func testExtendDeclInitWithComment() {
        /*
        // leading comment belong to extendDecl
        extend A {}
        */
        let decl = (decls[0] as ExtendDecl).getOrThrow()
        let extendDecl = ExtendDecl(decl.body, decl.extendedTyAnnotation, decl.genericConstraints, decl.genericParams,
                                    decl.superTyAnnotations, annotations: decl.annotations, comments: decl.comments)
        @Expect(extendDecl.toString().replace("\r\n", "\n"), #"// leading comment belong to extendDecl
extend A {}"#)
        let comments = extendDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 40]).toArray())
        pos = extendDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 2, 12]).toArray())
    }

    @TestCase
    func testCommentInit01() {
        let returnExpr = ((decls[10] as FuncDecl).getOrThrow().body.getOrThrow().nodes[0] as ReturnExpr).getOrThrow()
        let binaryExpr = (returnExpr.retVal.getOrThrow() as BinaryExpr).getOrThrow()
        let rhs = binaryExpr.rhs
        var comments = rhs.comments
        @Expect(comments.size, 1)
        let comment = Comment(comments[0].content)
        @Expect(comment.content, "/* comment belong to 5 */")
        var pos = comment.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 26]).toArray())
    }

    @TestCase
    func testCommentInit02() {
        let comment = Comment(##"// comment"##)
        @Expect(comment.content, "// comment")
        @AssertThrows[Exception](Comment(##"// comment
        "##))
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("comment_nodes.cj")
        let input = String.fromUtf8(File.readFrom("comment_nodes.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}