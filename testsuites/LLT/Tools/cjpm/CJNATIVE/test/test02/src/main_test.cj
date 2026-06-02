// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase

@Test
class C {
    @TestCase
    func ok() {
        @Expect(2, 2)
    }

    static init() {
        println("e1eiop2e4j123j23eiojw3iope3jop")
        throw Exception("i am a dead worker")
    }
}
