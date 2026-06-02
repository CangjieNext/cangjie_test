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
class Test_hashcode {
    @TestCase
    func test_hashcode_01(): Unit {
        let duration1 = Duration.nanosecond.hashCode()
        let duration2 = Duration.microsecond.hashCode()
        let duration3 = Duration.millisecond.hashCode()
        let duration4 = Duration.second.hashCode()
        let duration5 = Duration.minute.hashCode()
        let duration6 = Duration.hour.hashCode()
        let duration7 = Duration.day.hashCode()
        @Assert(duration1, -8244754741327406002)
        @Assert(duration2, -8244754741327407017)
        @Assert(duration3, -8244754741335089521)
        @Assert(duration4, -8244754741327405940)
        @Assert(duration5, -8244754741327408328)
        @Assert(duration6, -8244754741327483397)
        @Assert(duration7, -8244754741354358481)
    }
}
