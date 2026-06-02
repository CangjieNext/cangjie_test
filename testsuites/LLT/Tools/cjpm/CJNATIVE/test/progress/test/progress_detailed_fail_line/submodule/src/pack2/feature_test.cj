// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package submodule.pack2

import std.sync.*

@Test
class Pack2 {
    @TestCase
    func fffail1() {
        sleep(500 * Duration.millisecond)
        @Assert(false)
    }

    @TestCase
    func test2() {}

    @TestCase
    func fffail3() {
        sleep(500 * Duration.millisecond)
        @Assert(false)
    }

    @TestCase
    func fffail() {
        sleep(500 * Duration.millisecond)
        @Assert(false)
    }
}

@Test
func outer() {
}

@Test
func fffail() {
    sleep(50 * Duration.millisecond)
    @Assert(false)
}
