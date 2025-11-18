/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan Invalid syntax for @PowerAssert: use either @PowerAssert(a, b) or @PowerAssert(b)
@Test
class Test_PowerAssert {
    @TestCase
    func test01() {
        @PowerAssert()
    }
}
