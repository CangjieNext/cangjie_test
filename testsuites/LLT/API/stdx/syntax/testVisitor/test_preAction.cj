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
import std.fs.*

public class ASTVisitorTest1 <: ASTVisitor {
    var recordStr = ""
    override public func preAction(node: SyntaxTreeNode): PreActionMode {
        recordStr += "preAction, visit: ${node.toString()}\n"
        return PreActionMode.Continue
    }
}

public class ASTVisitorTest2 <: ASTVisitor {
    var recordStr = ""
    override public func preAction(node: SyntaxTreeNode): PreActionMode {
        recordStr += "preAction, visit: ${node.toString()}\n"
        return match (node) {
            case v: VarDecl => PreActionMode.Skip
            case _ => PreActionMode.Continue
        }
    }
}

public class ASTVisitorTest3 <: ASTVisitor {
    var recordStr = ""
    override public func preAction(node: SyntaxTreeNode): PreActionMode {
        recordStr += "preAction, visit: ${node.toString()}\n"
        return match (node) {
            case v: VarDecl => 
            if (v.name == "stop") {
                PreActionMode.Stop
            } else {
                PreActionMode.Continue
            }
            case _ => PreActionMode.Continue
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
    func testPreAction01() {
        let varDecl = (decls[0] as VarDecl).getOrThrow()
        let visit = ASTVisitorTest1()
        visit.walk(varDecl)
        @Expect(visit.recordStr, """
preAction, visit: var a = 1
preAction, visit: a
preAction, visit: 1
""")
    }

    @TestCase
    func testPreAction02() {
        let visit = ASTVisitorTest2()
        visit.walk(file.getOrThrow())
        @Expect(visit.recordStr, """
preAction, visit: var a = 1
var stop = a
var b = 1 + 1
preAction, visit: var a = 1
preAction, visit: var stop = a
preAction, visit: var b = 1 + 1
""")
    }

    @TestCase
    func testPreAction03() {
        let visit = ASTVisitorTest3()
        visit.walk(file.getOrThrow())
        @Expect(visit.recordStr, """
preAction, visit: var a = 1
var stop = a
var b = 1 + 1
preAction, visit: var a = 1
preAction, visit: a
preAction, visit: 1
preAction, visit: var stop = a
""")
    }
}