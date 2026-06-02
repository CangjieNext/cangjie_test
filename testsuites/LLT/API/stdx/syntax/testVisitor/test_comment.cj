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

public class CountComment <: ASTVisitor {
    var count = 0
    override public func postAction(node: SyntaxTreeNode): PostActionMode {
        return match (node) {
            case v: Comment => count++
            PostActionMode.Continue
            case _ => PostActionMode.Continue
        }
    }
}

@Test
class Test{
    var file = Option<SourceFile>.None

    @BeforeAll
    func readFile(): Unit {
        let node = parseFile("test_file_02.cj")
        file = node.node.getOrThrow() as SourceFile
    }

    @TestCase
    func test01() {
        let visit = CountComment()
        visit.walk(file.getOrThrow())
        @Expect(visit.count, 4)
    }
}