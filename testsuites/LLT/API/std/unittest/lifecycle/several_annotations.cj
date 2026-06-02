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
    @AfterAll
    func aa1(): Unit {
        println("aa1")
    }

    @AfterAll
    protected func aa2(): Unit {
        println("aa2")
    }

    @AfterEach
    private func ae1(): Unit {
        println("ae1")
    }

    @AfterEach
    public func ae2(): Unit {
        println("ae2")
    }

    @BeforeAll
    public func ba1(): Unit {
        println("ba1")
    }

    @BeforeAll
    public func ba2(): Unit {
        println("ba2")
    }

    @BeforeEach
    public func be1(): Unit {
        println("be1")
    }

    @BeforeEach
    public func be2(): Unit {
        println("be2")
    }

    @TestCase
    public func t1() {}

    @TestCase
    public func t2() {}
}

/* SCAN-IN
ba1
ba2
be1
be2
ae1
ae2
be1
be2
ae1
ae2
aa1
aa2
 */
