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
    public func testTimeParse() :Int64{
        let mylocation = "America/Tegucigalpa"

        let mydata: Array<UInt8> = [84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0,
            0, 3, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3, 0, 0, 0, 12, 128, 0, 0, 0, 164, 76, 75, 68, 32, 154, 220, 224, 33,
            92, 155, 80, 34, 122, 190, 224, 35, 60, 125, 80, 68, 93, 140, 224, 68, 214, 200, 208, 0, 2, 1, 2, 1, 2, 1, 2,
            255, 255, 174, 60, 0, 0, 255, 255, 185, 176, 1, 4, 255, 255, 171, 160, 0, 8, 76, 77, 84, 0, 67, 68, 84, 0,
            67, 83, 84, 0, 0, 0, 0, 0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3, 0, 0, 0, 12, 248, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255,
            164, 76, 75, 68, 0, 0, 0, 0, 32, 154, 220, 224, 0, 0, 0, 0, 33, 92, 155, 80, 0, 0, 0, 0, 34, 122, 190, 224,
            0, 0, 0, 0, 35, 60, 125, 80, 0, 0, 0, 0, 68, 93, 140, 224, 0, 0, 0, 0, 68, 214, 200, 208, 0, 2, 1, 2, 1, 2,
            1, 2, 255, 255, 174, 60, 0, 0, 255, 255, 185, 176, 1, 4, 255, 255, 171, 160, 0, 8, 76, 77, 84, 0, 67, 68, 84,
            0, 67, 83, 84, 0, 0, 0, 0, 0, 0, 0, 10, 67, 83, 84, 54, 10]

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
