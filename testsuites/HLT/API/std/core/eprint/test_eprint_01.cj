/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1| compare %f
// ASSERT: scan eprint1仓颉鸿蒙♫♬♪♩✲✳❃❂❁❀✿✾✽倉罷筆畢邊賓參倉産123abc

@Test
class Test_eprint_01 {
    @TestCase
    func test_eprint_01(): Unit {
        eprint("eprint1", flush: true)
    }

    @TestCase
    func test_eprint_02(): Unit {
        eprint("仓颉鸿蒙", flush: false)
    }

    @TestCase
    func test_eprint_03(): Unit {
        eprint("♫♬♪♩✲✳❃❂❁❀✿✾✽", flush: true)
    }

    @TestCase
    func test_eprint_04(): Unit {
        eprint("倉罷筆畢邊賓參倉産", flush: false)
    }

    @TestCase
    func test_eprint_05(): Unit {
        eprint("123abc", flush: true)
    }

    @TestCase
    func test_eprint_06(): Unit {
        eprint("", flush: false)
    }
}
