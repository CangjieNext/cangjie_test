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
@Types[U in<String, Int64>]
class FooTest<U> {
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

    @AfterAll
    func f5() {
        println("-----")
    }

    @TestCase
    func case1() {
        println("case1")
    }

    @TestCase[x in [ 0, 1 ]]
    func case2(x: Int64) {
        println("case2 ${x}")
    }
}

/* SCAN-IN
f1
f2: case1
case1
f3: case1
f4
f5: case1
f2: case2
case2 0
case2 1
f3: case2
f4
f5: case2
-----
f1
f2: case1
case1
f3: case1
f4
f5: case1
f2: case2
case2 0
case2 1
f3: case2
f4
f5: case2
-----
 */
