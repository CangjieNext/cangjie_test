/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cmp

import std.unittest.*
import std.unittest.testmacro.*

@Test
public func testGreetWindows(): Unit {
    @Assert(Greeting.greet(), "Hi, I'm a Windows calculator")
}