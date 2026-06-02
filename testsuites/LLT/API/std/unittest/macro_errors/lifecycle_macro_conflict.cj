/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f

@UnittestOption[Int64](x)

@Test
class BenchClash {
    @AfterAll
    @Bench
    func x1() {
    }

    @TestCase
    @BeforeEach
    func x2() {
    }

    @Configure[x: 2]
    @BeforeAll
    func x3() {
    }
}

/* SCAN-IN
Test framework: macro failed to expand.
@AfterAll macro can't be used together with @Bench.
@BeforeEach macro can't be used together with @TestCase.
@Configure macro must be used together with one of: @Test, @TestBuilder, @TestTemplate, @TestCase, @Bench.
@BeforeAll macro can't be used together with @Configure.
 */
