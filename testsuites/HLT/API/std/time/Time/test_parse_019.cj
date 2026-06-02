/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

class TestParseFormat {
    public func testTimeParse(): Int64 {
        let times = [("2019-001Z", "2019-01-01T00:00:00Z"), ("2020-366Z", "2020-12-31T00:00:00Z"),
            ("2021-012Z", "2021-01-12T00:00:00Z")]

        var index = 0
        for (dateTime in times) {
            let time0 = DateTime.parse(dateTime[0], "yyyy-DDOOOO").toString()
            let time1 = dateTime[1]
            assertEqual(time0, time1, "Comparing the result of DateTime.parse(), the index is ${index}\n")
            index++
        }
        return 0
    }
}

func assertEqual(actual: String, expected: String, msg: String): Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n\n")
        return true
    }
    return false
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
