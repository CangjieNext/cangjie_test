/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// ASSERT: scan 1 error generated
internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.io.*

@Test // EXPECT: scan '@Test modified generic class'
class TestB<T> {
    @TestCase
    func case02(): Unit {
        var args1: Array<String> = ["aa", "bb", "cc"]
    }
}

@Test
class TestA {
    @TestCase
    func case01(): Unit {
        println("This is case no.1")
    }
}
