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
        var mytime = DateTime.now(timeZone: TimeZone.UTC)
        var myzone = (mytime.zoneId, mytime.zoneOffset)
        var myzonename = myzone[0]
        var myzoneoffset = myzone[1].toSeconds().toString()

        assertEqual(myzonename, "UTC", "Comparing the result of TimeZone.UTC, name\n")
        assertEqual(myzoneoffset, "0", "Comparing the result of TimeZone.UTC, offset\n")
        return 0
    }
}

func assertEqual(result: String, expected: String, msg: String): Bool {
    if (result != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${result}\n")
        return true
    }
    return false
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
