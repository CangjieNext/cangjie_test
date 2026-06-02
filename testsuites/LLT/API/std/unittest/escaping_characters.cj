/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan ca = 中文2
// ASSERT: scan ca = \\u{0002}\\r

import std.regex.*

@Test[ca in [ "中文2" ]]
func testChinese(ca: String) {
    @Expect(ca, "1")
}

@Test[ca in [ "\u{0002}\r" ]]
func testControl(ca: String) {
    @Expect(ca, "1")
}
