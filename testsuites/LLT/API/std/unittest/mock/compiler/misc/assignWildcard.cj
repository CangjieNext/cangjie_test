/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class C {
    public var f: Int64 = 0
}

func getPair(): (Int64, Int64) {
    return (1, 2)
}

func useC(c: C) {
    (c.f, _) = getPair()
}

@Test
func test() {
    let c = spy<C>(C())
    useC(c)
    Verify.that(@Called(c.f = _).once())
    @Assert(c.f == 1)
}

// ASSERT: scan-not error
