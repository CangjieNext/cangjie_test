/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt | compare %f

package p1.p2

func x(): Unit {
    let f = spawn {
        throw MyException()
    }
    f.get()
}

class MyException <: Exception {}

@Test
public class MyTestClass {
    @TestCase
    func testException(): Unit {
        x()
    }
}

// ASSERT: scan exception_rendering2.cj:20
// ASSERT: scan ERROR: 1
// ASSERT: scan-not MyTestClass.testException()
// ASSERT: scan lambda
