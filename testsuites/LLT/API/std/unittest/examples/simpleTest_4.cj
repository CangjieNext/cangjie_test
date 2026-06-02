/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-0: %run %run_opt %output %run_utest_opt
@Test
class MySimpleTest {
    @TestCase
    func test1(): Unit {
        println("test1")
    }

    @TestCase
    func test2(): Unit {
        println("test2")
    }

    @TestCase
    func test3(): Unit {
        println("test3")
    }

    public override func afterAll(): Unit {
        println("afterAll")
    }

    public override func afterEach(): Unit {
        println("afterEach")
    }

    public override func beforeAll(): Unit {
        println("beforeAll")
    }

    public override func beforeEach(): Unit {
        println("beforeEach")
    }
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
