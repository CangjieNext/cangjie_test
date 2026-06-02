/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-0: %run %run_opt %output %run_utest_opt

// Function under test
func concat(s1: String, s2: String): String {
    return s1 + s2
}

// Test itself
@Test
func testConcat(): Unit {
    //期望 concat("1", "2") 运行结果为 "12"
    @Assert(concat("1", "2"), "12")
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
