// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not Expect Failed

import std.unittest.*
import std.unittest.testmacro.*
import std.ast.*

@Test
func test() {
    var a = 1
    var b = false
    var c = a + 1
    while (true) {
        break
    }
    var d = (0, 1, 2, 3)
    if (!b) {
        a = 2
        c++
    }
    @Expect(a, 2)
    @Expect(c, 3)
}
