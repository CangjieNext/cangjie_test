/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat tloggertest15.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat tloggertest15.txt| compare %f
// ASSERT: regex time=2024-05-25.* level="INFO" msg="cangjie" age=2

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_textlogger_common_15 {
    var fs = File("tloggertest15.txt", ReadWrite)
    var tl15 = TextLogger(fs)

    public override func afterAll(): Unit {
        tl15.close()
        fs.close()
    }
    @TestCase
    func test_textlogger_common_01(): Unit {
        @Expect(tl15.enabled(LogLevel.DEBUG), false)
        tl15.level = LogLevel.DEBUG
        @Expect(tl15.enabled(LogLevel.DEBUG), true)
    }

    @TestCase
    func test_textlogger_common_02(): Unit {
        tl15.level = LogLevel.DEBUG
        tl15.log(LogRecord(DateTime.of(year: 2024, month: May, dayOfMonth: 25, hour: 9), LogLevel.INFO, "cangjie",
            ("age", 2)))
    }
}
