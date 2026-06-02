/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f
@Test
class UsingOldWithoutOverrideKeyword {
    protected func afterAll(): Unit {
        println("aa")
    }

    protected func beforeAll(): Unit {
        println("ba")
    }

    protected func beforeEach(): Unit {
        println("be")
    }

    public func afterEach(): Unit {
        println("ae")
    }

    @TestCase
    public func t1() {}

    @TestCase
    public func t2() {}
}

/* SCAN-IN
Warning: overriding func 'afterAll' is deprecated and will be disallowed in a subsequent release. Use @AfterAll macro instead.
Warning: overriding func 'beforeAll' is deprecated and will be disallowed in a subsequent release. Use @BeforeAll macro instead.
Warning: overriding func 'beforeEach' is deprecated and will be disallowed in a subsequent release. Use @BeforeEach macro instead.
Warning: overriding func 'afterEach' is deprecated and will be disallowed in a subsequent release. Use @AfterEach macro instead.
 */
