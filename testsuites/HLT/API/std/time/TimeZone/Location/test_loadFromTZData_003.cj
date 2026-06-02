/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

class TestParseFormat {
    public func testTimeParse():Int64 {
        let mylocation = "Pacific/Niue"

        let mydata: Array<UInt8> = [84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0,
            0, 4, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 20, 128, 0, 0, 0, 220, 67, 53, 96, 16, 116, 202, 56, 127,
            255, 255, 255, 1, 2, 3, 3, 255, 255, 96, 180, 0, 0, 255, 255, 96, 160, 0, 4, 255, 255, 94, 72, 0, 10, 255,
            255, 101, 80, 0, 16, 76, 77, 84, 0, 45, 49, 49, 50, 48, 0, 45, 49, 49, 51, 48, 0, 45, 49, 49, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0,
            0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 20, 248, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 126, 55, 84, 76,
            255, 255, 255, 255, 220, 67, 53, 96, 0, 0, 0, 0, 16, 116, 202, 56, 0, 0, 0, 0, 127, 255, 255, 255, 0, 1, 2,
            3, 3, 255, 255, 96, 180, 0, 0, 255, 255, 96, 160, 0, 4, 255, 255, 94, 72, 0, 10, 255, 255, 101, 80, 0, 16,
            76, 77, 84, 0, 45, 49, 49, 50, 48, 0, 45, 49, 49, 51, 48, 0, 45, 49, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 60,
            45, 49, 49, 62, 49, 49, 10]

        var newlocation = TimeZone.loadFromTZData(mylocation, mydata)
        var newlocationname = newlocation.toString()

        assertEqual(newlocationname, mylocation, "Comparing the result of loadFromTZData()\n")
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
