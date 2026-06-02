// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import pkg.sub_pkg.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestM {
    @TestCase
    func sayhi(): Unit {
        @Assert(concatM2("1", "3"), "13")
    }
}
