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
    func f1(): Unit {
        println("f1")
    }

    @BeforeAll
    protected func f2(): Unit {
        println("f2")
    }

    @AfterAll
    protected func aa(): Unit {
        println("aa")
        f1()
        f2()
    }

    @TestCase
    public func t1() {
        println("t1")
        f2()
    }

    @TestCase
    public func t2() {
        println("t2")
        f1()
    }
}

/* SCAN-IN
f2
f1
t1
f2
f1
t2
f1
aa
f1
f2
 */
