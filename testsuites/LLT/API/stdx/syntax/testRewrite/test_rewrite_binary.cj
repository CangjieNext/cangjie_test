/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_01.cj
// (not Windows) EXEC: dos2unix test_file_01.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteBinary <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case binaryExpr: BinaryExpr => parseText("a*b").node.getOrThrow()
            case _ => node
        }
    }
}

public class ASTRewriteBinary2 <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case binaryExpr: BinaryExpr => parseText("a++").node.getOrThrow()
            case _ => node
        }
    }
}

@Test
class Test{
    var file = Option<SourceFile>.None
    var decls: Array<Decl> = []

    @BeforeAll
    func readFile(): Unit {
        let node = parseFile("test_file_01.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let varDecl = (decls[0] as VarDecl).getOrThrow()
        let rewrite = ASTRewriteBinary()
        let newNode = rewrite.walk(varDecl, detach: true)
        @Expect(newNode.toString(), """
var a = a*b""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let varDecl = (decls[0] as VarDecl).getOrThrow()
        let rewrite = ASTRewriteBinary()
        let newNode = rewrite.walk(varDecl)
        @Expect(newNode.toString(), """
var a = a*b""")
        @Expect(newNode.parentNode.toString(),  """
Some(var a = a*b
var b = b + 1)""")
    }

    @TestCase
    func testException() {
        try {
            let varDecl = (decls[0] as VarDecl).getOrThrow()
            let rewrite = ASTRewriteBinary2()
            let _ = rewrite.walk(varDecl, detach: true)          
        } catch (e: Exception) {
            @Expect(e.message, "RewriteException: The type of the rewritten node does not match the type of the original node.")
        }
    }
}