/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_matchCase.cj
// (not Windows) EXEC: dos2unix test_file_matchCase.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteNode <: ASTRewriter {
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
        let node = parseFile("test_file_matchCase.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let decl = (decls[0] as MainDecl).getOrThrow()
        let rewrite = ASTRewriteNode()
        let newNode = rewrite.walk(decl, detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
main() {
    match (ty) {
        case a: A =>
            let value = stringBuilder.build(a)
            Info.v = value
            Info.infoMap.add(str, value)
        case _ => { => }
    }
    0
}""")
        @Expect(newNode.parentNode, None)
    }
}