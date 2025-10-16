/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan-2 Invalid syntax for @PowerAssert: use @PowerAssert(a, b), @PowerAssert(b), @PowerAssert(a 'compare_operator' b), @PowerAssert(a 'compare_operator' b, delta: d) or @PowerAssert(a, b, delta: d).
// ASSERT: scan @PowerAssert()
// ASSERT: scan @PowerAssert(true, false, true)

@Test
class Test {
    /**
     * Compilation should fail.
     */
    @TestCase
    func emptyInput() {
        @PowerAssert()
    }

    /**
     * Compilation should fail.
     */
    @TestCase
    func extraParametersInput() {
        @PowerAssert(true, false, true)
    }

    @TestCase
    func twoArgs() {
        @PowerAssert(true, false)
    }

    @TestCase
    func oneArg() {
        @PowerAssert(true == false)
    }
}
