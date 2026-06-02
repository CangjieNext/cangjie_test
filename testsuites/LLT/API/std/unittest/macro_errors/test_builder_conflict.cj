/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f %cmp_utest_opt
// ASSERT: scan @TestBuilder macro can't be used together with @Test.

@TestBuilder
@Test
func f() {
    // in this case we would prefer more precise diagnostic
    TestSuite.builder("foo").build()
}
