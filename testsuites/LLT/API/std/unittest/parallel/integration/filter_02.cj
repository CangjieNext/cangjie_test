/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --parallel=44 --filter=Test3.* --no-color 2>&1 | compare %f
// ASSERT: scan-2 sameName
// ASSERT: scan-2 case32
// ASSERT: scan-2 case33
// ASSERT: scan-2 case34
// ASSERT: scan-2 case35
// ASSERT: scan-2 case36
// ASSERT: scan-2 case37
// ASSERT: scan-2 case38
// ASSERT: scan-1 [ PASSED ] CASE: sameName
// ASSERT: scan-1 [ PASSED ] CASE: case32
// ASSERT: scan-1 [ PASSED ] CASE: case33
// ASSERT: scan-1 [ PASSED ] CASE: case34
// ASSERT: scan-1 [ PASSED ] CASE: case35
// ASSERT: scan-1 [ PASSED ] CASE: case36
// ASSERT: scan-1 [ PASSED ] CASE: case37
// ASSERT: scan-1 [ PASSED ] CASE: case38
// ASSERT: scan-1 PASSED: 8

@Test
class Test1 {
    @TestCase
    func sameName(): Unit {
        println("sameName")
    }

    @TestCase
    func case12(): Unit {
        println("case12")
    }

    @TestCase
    func case13(): Unit {
        println("case13")
    }
}

@Test
class Test2 {
    @TestCase
    func case21(): Unit {
        println("case21")
    }

    @TestCase
    func sameName(): Unit {
        println("sameName")
    }
}

@Test
@Parallel
class Test3 {
    @TestCase
    func sameName(): Unit {
        println("sameName")
    }

    @TestCase
    func case32(): Unit {
        println("case32")
    }

    @TestCase
    func case33(): Unit {
        println("case33")
    }

    @TestCase
    func case34(): Unit {
        println("case34")
    }

    @TestCase
    func case35(): Unit {
        println("case35")
    }

    @TestCase
    func case36(): Unit {
        println("case36")
    }

    @TestCase
    func case37(): Unit {
        println("case37")
    }

    @TestCase
    func case38(): Unit {
        println("case38")
    }
}
