/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_func.cj
// (not Windows) EXEC: dos2unix test_file_func.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class RewriteNode <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case m: Modifier => 
                var d = (parseText("""
public func a(){}
""").node.getOrThrow() as FuncDecl).getOrThrow()
                return d.modifiers[0]
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
        let node = parseFile("test_file_func.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(file.getOrThrow(), detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// top-level decls
var a = 1
public var stop = a
var b = 1 + 1

func foo(a: Int64) {
    var a = 1
    println(a)
}

public func goo() {
    var a = 1
    println(a)
}

main() { // block
    let test = b // trailing comment
    0
}""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(decls[1])
        @Expect(newNode.toString().replace("\r\n", "\n"), """
public var stop = a""")
        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"),  """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// top-level decls
var a = 1
public var stop = a
var b = 1 + 1

func foo(a: Int64) {
    var a = 1
    println(a)
}

private func goo() {
    var a = 1
    println(a)
}

main() { // block
    let test = b // trailing comment
    0
}""")
    }
}