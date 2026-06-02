/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat tloggertest3.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %run_opt %output %run_utest_opt %run_args && cat tloggertest3.txt| compare %f
// ASSERT: regex time=.* level="DEBUG" msg="abc" age=2
// ASSERT: regex time=.* level="DEBUG" msg="" age=2
// ASSERT: regex time=.* level="DEBUG" msg=".*" age=2
// ASSERT: regex time=.* level="DEBUG" msg="aaaa.*aaaa" age=2
// ASSERT: regex time=.* level="DEBUG" msg="仓颉鸿蒙" ""=2
// ASSERT: regex time=.* level="DEBUG" msg="齾爩麤龗灪龖厵纞虋" ""=2
// ASSERT: regex time=.* level="DEBUG" msg="♫♬♪♩✲✳❃❂❁❀" 仓颉=2
// ASSERT: regex time=.* level="DEBUG" msg="cangjietest" 123456=2
// ASSERT: regex time=.* level="DEBUG" msg="cangjietest" 123456=""
// ASSERT: regex time=.* level="DEBUG" msg="cangjietest" 123456="仓颉"

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_textlogger_debug_03 {
    var fs = File("tloggertest3.txt", ReadWrite)
    var tl3 = TextLogger(fs)

    public override func afterAll(): Unit {
        tl3.close()
        fs.close()
    }

    public init() {
        tl3.level = LogLevel.DEBUG
    }
    @TestCase
    func test_textlogger_debug_01(): Unit {
        tl3.debug("abc", ("age", 2))
    }

    @TestCase
    func test_textlogger_debug_02(): Unit {
        tl3.debug("", ("age", 2))
    }

    @TestCase
    func test_textlogger_debug_03(): Unit {
        tl3.debug("\0", ("age", 2))
    }

    @TestCase
    func test_textlogger_debug_04(): Unit {
        let string_long = StringBuilder(r'a', 100000).toString()
        tl3.debug(string_long, ("age", 2))
    }

    @TestCase
    func test_textlogger_debug_05(): Unit {
        tl3.debug("仓颉鸿蒙", ("", 2))
    }

    @TestCase
    func test_textlogger_debug_06(): Unit {
        tl3.debug("齾爩麤龗灪龖厵纞虋", ("", 2))
    }

    @TestCase
    func test_textlogger_debug_07(): Unit {
        tl3.debug("♫♬♪♩✲✳❃❂❁❀", ("仓颉", 2))
    }

    @TestCase
    func test_textlogger_debug_08(): Unit {
        tl3.debug("cangjietest", ("123456", 2))
    }

    @TestCase
    func test_textlogger_debug_09(): Unit {
        tl3.debug("cangjietest", ("123456", ""))
    }

    @TestCase
    func test_textlogger_debug_10(): Unit {
        tl3.debug("cangjietest", ("123456", "仓颉"))
    }
}
