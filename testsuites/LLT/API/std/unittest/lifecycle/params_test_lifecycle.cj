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
        println("ba")
    }

    @BeforeEach
    func f2() {
        println("be")
    }

    @AfterEach
    func f3() {
        println("ae")
    }

    @AfterAll
    func f4() {
        println("aa")
    }

    @Types[T in<Int64, String>]
    @Configure[randomSeed: 1, generationSteps: 2, reductionSteps: 0]
    @TestCase[x in random()]
    func testFoo<T>(x: T): Unit {
        match (x) {
            case _: String => println("s")
            case _: Int64 => println("i")
            case _ => ()
        }
    }
}

/* SCAN-IN
ba
be
i
i
ae
be
s
s
ae
aa
 */
