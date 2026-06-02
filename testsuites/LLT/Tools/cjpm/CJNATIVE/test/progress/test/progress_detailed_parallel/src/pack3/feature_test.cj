// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.pack3

import std.sync.*

@Test
class Pack3_1 {
    @TestCase
    func test1() {
        sleep(500 * Duration.millisecond)
    }
}

@Test
class Pack3_2 {
    @TestCase
    func test2() {
        sleep(500 * Duration.millisecond)
    }
}

@Test
class Pack3_3 {
    @TestCase
    func test3() {
        sleep(500 * Duration.millisecond)
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
