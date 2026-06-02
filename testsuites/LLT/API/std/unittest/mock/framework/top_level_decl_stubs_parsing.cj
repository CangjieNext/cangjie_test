/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

func gfff() {
    ""
}

let ffd = "ff"

public class Example {
    public func a(): String {
        ""
    }
    public func b(): String {
        ""
    }
    public func c(): String {
        @On(gfff()).returns("")
        @On(ffd).returns("")
        ""
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {}
}
