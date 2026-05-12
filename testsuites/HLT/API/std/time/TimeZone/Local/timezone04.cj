/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: test_local1.cj
// EXEC: %compiler %cmp_opt %f test_local1.cj %cmp_utest_opt -o %output
// (Windows) RUN-EXEC-PIPE-0: %export "TZ=Europe/Moscow" && %run %run_opt %output %run_args
// (not Windows)RUN-EXEC-PIPE-0: %export TZ=Europe/Moscow &&  %run %run_opt %output %run_utest_opt %run_args
// (not Windows)ASSERT:scan Europe/Moscow
// (Windows) ASSERT:scan UTC+08:00

package test_local

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

// 测试 TZ 设置正确，但是 CJ_TZPATH 环境变量没有设置的场景
// 类unix系统可以不设置CJ_TZPATH，功能正常，WINDOWS不设置后只能获取到 UTC+Offset 时区

@When[os == "Windows"]
let expect = getLocalByOffset()
@When[os != "macOS"]
let expect = TimeZone.load("Europe/Moscow")
@When[os == "iOS"]
let expect = getLocalByOffset()
@When[os != "Linux"]
let expect = TimeZone.load("Europe/Moscow")

@Test
class LocalTest {
    @TestCase
    func TimeZoneToString(): Unit {
        println(TimeZone.Local.toString())
        @Expect(TimeZone.Local.toString(), expect.toString())
    }
}
