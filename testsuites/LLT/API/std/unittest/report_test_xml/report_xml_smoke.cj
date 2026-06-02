/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --reportFormat=xml --reportPath=tmp2
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %n.%suffix %run_args

package foo

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test1 {
    @TestCase
    func foo() {
        @Assert(true)
    }

    @TestCase
    func bar() {
        @Assert(false)
    }
}

main(): Int64 {
    let dir = canonicalize(Path(".")).join("tmp2")
    if (!exists(dir.join("tests").join("test-foo.Test1.xml"))) {
        return 3
    }
    0
}
