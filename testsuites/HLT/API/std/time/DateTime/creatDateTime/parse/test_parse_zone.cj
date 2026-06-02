/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (Windows) DEPENDENCE: ../../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args
// (not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_parse_zone {
    @TestCase
    func test_parse_zone_z(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 UTC", "yyyy/MM/dd HH:mm:ss OOOO z")
        let res2 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMT", "yyyy/MM/dd HH:mm:ss OOOO z")
        @Expect(res1.toString(),"2023-04-17T19:52:23Z")
        @Expect(res2.toString(),"2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 AAA", "yyyy/MM/dd HH:mm:ss OOOO z")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMTA", "yyyy/MM/dd HH:mm:ss OOOO z")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +00:00 GM", "yyyy/MM/dd HH:mm:ss OOOO z")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        @Expect(cnt, 3)
    }

    @TestCase
    func test_parse_zone_zz(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 UTC", "yyyy/MM/dd HH:mm:ss OOOO zz")
        let res2 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMT", "yyyy/MM/dd HH:mm:ss OOOO zz")
        @Expect(res1.toString(),"2023-04-17T19:52:23Z")
        @Expect(res2.toString(),"2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 AAA", "yyyy/MM/dd HH:mm:ss OOOO zz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMTA", "yyyy/MM/dd HH:mm:ss OOOO zz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +00:00 GM", "yyyy/MM/dd HH:mm:ss OOOO zz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        @Expect(cnt, 3)
    }

    @TestCase
    func test_parse_zone_zzz(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 UTC", "yyyy/MM/dd HH:mm:ss OOOO zzz")
        let res2 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMT", "yyyy/MM/dd HH:mm:ss OOOO zzz")
        @Expect(res1.toString(),"2023-04-17T19:52:23Z")
        @Expect(res2.toString(),"2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 AAA", "yyyy/MM/dd HH:mm:ss OOOO zzz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 GMTA", "yyyy/MM/dd HH:mm:ss OOOO zzz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +00:00 GM", "yyyy/MM/dd HH:mm:ss OOOO zzz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        @Expect(cnt, 3)
    }

    @TestCase
    func test_parse_with_dts(): Unit {
        var cnt = 0
        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO z")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "No value to match \" \".")
        }
    }

    @TestCase
    func test_parse_zone_zzzz(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +08:00 Asia/Shanghai", "yyyy/MM/dd HH:mm:ss OOOO zzzz")
        let res2 = DateTime.parse("2023/04/17 19:52:23 -04:00 America/New_York", "yyyy/MM/dd HH:mm:ss OOOO zzzz")
        let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 UTC", "yyyy/MM/dd HH:mm:ss OOOO zzzz")
        @Expect(res1.toString(),"2023-04-17T19:52:23+08:00")
        @Expect(res2.toString(),"2023-04-17T19:52:23-04:00")
        @Expect(res3.toString(),"2023-04-17T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 Asia/Shanghai", "yyyy/MM/dd HH:mm:ss OOOO zzzz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "The zone offset does not match.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +00:00 Asia", "yyyy/MM/dd HH:mm:ss OOOO zzzz")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone name or zone id.")
        }

        @Expect(cnt, 2)
    }
}
