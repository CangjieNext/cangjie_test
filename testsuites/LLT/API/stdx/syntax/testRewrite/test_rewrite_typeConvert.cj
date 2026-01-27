/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_typeConvert.cj
// (not Windows) EXEC: dos2unix test_file_typeConvert.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteBinary <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
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
        let node = parseFile("test_file_typeConvert.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let rewrite = ASTRewriteBinary()
        let newNode = rewrite.walk(varDecl, detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
let b = Int32(a)""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let rewrite = ASTRewriteBinary()
        let newNode = rewrite.walk(varDecl)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
let b = Int32(a)""")
        println(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"))
        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"), """
const a = 1
let b = Int32(a)""")
    }
}