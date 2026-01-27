/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class RewriteNode <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case p: GenericParam => 
                let f = parseText("func a<E>(a: Int32){}").node.getOrThrow() as FuncDecl
                return f.getOrThrow().genericParams[0]
            case _ => node
        }
    }
}

@Test
class Test {
    var classDecl = Option<ClassDecl>.None

    @BeforeAll
    func readFile(): Unit {
        let node = parseText("""
class C {
    func foo<T>(x: T): T {
        return x
    }
}
""")
        classDecl = node.node.getOrThrow() as ClassDecl
        println(classDecl.getOrThrow())
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(classDecl.getOrThrow(), detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
class C {
    func foo<E>(x: T): T {
        return x
    }
}""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let funcDecl = (classDecl.getOrThrow().body.memberDecls[0] as FuncDecl).getOrThrow()
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(funcDecl)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
func foo<E>(x: T): T {
        return x
    }""")
        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"),  """
{
    func foo<E>(x: T): T {
        return x
    }
}""")
    }
}