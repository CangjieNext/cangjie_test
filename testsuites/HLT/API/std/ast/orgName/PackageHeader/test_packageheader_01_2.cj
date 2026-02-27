/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

@Test
class Test_01 {
    @TestCase
    func test_packageHeader() {
        let _packageHeader = cangjieLex("package a")
        _packageHeader.dump()
        @Assert(_packageHeader.toString(), "package a")
    }

    // ASSERT: regex description: package, token_id: [0-9]+, token_literal_value: package, fileID: 0, line: 1, column: 1
    // ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a, fileID: 0, line: 1, column: 9
}
