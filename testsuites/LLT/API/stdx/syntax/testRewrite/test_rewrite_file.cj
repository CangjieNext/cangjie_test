/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/package1 sourceFile/test_file_input.cj sourceFile/test_file_01.cj
// (not Windows) EXEC: dos2unix package1/test_file_input1.cj package1/test_file_input2.cj test_file_input.cj test_file_01.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class RewriteNode <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case f: SourceFile => return parseFile("test_file_input.cj").node.getOrThrow() 
            case _ => node
        }
    }
}

public class RewriteNodeError <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case f: SourceFile => return parseFile("test_file_01.cj").node.getOrThrow() 
            case _ => node
        }
    }
}

public class ASTRewriteBinary <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case binaryExpr: BinaryExpr => parseText("a*b").node.getOrThrow()
            case _ => node
        }
    }
}

@Test
class Test{
    var file = Option<SourceFile>.None

    @BeforeAll
    func readFile(): Unit {
        let node = parsePackage("package1")
        let pkg = node.node.getOrThrow() as Package
        file = pkg.getOrThrow().srcFile[0]
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(file.getOrThrow(), detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
package www .w .
 w. wx

func    foo (

) {   0}""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(file.getOrThrow())
        @Expect(newNode.toString().replace("\r\n", "\n"), """
package www .w .
 w. wx

func    foo (

) {   0}""")

        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"), """
// test_file_input1.cj
package www .w .
 w. wx

func    foo (

) {   0}
// test_file_input2.cj
package www .w .
 w. wx

abstract class E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}

@Frozen
@Deprecated[ message: "tt" ]
   public func foo<T, w>   (
x: Bool,
  y: Int64, z!: Float64
): Unit  where T <: XX & XX , w <: XX {
    1
    1.0
 foo< Int64  >
 ()
}""")
    }

    @TestCase
    func testException() {
        try {
            let rewrite = RewriteNodeError()
            let newNode = rewrite.walk(file.getOrThrow())
        } catch (e: Exception) {
            @Expect(e.message, "ParseException: found more than one package declaration for the package.")
        }
    }

    @TestCase
    func testRewriteBinary() {
        let rewrite = ASTRewriteBinary()
        let decl = file.getOrThrow().topLevelDecls[0]
        let newNode = rewrite.walk(decl)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
main(

) : Int64{
  a*b

}""")

        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"), """
package www .w .
 w. wx

main(

) : Int64{
  a*b

}""")

        @Expect(newNode.parentNode.getOrThrow().parentNode.getOrThrow().toString().replace("\r\n", "\n"), """
// test_file_input1.cj
package www .w .
 w. wx

main(

) : Int64{
  a*b

}
// test_file_input2.cj
package www .w .
 w. wx

abstract class E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}

@Frozen
@Deprecated[ message: "tt" ]
   public func foo<T, w>   (
x: Bool,
  y: Int64, z!: Float64
): Unit  where T <: XX & XX , w <: XX {
    1
    1.0
 foo< Int64  >
 ()
}""")
    }
}