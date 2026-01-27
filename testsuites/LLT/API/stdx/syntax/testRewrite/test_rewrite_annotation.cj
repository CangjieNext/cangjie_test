/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_anno.cj
// (not Windows) EXEC: dos2unix test_file_anno.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteAnno <: ASTRewriter {
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case anno: Annotation => 
                var d = (parseText("""
@When[cjc_version < "1.0.1"]
func a(){}
""").node.getOrThrow() as FuncDecl).getOrThrow()
                let anno1 = d.annotations[0]
                d = (parseText("""
@When[cjc_version >= "1.0.1"]
func a(){}
""").node.getOrThrow() as FuncDecl).getOrThrow()
                let anno2 = d.annotations[0]
                return match (((anno.arguments[0].value as BinaryExpr).getOrThrow()).opKind) {
                    case Lt => anno1
                    case _ => anno2
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
        let node = parseFile("test_file_anno.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = ASTRewriteAnno()
        let newNode = rewrite.walk(file.getOrThrow(), detach: true)
        @Expect(newNode.toString().replace("\r\n", "\n"), """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@When[cjc_version < "1.0.1"]
func foo() {
    println("cjc_version is less than 0.18.6")
}
@When[cjc_version >= "1.0.1"]
func foo() {
    println("cjc_version is greater than or equal to 0.18.6")
}

main() { // block
    foo()
}""")
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let rewrite = ASTRewriteAnno()
        let newNode = rewrite.walk(decls[0])
        @Expect(newNode.toString().replace("\r\n", "\n"), """
@When[cjc_version < "1.0.1"]
func foo() {
    println("cjc_version is less than 0.18.6")
}""")
        @Expect(newNode.parentNode.getOrThrow().toString().replace("\r\n", "\n"),  """
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@When[cjc_version < "1.0.1"]
func foo() {
    println("cjc_version is less than 0.18.6")
}
@When[cjc_version >= "0.18.6"]
func foo() {
    println("cjc_version is greater than or equal to 0.18.6")
}

main() { // block
    foo()
}""")
    }
}