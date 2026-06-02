// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.koo

import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase

@Test
class Koo {
    static init() {
        println("some info")
        throw Exception("DeadWorker_2")
    }
}
