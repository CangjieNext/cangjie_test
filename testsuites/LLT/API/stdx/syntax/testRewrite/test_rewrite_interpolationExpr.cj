/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_02.cj 
// (not Windows) EXEC: dos2unix test_file_02.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class RewriteNode <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case c: StrInterpolationContent => 
                let node = parseText(#""${x}""#)
                var litconststrexpr = (node.node.getOrThrow() as LitConstStrExpr).getOrThrow()
                return match(litconststrexpr.strPartExprs[0]) {
                    case StrLiteralPart.StrInterpolation(strInterpolationContent) => strInterpolationContent
                    case _ => throw Exception()
                }
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
        let node = parseFile("test_file_02.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(decls[1], detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), #"var b = "num = ${x}""#)
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(decls[1])
        @Expect(newNode.toString().replace("\r\n", "\n"), #"var b = "num = ${x}""#)
        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"),  #"/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// test comment
var a = 1
var b = "num = ${x}""#)
    }
}