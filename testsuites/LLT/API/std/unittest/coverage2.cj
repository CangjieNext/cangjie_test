/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestA {}

@Test
class TestB {
    @TestCase
    @Bench[a]
    func case02(): Unit {
        var args1: Array<String> = ["aa", "bb", "cc"]
    }
}

/* SCAN-IN
Test framework: macro failed to expand.
Illegal parameters for @Test: a
 */
