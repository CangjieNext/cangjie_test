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
    var num = 0
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case f: FuncDecl => 
                var newNode = parseText("""
public func a${num}(){}
""").node.getOrThrow()
                num++
                return newNode
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
        @Expect(newNode.toString(), """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// top-level decls
var a = 1
private var stop = a
var b = 1 + 1

public func a0(){}

public func a1(){}

main() { // block
    let test = b // trailing comment
    0
}""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = RewriteNode()
        let newNode = rewrite.walk(decls[3])
        @Expect(newNode.toString(), """
public func a0(){}""")
println(newNode.toString())
println(newNode.parentNode.getOrThrow().toString())
        @Expect(newNode.parentNode.getOrThrow().toString(),  """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// top-level decls
var a = 1
private var stop = a
var b = 1 + 1

public func a0(){}

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