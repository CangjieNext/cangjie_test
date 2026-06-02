/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat tloggertest7.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat tloggertest7.txt| compare %f
// ASSERT: regex time=.* level="ERROR" msg="abc" age=2
// ASSERT: regex time=.* level="ERROR" msg="" age=2
// ASSERT: regex time=.* level="ERROR" msg=".*" age=2
// ASSERT: regex time=.* level="ERROR" msg="aaaa.*aaaa" age=2
// ASSERT: regex time=.* level="ERROR" msg="仓颉鸿蒙" ""=2
// ASSERT: regex time=.* level="ERROR" msg="齾爩麤龗灪龖厵纞虋" ""=2
// ASSERT: regex time=.* level="ERROR" msg="♫♬♪♩✲✳❃❂❁❀" 仓颉=2
// ASSERT: regex time=.* level="ERROR" msg="cangjietest" 123456=2
// ASSERT: regex time=.* level="ERROR" msg="cangjietest" 123456=""
// ASSERT: regex time=.* level="ERROR" msg="cangjietest" 123456="仓颉"

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_textlogger_error_07 {
    var fs = File("tloggertest7.txt", ReadWrite)
    var tl7 = TextLogger(fs)

    public override func afterAll(): Unit {
        tl7.close()
        fs.close()
    }

    @TestCase
    func test_textlogger_error_01(): Unit {
        tl7.error("abc", ("age", 2))
    }

    @TestCase
    func test_textlogger_error_02(): Unit {
        tl7.error("", ("age", 2))
    }

    @TestCase
    func test_textlogger_error_03(): Unit {
        tl7.error("\0", ("age", 2))
    }

    @TestCase
    func test_textlogger_error_04(): Unit {
        let string_long = StringBuilder(r'a', 100000).toString()
        tl7.error(string_long, ("age", 2))
    }

    @TestCase
    func test_textlogger_error_05(): Unit {
        tl7.error("仓颉鸿蒙", ("", 2))
    }

    @TestCase
    func test_textlogger_error_06(): Unit {
        tl7.error("齾爩麤龗灪龖厵纞虋", ("", 2))
    }

    @TestCase
    func test_textlogger_error_07(): Unit {
        tl7.error("♫♬♪♩✲✳❃❂❁❀", ("仓颉", 2))
    }

    @TestCase
    func test_textlogger_error_08(): Unit {
        tl7.error("cangjietest", ("123456", 2))
    }

    @TestCase
    func test_textlogger_error_09(): Unit {
        tl7.error("cangjietest", ("123456", ""))
    }

    @TestCase
    func test_textlogger_error_10(): Unit {
        tl7.error("cangjietest", ("123456", "仓颉"))
    }
}
