// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package boo

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
        //期望concat("1", "2") 运行结果为 "12"
        @Assert(concat("1", "2"), "12")
        @Assert(concat("1", "3"), "13")
    }
}
