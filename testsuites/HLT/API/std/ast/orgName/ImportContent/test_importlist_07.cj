/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// ASSERT: scan lex_cannot_start_with_digit

import std.ast.*



@Test
func test_importList() {
    var input: Tokens = quote(public import 000::ast.userdefine)
}
