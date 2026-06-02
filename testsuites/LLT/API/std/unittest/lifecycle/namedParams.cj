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
class FooTest {
    @BeforeEach
    func f1(a!: String) {
        println("f1: ${a}")
    }

    @BeforeEach
    func f2(b!: String) {
        println("f2: ${b}")
    }

    @BeforeEach
    func f3(c: String) {
        println("f3: ${c}")
    }

    @TestCase
    func abcd() {
    }

    @TestCase
    func bcde() {
    }
}

/* SCAN-IN
f1: abcd
f2: abcd
f3: abcd
f1: bcde
f2: bcde
f3: bcde
 */
