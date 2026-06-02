/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (LINUX) EXEC-PIPE-1: %run %run_opt %output %run_utest_opt | compare %f

package test.unittest

func x(): Unit {
    throw MyException()
}

class MyException <: Exception {}

@Test
public class unittest_ {
    @TestCase
    func lambda(): Unit {
        x()
    }
}

// ASSERT: scan exception_rendering3.cj:7
// ASSERT: scan ERROR: 1
// ASSERT: scan unittest_.lambda
// ASSERT: scan-not at std/unittest
