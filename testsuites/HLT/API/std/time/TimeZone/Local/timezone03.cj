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
// (Windows) DEPENDENCE: ../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args 

// (not Windows)RUN-EXEC-PIPE-0: %export CJ_TZPATH=%cd%/zoneinfo && %run %run_opt %output %run_utest_opt %run_args
// (not Windows)ASSERT:scan UTC+08:00
// (Windows) ASSERT:scan UTC+08:00
package test_local

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

// 测试没有设置 TZ 时区的情形
// linux 可以获取到正确的时区信息，windows 和 openharmony 使用 UTC&OFFSET作为时区名
@When[os == "Windows"]
let expect = getLocalByOffset()

@Test
class LocalTest {
    @TestCase
    func TimeZoneToString(): Unit {
        println(TimeZone.Local.toString())
    }
}
