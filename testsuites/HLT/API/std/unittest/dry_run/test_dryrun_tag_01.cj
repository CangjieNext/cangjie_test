/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package tmp_test

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --dry-run 2>&1 | compare %f
// ASSERT: scan CASE: test00 (tags: test00Tag)
// ASSERT: scan CASE: test01 (tags: test01Tag0, test01Tag1)
// ASSERT: scan CASE: topLevel (tags: tag1, tag2)

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.runtime.*

@Test
@Tag[suiteTag0, suiteTag1]
class TestExample {
    @TestCase
    @Tag[test00Tag]
    func test00(): Unit {
        @Assert(true)
    }
    @TestCase
    @Tag[test01Tag0, test01Tag1]
    func test01(): Unit {
        @Assert(false)
    }
}

@Test
@Tag[tag1, tag2]
func topLevel(): Unit {}

main(): Int64 {
    println("hello world")
    return 0
}
