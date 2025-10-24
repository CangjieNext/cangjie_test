// DEPENDENCE: sourceFile/comment_rules.cj
// (not Windows) EXEC: dos2unix comment_rules.cj
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
        let node = parseFile("comment_rules.cj")
        file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testBlock() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let block = funcDecl.body.getOrThrow()
        @Expect(block.comments.size, 3)

        var pos = block.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 1, 10, 2]).toArray())

        pos = block.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 1, 6, 2]).toArray())
        pos = block.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 1, 10, 2]).toArray())
        pos = block.comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 1, 5, 35]).toArray())
        pos = block.comments[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 1, 7, 33]).toArray())
        pos = block.comments[2].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 1, 9, 40]).toArray())
    }

    @TestCase
    func testVarDecl01() {
        /*
        // leading comment belong to varDecl
        let a = 1 /* comment belong to 1 */ +
        // comment belong to 2
        2
        */
        var comments = decls[1].comments
        @Expect(comments.size, 1)

        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 1, 12, 37]).toArray())


        let initializer = ((decls[1] as VarDecl).getOrThrow().initializer.getOrThrow() as BinaryExpr).getOrThrow()
        let lhs = initializer.lhs
        comments = lhs.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "/* comment belong to 1 */")
        match(comments[0].kind) {
            case CommentKind.Block => ()
            case _ => @FailExpect("kind wrong")
        }    
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 11, 13, 36]).toArray())

        let rhs = initializer.rhs
        comments = rhs.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "// comment belong to 2")
    }

    @TestCase
    func testClassDecl01() {
        var comments = decls[2].comments
        @Expect(comments.size, 1)

        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([18, 1, 18, 39]).toArray())
        pos = decls[2].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([18, 1, 19, 11]).toArray())
    }

    @TestCase
    func testModifier01() {
        var comments = decls[3].comments
        @Expect(comments.size, 2)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 1, 22, 38]).toArray())
        pos = comments[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 63, 23, 98]).toArray())

        let modifier = decls[3].modifiers[0]
        comments = modifier.comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 11, 23, 43]).toArray())
    }

    @TestCase
    func testModifier02() {
        let modifier = decls[4].modifiers[1]
        let comments = modifier.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 1, 26, 28]).toArray())
    }

    @TestCase
    func testClassDecl02() {
        let classDecl = (decls[5] as ClassDecl).getOrThrow()
        let staticInit = classDecl.body.memberDecls[0]
        var comments = staticInit.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([30, 5, 30, 37]).toArray())

        comments = classDecl.body.memberDecls[1].comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([33, 5, 33, 32]).toArray())

        comments = classDecl.body.memberDecls[2].comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([36, 5, 36, 32]).toArray())

        comments = classDecl.body.memberDecls[3].comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([40, 5, 40, 35]).toArray())
    }

    @TestCase
    func testClassDecl03() {
        /*class A { // leading comment of var a
        var a = 1

        // inner comment of body
        }*/
        let classDecl = (decls[6] as ClassDecl).getOrThrow()
        let varDecl = classDecl.body.memberDecls[0]
        var comments = varDecl.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([48, 11, 48, 38]).toArray())

        comments = classDecl.body.comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([51, 5, 51, 29]).toArray())
    }

    @TestCase
    func testParamList01() {
        /*
        func foo(/* h inner comment of parameterList*/) {} 
        */
        let funcDecl = (decls[7] as FuncDecl).getOrThrow()
        let comments = funcDecl.params.comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([54, 10, 54, 47]).toArray())
    }

    @TestCase
    func testInterfaceDecl() {
        /*
        // commentGroup1 belong to interface

        // commentGroup2 belong to interface
        interface A {}
        */
        let interfaceDecl = (decls[8] as InterfaceDecl).getOrThrow()
        let comments = interfaceDecl.comments
        @Expect(comments.size, 2)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([56, 1, 56, 37]).toArray())
        pos = comments[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([58, 1, 58, 37]).toArray())
    }

    @TestCase
    func testFuncParam() {
        /*
        func greet(
            name: string /* 用户名 */,
            age: int     // 用户年龄
        ) {}
        */
        let parameters = (decls[9] as FuncDecl).getOrThrow().params.params
        var comments = parameters[0].comments
        @Expect(comments.size, 1)
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([62, 18, 62, 27]).toArray())

        comments = parameters[1].comments
        @Expect(comments.size, 1)
        pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([63, 18, 63, 25]).toArray())
    }

    @TestCase
    func testFuncDecl01() {
        /*
        func a() {

        } // belong to func a 

        func b() {

        }
        */

        let funDecl = (decls[10] as FuncDecl).getOrThrow()
        var comments = funDecl.comments
        @Expect(comments.size, 1)
        @Expect(comments[0].content, "// belong to func a")
        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([68, 3, 68, 22]).toArray())
    }

    @TestCase
    func testFileComment() {
        let comments = file.getOrThrow().comments
        @Expect(comments.size, 2)

        @Expect(comments[0].content, #"/** file leading comments
*/"#)
        match(comments[0].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }

        var pos = comments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 2, 3]).toArray())

        @Expect(comments[1].content, #"/** file trailing comments
*/"#)
        match(comments[1].kind) {
            case CommentKind.Document => ()
            case _ => @FailExpect("kind wrong")
        }
        pos = comments[1].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([74, 1, 75, 3]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("comment_rules.cj")
        let input = String.fromUtf8(File.readFrom("comment_rules.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}