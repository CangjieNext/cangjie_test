/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package testa

import std.unittest.testmacro.*
import std.unittest.*
import dep.dynamiclibcall

@Test
public func testfunc(): Unit {
    dynamiclibcall()
}

main() {
    println("hello")
}