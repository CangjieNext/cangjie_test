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
    @BeforeAll
    func f1() {
        println("f1")
    }

    @BeforeEach
    func f2(testCaseName: String) {
        println("f2: ${testCaseName}")
    }

    @AfterEach
    func f3(testCaseName: String) {
        println("f3: ${testCaseName}")
    }

    @AfterEach
    func f4() {
        println("f4")
    }

    @AfterEach
    func f5(testCaseName: String) {
        println("f5: ${testCaseName}")
    }

    @TestCase[x in [ "a", "b" ]]
    func case1(x: String) {
        println("case1 ${x}")
    }

    @TestCase[x in [ 0, 1, 2 ]]
    func case2(x: Int64) {
        println("case2 ${x}")
    }
}

/* SCAN-IN
f1
f2: case1
case1 a
case1 b
f3: case1
f4
f5: case1
f2: case2
case2 0
case2 1
case2 2
f3: case2
f4
f5: case2
 */
