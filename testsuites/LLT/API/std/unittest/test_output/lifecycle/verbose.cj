/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --capture-output --show-all-output | compare %f
// ASSERT: scan-1 Hello from beforeAll
// ASSERT: scan-1 Hello from afterAll
// ASSERT: scan-2 Hello from beforeEach
// ASSERT: scan-2 Hello from afterEach
// ASSERT: scan-1 Hello from case1
// ASSERT: scan-1 Hello from case2

@Test
class Tests {
    @BeforeAll
    func beforeAll() {
        println("Hello from beforeAll")
    }

    @AfterAll
    func afterAll() {
        println("Hello from afterAll")
    }

    @BeforeEach()
    func beforeEach() {
        println("Hello from beforeEach")
    }

    @AfterEach
    func afterEach() {
        println("Hello from afterEach")
    }

    @TestCase
    func case1() {
        @Expect(1, 2)
        @Expect(2, 3)
        println("Hello from case1")
    }

    @TestCase
    func case2() {
        println("Hello from case2")
    }
}
