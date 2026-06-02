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

public class ASTVisitorTest1 <: ASTVisitor {
    var recordStr = ""
    override public func postAction(node: SyntaxTreeNode): PostActionMode {
        recordStr += "postAction, visit: ${node.toString().replace("\r\n", "\n")}\n"
        return PostActionMode.Continue
    }
}

public class ASTVisitorTest2 <: ASTVisitor {
    var recordStr = ""
    override public func postAction(node: SyntaxTreeNode): PostActionMode {
        recordStr += "postAction, visit: ${node.toString().replace("\r\n", "\n")}\n"
        return match (node) {
            case v: VarDecl => 
            if (v.name == "stop") {
                PostActionMode.Stop
            } else {
                PostActionMode.Continue
            }
            case _ => PostActionMode.Continue
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
    func testpostAction01() {
        let varDecl = (decls[0] as VarDecl).getOrThrow()
        let visit = ASTVisitorTest1()
        visit.walk(varDecl)
        @Expect(visit.recordStr, """
postAction, visit: a
postAction, visit: 1
postAction, visit: var a = 1
""")
    }

    @TestCase
    func testpostAction02() {
        let visit = ASTVisitorTest2()
        visit.walk(file.getOrThrow())
        @Expect(visit.recordStr, """
postAction, visit: a
postAction, visit: 1
postAction, visit: var a = 1
postAction, visit: stop
postAction, visit: a
postAction, visit: var stop = a
""")
    }
}