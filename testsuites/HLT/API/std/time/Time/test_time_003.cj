/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

import std.time.*

//@Test
class TestTime {
    // 测试
    // @TestCase
    public func testtoString(): Int64 {
        print("testtoString\n")
        let time = DateTime.ofEpoch(second: 0, nanosecond: 0).inUTC()
        println(time.toString())
        if (assertEqule("格式1", time.format("yyyy-MM-dd HH:mm:ss"), "1970-01-01 00:00:00") || assertEqule("格式2",
            time.format("yyyy/MM/dd HH-mm-ss"), "1970/01/01 00-00-00") || assertEqule("格式3",
            time.format("yyyy,MM,dd HH,mm-ss"), "1970,01,01 00,00-00") || assertEqule("格式4",
            time.format("yyyy,MM,dd HH,mm-ss"), "1970,01,01 00,00-00")) {
            return 1
        }
        return 0
    }
}

func assertEqule(msg: String, actual: String, expected: String): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

main(): Int64 {
    let cases: TestTime = TestTime()
    if (cases.testtoString() == 1) {
        print("Failure\n")
        return 1
    }
    return 0
}
