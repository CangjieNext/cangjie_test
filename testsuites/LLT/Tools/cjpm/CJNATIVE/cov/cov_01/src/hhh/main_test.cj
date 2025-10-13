// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package aaa.hhh

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class TestM {
    @TestCase
    func sayhi(): Unit {
        @Assert(concatH("1", "2"), "12")
        @Assert(concatH("1", "3"), "13")
    }
}
