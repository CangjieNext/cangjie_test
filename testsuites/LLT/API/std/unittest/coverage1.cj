/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt

import std.unittest.*
import std.unittest.testmacro.*

@Test // EXPECT: scan '@Test modified generic class'
class TestB {
    @TestCase
    @Skip[true]
    func case02(): Unit {
        var args1: Array<String> = ["aa", "bb", "cc"]
        @Assert([1,2],[1,2,3])
    }
}

@Test
class TestA {
    @TestCase
    @Skip[false]
    func case01(): Unit {
        println("This is case no.1")
    }
}
