/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_enumConstructor.cj
// (not Windows) EXEC: dos2unix test_file_enumConstructor.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteBode <: ASTRewriter {
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
        let node = parseFile("test_file_enumConstructor.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let decl = (decls[0] as EnumDecl).getOrThrow()
        let rewrite = ASTRewriteBode()
        let newNode = rewrite.walk(decl, detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
public enum B {
    | @Deprecated["EnumA"]
    EnumA
    | @EnumField["EnumB"]
    EnumB
    | @EnumField[v: "EnumC"]
    EnumC(a, b)
    | @!EnumField["EnumD"]
    EnumD
    | @!EnumField[v: "EnumE"]
    EnumE(a, b)
    | @!EnumField
    @EnumField[v: "EnumF"]
    @!EnumField[v: "EnumF"]
    EnumF(a, b)
    | ...
    func a() {}
}""")
        @Expect(newNode.parentNode, None)
    }
}