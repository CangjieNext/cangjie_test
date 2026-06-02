/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color | compare %f
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

/* SCAN-IN
ba
aa
 */
