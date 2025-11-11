/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_file_03.cj
// (not Windows) EXEC: dos2unix test_file_03.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

public class ASTRewriteModify <: ASTRewriter {
    var count = 0
    override public func rewrite(node: SyntaxTreeNode): SyntaxTreeNode {
        return match (node) {
            case m: Modifier => count++
                node
            case v: VArrayType => let node = parseText("VArray<Int64, $5>(repeat: 1)")
                let vType = (node.node.getOrThrow() as VArrayExpr).getOrThrow().vArrayType
                return vType
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
        let node = parseFile("test_file_03.cj")
        file = node.node.getOrThrow() as SourceFile
        decls = file.getOrThrow().topLevelDecls
    }

    @TestCase
    func testDetachTrue() {
        let rewrite = ASTRewriteModify()
        let newNode = rewrite.walk(file.getOrThrow(), detach: true)
        @Expect(rewrite.count, 7)
        @Expect(newNode.parentNode, None)
    }

    @TestCase
    func testDetachFalse() {
        let f = (decls[2] as FuncDecl).getOrThrow()
        let rewrite = ASTRewriteModify()
        let newNode = rewrite.walk(f)
        @Expect(rewrite.count, 1)
        @Expect(newNode.toString(), """
const func foo(a: Buffer, b: Buffer) {
   if (let Some(v) <- certificateInfo.subject) {
        rawSubject = getRawName(v)
    }
    let b: VArray<Int64, $5> = VArray<Int64, $5>(repeat: (1, 1))
    return 0
}""")
        @Expect(newNode.parentNode.getOrThrow().toString(),  """
const a = 1

abstract class Buffer {
    protected static const DEFAULT = 4096

    operator func +() {
        const value = 1
        0
    }
}

const func foo(a: Buffer, b: Buffer) {
   if (let Some(v) <- certificateInfo.subject) {
        rawSubject = getRawName(v)
    }
    let b: VArray<Int64, $5> = VArray<Int64, $5>(repeat: (1, 1))
    return 0
}

unsafe private func goo() {
    const a = 1
    0
}

foreign func getCPtr(): Unit""")
    }
}