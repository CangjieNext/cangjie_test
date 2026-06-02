package my_pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
class M {
    @TestCase
    func testA(){
        @Assert(concatM("1", "355"), "1355")
        @Assert(concatM("1", "3"), "13")
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
