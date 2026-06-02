/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.collection.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class A {
    func anyOpt(a: Option<Any>): Int64 {
        3
    }
    func intOpt(a: Option<Int64>): Int64 {
        3
    }
    func anyOptOpt(a: Option<Option<Any>>): Int64 {
        3
    }
    func intOptOptOptOpt(a: Option<Option<Option<Option<Int64>>>>): Int64 {
        3
    }
}

let a = mock<A>()

@Test
func testNoneMatcher(): Unit {
    success {
        @On(a.intOpt(_)).returns(0)
        @On(a.intOpt(none())).returns(1)
        @Assert(a.intOpt(5), 0)
        @Assert(a.intOpt(None), 1)
    }

    success {
        @On(a.anyOpt(_)).returns(0)
        @On(a.anyOpt(none())).returns(1)
        @Assert(a.anyOpt("str"), 0)
        @Assert(a.anyOpt(3), 0)
        @Assert(a.anyOpt(None), 1)
    }

    success {
        @On(a.anyOptOpt(_)).returns(0)
        @On(a.anyOptOpt(none())).returns(1)
        @Assert(a.anyOptOpt(3), 0)
        @Assert(a.anyOptOpt(Some(None)), 0)
        @Assert(a.anyOptOpt(None), 1)
    }

    success {
        @On(a.intOptOptOptOpt(_)).returns(0)
        @On(a.intOptOptOptOpt(none())).returns(1)
        @Assert(a.intOptOptOptOpt(Some(None)), 0)
        @Assert(a.intOptOptOptOpt(Some(Some(None))), 0)
        @Assert(a.intOptOptOptOpt(None), 1)
        @Assert(a.intOptOptOptOpt(3), 0)
    }
}
