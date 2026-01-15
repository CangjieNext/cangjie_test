/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

@Test
class test_01{
    @TestCase
func test_packageHeader() {
    let _packageHeader = cangjieLex("macro package a.b.c")
    _packageHeader.dump()
    @Assert(_packageHeader.toString(), "macro package a.b.c")
}

// ASSERT: regex description: macro, token_id: [0-9]+, token_literal_value: macro, fileID: 0, line: 1, column: 1
// ASSERT: regex description: package, token_id: [0-9]+, token_literal_value: package, fileID: 0, line: 1, column: 7
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a, fileID: 0, line: 1, column: 15
// ASSERT: regex description: dot, token_id: [0-9]+, token_literal_value: ., fileID: 0, line: 1, column: 16
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: b, fileID: 0, line: 1, column: 17
// ASSERT: regex description: dot, token_id: [0-9]+, token_literal_value: ., fileID: 0, line: 1, column: 18
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: c, fileID: 0, line: 1, column: 19
}