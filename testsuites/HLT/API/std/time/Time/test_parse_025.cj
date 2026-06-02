/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt   %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class TestParseFormat {
    @TestCase
    public func testTimeParse(): Unit {
        let times = [("2019-01-14-M", "2019-01-14T00:00:00Z"), ("2020-02-29-S", "2020-02-29T00:00:00Z"),
            ("2021-12-31-F", "2021-12-31T00:00:00Z")]

        var index = 0
        for (dateTime in times) {
            try {
                let time0 = DateTime.parse(dateTime[0], "yyyy-MM-dd-wwwww").toString()
            } catch (e: IllegalArgumentException) {
                index += 1
                @Assert(e.message, "The number of character \"w\" can not exceed 4.")
            }
        }
        @Assert(index, 3)
    }
}
