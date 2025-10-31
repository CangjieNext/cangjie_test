/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/package1 sourceFile/package2
// (not Windows) EXEC: dos2unix package1/test_file_input1.cj package1/test_file_input2.cj  package2/test_file_input1.cj package2/test_file_input2.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class RewriteNode <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case f: Package => return parsePackage("package2").node.getOrThrow()
            case binaryExpr: BinaryExpr => parseText("a*b").node.getOrThrow()
            case _ => node
        }
    }
}

@Test
class Test{
    var pkg = Option<Package>.None

    @BeforeAll
    func readFile(): Unit {
        let node = parsePackage("package1")
        pkg = node.node.getOrThrow() as Package
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(pkg.getOrThrow(), detach: true)
        println(newNode)
        @Expect(newNode.toString(), """
// test_file_input1.cj
package www.w.w.wx

main(): Int64 {
    2 + 3
}
// test_file_input2.cj
package www.w.w.wx

var a = 1""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(pkg.getOrThrow())
        @Expect(newNode.toString(), """
// test_file_input1.cj
package www.w.w.wx

main(): Int64 {
    2 + 3
}
// test_file_input2.cj
package www.w.w.wx

var a = 1""")
        @Expect(newNode.parentNode, None)
    }
}