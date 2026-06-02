/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_local1.cj
// EXEC: %compiler %cmp_opt %f test_local1.cj %cmp_utest_opt -o %output
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// (Windows) RUN-EXEC-PIPE-0: set CJ_TZPATH=%pwd\zoneinfo\
// (Windows) RUN-EXEC-PIPE-0: set TZ=Europe/Singapore
// (Unix)EXEC-PIPE: export TZ=Europe/Singapore && echo $TZ && %run %run_opt %output %run_args
// (Windows) EXEC: %run %run_opt %output %run_utest_opt %run_args
// (Unix)ASSERT:scan localtime
// (Windows) ASSERT:scan UTC+08:00
package test_local

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

// 测试 TZ 设置时区无效的情形
// linux 可以获取到正确的时区信息，windows 和 openharmony 使用 UTC&OFFSET作为时区名
@When[os == "Windows"]
let expect = getLocalByOffset()
@When[os != "Windows"]
let expect = getlocalname()

@Test
class LocalTest {
    @TestCase
    func TimeZoneToString(): Unit {
        @Expect(TimeZone.Local.toString(), expect.toString())
    }
}
