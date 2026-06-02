/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows) DEPENDENCE: ../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args
// (not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.process.*

@When[os != "Windows"]
let tzpath = ["/usr/share/zoneinfo"]
@When[os == "Windows"]
let tzpath = [Process.current.getEnv("CJ_TZPATH").getOrThrow()]

@Test
class Test_notequal {
    @TestCase
    func test_notequal_01(): Unit {
        let zone1 = TimeZone.UTC
        let zone2 = TimeZone.UTC
        let res = zone1 != zone2
        @Assert(res, false)
    }

    @TestCase
    func test_notequal_02(): Unit {
        let zone = TimeZone.UTC

        let zone1 = TimeZone("UTC", Duration.Zero)
        let zone2 = TimeZone.load("UTC")
        let zone3 = TimeZone.loadFromPaths("UTC", tzpath)

        let res1 = zone != zone1
        let res2 = zone != zone2
        let res3 = zone != zone3

        @Expect(res1, true)
        @Expect(res2, false)
        @Expect(res3, true)
    }

    @TestCase
    func test_notequal_03(): Unit {
        let zone1 = TimeZone("UTC", Duration.Zero)
        let zone2 = TimeZone("UTC", Duration.Zero)
        let zone3 = zone1

        let res1 = zone1 != zone2
        @Expect(res1, true)
        let res2 = zone1 != zone3
        @Expect(res2, false)
    }
}
