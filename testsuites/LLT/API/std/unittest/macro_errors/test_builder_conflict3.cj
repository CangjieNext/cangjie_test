/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f
// ASSERT: scan @TestBuilder macro can't be used together with @Test.

import std.unittest.*
import std.unittest.testmacro.*

@Test
@TestBuilder
func f(): TestSuite {
    TestSuite.builder("foo").build()
}

main() {
    // not using --test because it would force other check in compiler
}
