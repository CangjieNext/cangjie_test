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
    public unsafe func testTimeParse() : Int64{
        var symbolA: CString = getSymbolA()
        var symbolB: CString = getSymbolB()
        var aa = LibC.mallocCString("01199")
        var bb = LibC.mallocCString("8")
        var cc = LibC.mallocCString("18")
        var dd = LibC.mallocCString("T")
        var ee = LibC.mallocCString("1")
        var ff = LibC.mallocCString(":")
        var gg = LibC.mallocCString("3 Asia/Shanghai")
        var hh = LibC.mallocCString("yyyyy")
        var ii = LibC.mallocCString("M")
        var jj = LibC.mallocCString("dd")
        var kk = LibC.mallocCString("h")
        var ll = LibC.mallocCString("m")
        var nn = LibC.mallocCString("00000")
        var oo = LibC.mallocCString("21")
        var pp = LibC.mallocCString("12")
        var qq = LibC.mallocCString("2")
        var rr = LibC.mallocCString("00233")
        var ss = LibC.mallocCString("11")
        var tt = LibC.mallocCString("30")
        var uu = LibC.mallocCString("12")
        var vv = LibC.mallocCString("hh")
        var ww = LibC.mallocCString("s zzzz")
        var xx = LibC.mallocCString("MM")
        var myDate1: CString = getDate(aa, symbolA, bb, symbolB, cc, dd, ee, ff, ee, ff, gg)
        var myDateFormat1: CString = getDate(hh, symbolA, ii, symbolB, jj, dd, kk, ff, ll, ff, ww)
        let newDate1 = DateTime.parse(myDate1.toString(), myDateFormat1.toString()).toString()

        assertEqual(newDate1, "1199-08-18T01:01:03+08:05:43", "Comparing the result of DateTime.parse()\n")

        var myDate2: CString = getDate(nn, symbolA, qq, symbolB, oo, dd, pp, ff, ee, ff, gg)
        var myDateFormat2: CString = getDate(hh, symbolA, ii, symbolB, jj, dd, kk, ff, ll, ff, ww)
        let newDate2 = DateTime.parse(myDate2.toString(), myDateFormat2.toString()).toString()

        assertEqual(newDate2, "0000-02-21T00:01:03+08:05:43", "Comparing the result of DateTime.parse()\n")

        var myDate3: CString = getDate(rr, symbolA, ss, symbolB, tt, dd, uu, ff, ee, ff, gg)
        var myDateFormat3: CString = getDate(hh, symbolA, xx, symbolB, jj, dd, vv, ff, ll, ff, ww)
        let newDate3 = DateTime.parse(myDate3.toString(), myDateFormat3.toString()).toString()

        assertEqual(newDate3, "0233-11-30T00:01:03+08:05:43", "Comparing the result of DateTime.parse()\n")

        LibC.free(myDateFormat1)
        LibC.free(myDateFormat2)
        LibC.free(myDateFormat3)
        LibC.free(myDate1)
        LibC.free(myDate2)
        LibC.free(myDate3)
        LibC.free(aa);
        LibC.free(bb);
        LibC.free(cc);
        LibC.free(dd);
        LibC.free(ee);
        LibC.free(ff);
        LibC.free(gg);
        LibC.free(hh);
        LibC.free(ii);
        LibC.free(jj);
        LibC.free(kk);
        LibC.free(ll);
        LibC.free(nn);
        LibC.free(oo);
        LibC.free(pp);
        LibC.free(qq);
        LibC.free(rr);
        LibC.free(ss);
        LibC.free(tt);
        LibC.free(uu);
        LibC.free(vv);
        LibC.free(ww);
        LibC.free(xx)

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
