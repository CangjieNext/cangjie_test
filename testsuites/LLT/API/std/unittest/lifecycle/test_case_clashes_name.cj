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
class MySimpleTest {
    @BeforeEach
    func a() {
        println("a")
    }

    @TestCase
    func beforeAll() {
        println("b")
    }

    @AfterEach
    func c() {
        println("c")
    }
}

/* SCAN-IN
a
b
c
 */
