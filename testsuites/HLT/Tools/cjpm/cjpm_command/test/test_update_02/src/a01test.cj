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

func func_in_test() {
    1
}

@Test
public class A01_test {
    @TestCase
    func test01() {
        test0()
        println("running _test.cj cases here")
    }
}
