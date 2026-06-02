/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_UnixEpoch {
    @TestCase
    func test_UnixEpoch_01(): Unit {
        let UnixEpoch = DateTime.UnixEpoch
        let res = UnixEpoch.toString()
        @Assert(res, "1970-01-01T00:00:00Z")
    }
}
