/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt --no-color

package std.unittest.test

import std.unittest.common.*

@Test[c in [RED, GREEN, YELLOW, BLUE, CYAN, MAGENTA, GRAY]]
func testPrettyColors(c: Color): Unit {
    @Assert(Color.deserialize(c.serializeInternal()), c)
}
