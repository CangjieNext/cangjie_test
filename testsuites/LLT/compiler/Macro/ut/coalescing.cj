// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Collection_test {
    @TestCase
    public func testTreeMap0(): Unit {
        var a: ?Int64 = None
        @Assert(-1, a ?? -1)
    }
}

/* SCAN-IN
    [32mPASSED[0m: 1, [32mSKIPPED[0m: 0, ERROR: 0
 */
