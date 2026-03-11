/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: date_formatter_02.c
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// ((target_ios | target_ios_simulator)) EXEC: %clang %clang_opt -c date_formatter_02.c
// (!(target_ios | target_ios_simulator)) EXEC: %clang %clang_opt date_formatter_02.c -o libdate_formatter_02.%test_suffix
// EXEC: %compiler %cmp_opt -L . -l date_formatter_02 %f -o %output
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args | compare %f
// (not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

foreign func printf(fmt: CString, ...): Int32

foreign func getDate(y: CString, symA: CString, M: CString, symB: CString, d: CString, symC: CString, h: CString,
    symD: CString, m: CString, symE: CString, s: CString): CString

foreign func getSymbolA(): CString

foreign func getSymbolB(): CString

class TestParseFormat {
    public unsafe func testTimeParse(): Int64 {
        var symbolA: CString = getSymbolA()
        var symbolB: CString = getSymbolB()
        var a1 = LibC.mallocCString("-99");
        var a2 = LibC.mallocCString("8");
        var a3 = LibC.mallocCString("8");
        var a4 = LibC.mallocCString("T");
        var a5 = LibC.mallocCString("1");
        var a6 = LibC.mallocCString(":");
        var a7 = LibC.mallocCString("3");
        var a8 = LibC.mallocCString(":");
        var a9 = LibC.mallocCString("3 Asia/Shanghai")
        var b1 = LibC.mallocCString("yy");
        var b2 = LibC.mallocCString("M");
        var b3 = LibC.mallocCString("d");
        var b4 = LibC.mallocCString("T");
        var b5 = LibC.mallocCString("h");
        var b6 = LibC.mallocCString(":");
        var b7 = LibC.mallocCString("m");
        var b8 = LibC.mallocCString(":");
        var b9 = LibC.mallocCString("s zzzz")
        var c1 = LibC.mallocCString("-00");
        var c2 = LibC.mallocCString("3");
        var c3 = LibC.mallocCString("1");
        var c4 = LibC.mallocCString("T");
        var c5 = LibC.mallocCString("12");
        var c6 = LibC.mallocCString(":");
        var c7 = LibC.mallocCString("1");
        var c8 = LibC.mallocCString(":");
        var c9 = LibC.mallocCString("2 Asia/Shanghai")
        var d1 = LibC.mallocCString("yy");
        var d2 = LibC.mallocCString("M");
        var d3 = LibC.mallocCString("d");
        var d4 = LibC.mallocCString("T");
        var d5 = LibC.mallocCString("h");
        var d6 = LibC.mallocCString(":");
        var d7 = LibC.mallocCString("m");
        var d8 = LibC.mallocCString(":");
        var d9 = LibC.mallocCString("s zzzz")
        var e1 = LibC.mallocCString("-69");
        var e2 = LibC.mallocCString("9");
        var e3 = LibC.mallocCString("1");
        var e4 = LibC.mallocCString("T");
        var e5 = LibC.mallocCString("12");
        var e6 = LibC.mallocCString(":");
        var e7 = LibC.mallocCString("1");
        var e8 = LibC.mallocCString(":");
        var e9 = LibC.mallocCString("1 Asia/Shanghai")
        var f1 = LibC.mallocCString("yy");
        var f2 = LibC.mallocCString("M");
        var f3 = LibC.mallocCString("d");
        var f4 = LibC.mallocCString("T");
        var f5 = LibC.mallocCString("hh");
        var f6 = LibC.mallocCString(":");
        var f7 = LibC.mallocCString("m");
        var f8 = LibC.mallocCString(":");
        var f9 = LibC.mallocCString("s zzzz")

        var myDate1: CString = getDate(a1, symbolA, a2, symbolB, a3, a4, a5, a6, a7, a8, a9)
        var myDateFormat1: CString = getDate(b1, symbolA, b2, symbolB, b3, b4, b5, b6, b7, b8, b9)
        let newDate1 = DateTime.parse(myDate1.toString(), myDateFormat1.toString()).toString()

        assertEqual(newDate1, "-1999-08-08T01:03:03+08:05:43", "Comparing the result of DateTime.parse()\n")

        var myDate2: CString = getDate(c1, symbolA, c2, symbolB, c3, c4, c5, c6, c7, c8, c9)
        var myDateFormat2: CString = getDate(d1, symbolA, d2, symbolB, d3, d4, d5, d6, d7, d8, d9)
        let newDate2 = DateTime.parse(myDate2.toString(), myDateFormat2.toString()).toString()

        assertEqual(newDate2, "-2000-03-01T00:01:02+08:05:43", "Comparing the result of DateTime.parse()\n")

        var myDate3: CString = getDate(e1, symbolA, e2, symbolB, e3, e4, e5, e6, e7, e8, e9)
        var myDateFormat3: CString = getDate(f1, symbolA, f2, symbolB, f3, f4, f5, f6, f7, f8, f9)
        let newDate3 = DateTime.parse(myDate3.toString(), myDateFormat3.toString()).toString()

        assertEqual(newDate3, "-1969-09-01T00:01:01+08:05:43", "Comparing the result of DateTime.parse()\n")

        LibC.free(myDateFormat1)
        LibC.free(myDateFormat2)
        LibC.free(myDateFormat3)
        LibC.free(myDate1)
        LibC.free(myDate2)
        LibC.free(myDate3)
        LibC.free(a1);
        LibC.free(a2);
        LibC.free(a3);
        LibC.free(a4);
        LibC.free(a5);
        LibC.free(a6);
        LibC.free(a7);
        LibC.free(a8);
        LibC.free(a9)
        LibC.free(b1);
        LibC.free(b2);
        LibC.free(b3);
        LibC.free(b4);
        LibC.free(b5);
        LibC.free(b6);
        LibC.free(b7);
        LibC.free(b8);
        LibC.free(b9)
        LibC.free(c1);
        LibC.free(c2);
        LibC.free(c3);
        LibC.free(c4);
        LibC.free(c5);
        LibC.free(c6);
        LibC.free(c7);
        LibC.free(c8);
        LibC.free(c9)
        LibC.free(d1);
        LibC.free(d2);
        LibC.free(d3);
        LibC.free(d4);
        LibC.free(d5);
        LibC.free(d6);
        LibC.free(d7);
        LibC.free(d8);
        LibC.free(d9)
        LibC.free(e1);
        LibC.free(e2);
        LibC.free(e3);
        LibC.free(e4);
        LibC.free(e5);
        LibC.free(e6);
        LibC.free(e7);
        LibC.free(e8);
        LibC.free(e9)
        LibC.free(f1);
        LibC.free(f2);
        LibC.free(f3);
        LibC.free(f4);
        LibC.free(f5);
        LibC.free(f6);
        LibC.free(f7);
        LibC.free(f8);
        LibC.free(f9)
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
