/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1| compare %f
// ASSERT: scan eprint1
// ASSERT: scan 仓颉鸿蒙
// ASSERT: scan ♫♬♪♩✲✳❃❂❁❀✿✾✽
// ASSERT: scan 倉罷筆畢邊賓參倉産
// ASSERT: scan 123abc
// ASSERT: scan 123abc
// ASSERT: scan \n
@Test
class Test_eprintln_02 {
    @TestCase
    func test_eprintln_01(): Unit {
        eprintln("eprint1")
    }

    @TestCase
    func test_eprintln_02(): Unit {
        eprintln("仓颉鸿蒙")
    }

    @TestCase
    func test_eprintln_03(): Unit {
        eprintln("♫♬♪♩✲✳❃❂❁❀✿✾✽")
    }

    @TestCase
    func test_eprintln_04(): Unit {
        eprintln("倉罷筆畢邊賓參倉産")
    }

    @TestCase
    func test_eprintln_05(): Unit {
        eprintln("123abc")
    }

    @TestCase
    func test_eprintln_06(): Unit {
        eprintln("")
    }
}
