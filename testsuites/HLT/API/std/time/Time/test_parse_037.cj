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
        let times = [("2023-04-07T01:00:00.000000000", "0"), ("2023-04-07T12:30:30.123456789", "123456789"),
            ("2023-04-07T12:59:59.987654321", "987654321")]

        var index = 0
        for (dateTime in times) {
            let time0 = DateTime.parse(dateTime[0], "yyyy-MM-ddThh:mm:ss.SSS").nanosecond
            let time1 = dateTime[1]
            assertEqual(time0.toString(), time1.toString(),
                "Comparing the result of DateTime.parse(), the index is ${index}\n")
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
