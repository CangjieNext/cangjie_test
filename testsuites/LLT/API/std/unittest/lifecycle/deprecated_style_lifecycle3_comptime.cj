/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan-not deprecated
// ASSERT: scan-not Warning
@Test
class WhenAnnotationsArePresentOldNamesDoNotMatter {
    @BeforeAll
    protected func afterAll(): Unit {
        println("ba")
    }

    @AfterAll
    protected func beforeAll(): Unit {
        println("aa")
    }

    @TestCase
    public func t1() {}

    @TestCase
    public func t2() {}
}
