/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: date_formatter_01.c
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// ((target_ios | target_ios_simulator)) EXEC: %clang %clang_opt -c date_formatter_01.c
// (!(target_ios | target_ios_simulator)) EXEC: %clang %clang_opt date_formatter_01.c -o libdate_formatter_01.%test_suffix
// EXEC: %compiler %cmp_opt -L . -l date_formatter_01 %f -o %output
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args | compare %f
// (not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

foreign func printf(fmt: CString, ...): Int32

foreign func getDate(y: CString, symA: CString, m: CString, symB: CString, d: CString): CString

foreign func getSymbolA(): CString

foreign func getSymbolB(): CString

class TestParseFormat {
    public unsafe func testTimeParse(): Int64 {
        var symbolA: CString = getSymbolA()
        var symbolB: CString = getSymbolB()
        var a1 = unsafe { LibC.mallocCString("08") };
        var a2 = unsafe { LibC.mallocCString("12") };
        var a3 = unsafe { LibC.mallocCString("2000 Asia/Shanghai") }
        var b1 = unsafe { LibC.mallocCString("dd") };
        var b2 = unsafe { LibC.mallocCString("MM") };
        var b3 = unsafe { LibC.mallocCString("yyyy zzzz") }

        var myDate: CString = getDate(a1, symbolA, a2, symbolB, a3)
        var myDateFormat: CString = getDate(b1, symbolA, b2, symbolB, b3)
        let newDate = DateTime.parse(myDate.toString(), myDateFormat.toString()).toString()

        assertEqual(newDate, "2000-12-08T00:00:00+08:00", "Comparing the result of DateTime.parse()\n")
        LibC.free(myDateFormat)
        LibC.free(myDate)
        LibC.free(a1);
        LibC.free(a2);
        LibC.free(a3)
        LibC.free(b1);
        LibC.free(b2);
        LibC.free(b3)

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

unsafe main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
