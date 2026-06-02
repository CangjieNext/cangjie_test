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
    @AfterAll
    func a() {
        println("a")
    }

    @TestCase
    func t1() {
        println("t1")
    }

    @TestCase
    func t2() {
        println("t2")
    }

    @AfterEach
    @BeforeAll
    func c() {
        println("b")
    }
}

/* SCAN-IN
b
a
t1
b
a
t2
b
a
 */
