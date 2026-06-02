/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

//用户测试功能
func concat(s1: String, s2: String): String {
    return s1 + s2
}

//简单用例
@Test
public class TestCCC {
    @TestCase
    func sayhi(): Unit {
        //期望 concat("1", "2") 运行结果为 "12"
        @Expect(concat("1", "2"), "12")
        @Expect(concat("1", "2"), "12")
        @Expect(concat("1", "2"), "12")
        @Expect(concat("3", "2"), "23")
        @Expect(concat("1", "2"), "12")
        @Expect(concat("1", "2"), "12")
        @Expect(concat("1", "2"), "12")
        @Expect(concat("1", "2"), "12")
        @Expect("13", concat("4", "2"))
    }
}

/* SCAN-IN
    Expect Failed: concat("3", "2") != "23"
        concat("3", "2"): "32"
                    "23": "23"

    Expect Failed: "13" != concat("4", "2")
                    "13": "13"
        concat("4", "2"): "42"
 */
