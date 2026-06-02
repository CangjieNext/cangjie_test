/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

func test0() {
    2
}

@Test
public class A01_testactually {
    @Bench
    func test01() {
        // func_in_test()
        sleep(Duration.second * 0.2)
    }

    @TestCase
    func test02() {
        throw Exception("")
    }
}
