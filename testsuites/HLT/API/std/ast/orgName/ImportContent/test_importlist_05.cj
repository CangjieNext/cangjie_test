/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

var input: Tokens = quote(public import org1::std::ast.userdefine)

@Test
class Test_01 {
    @TestCase
    func test_importList() {
        @AssertThrows[ParseASTException](parseProgram(input))
        @AssertThrows[ASTException](ImportList(input))
    }
}
