/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class A {
    public static var x: Int64 = 10
    public static func FOO() { x = 20 }
    public static func DOO(): Int64 { return x }
}

@Test
func test1() {
    unsafe {
        @On(A.x = _).doesNothing()
        A.FOO()
        @Assert(A.x, 10)
    }
}

@Test
func test2() {
    unsafe {
        @On(A.x).returns(42)
        @Assert(A.DOO(), 42)
    }
}
