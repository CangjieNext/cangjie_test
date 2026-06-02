/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat tloggertest10.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat tloggertest10.txt| compare %f
// ASSERT: regex time=.* level="FATAL" msg="abc" age=2
// ASSERT: regex time=.* level="FATAL" msg="" age=2
// ASSERT: regex time=.* level="FATAL" msg=".*" age=2
// ASSERT: regex time=.* level="FATAL" msg="aaaa.*aaaa" age=2
// ASSERT: regex time=.* level="FATAL" msg="仓颉鸿蒙" ""=2
// ASSERT: regex time=.* level="FATAL" msg="齾爩麤龗灪龖厵纞虋" ""=2
// ASSERT: regex time=.* level="FATAL" msg="♫♬♪♩✲✳❃❂❁❀" 仓颉=2
// ASSERT: regex time=.* level="FATAL" msg="cangjietest" 123456=2
// ASSERT: regex time=.* level="FATAL" msg="cangjietest" 123456=""
// ASSERT: regex time=.* level="FATAL" msg="cangjietest" 123456="仓颉"

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_textlogger_fatal_10 {
    var fs = File("tloggertest10.txt", ReadWrite)
    var tl10 = TextLogger(fs)

    public override func afterAll(): Unit {
        tl10.close()
        fs.close()
    }

    @TestCase
    func test_textlogger_fatal_01(): Unit {
        tl10.fatal({=> "abc"}, ("age", 2))
    }

    @TestCase
    func test_textlogger_fatal_02(): Unit {
        tl10.fatal({=> ""}, ("age", 2))
    }

    @TestCase
    func test_textlogger_fatal_03(): Unit {
        tl10.fatal({=> "\0"}, ("age", 2))
    }

    @TestCase
    func test_textlogger_fatal_04(): Unit {
        let string_long = StringBuilder(r'a', 100000).toString()
        tl10.fatal({=> string_long}, ("age", 2))
    }

    @TestCase
    func test_textlogger_fatal_05(): Unit {
        tl10.fatal({=> "仓颉鸿蒙"}, ("", 2))
    }

    @TestCase
    func test_textlogger_fatal_06(): Unit {
        tl10.fatal({=> "齾爩麤龗灪龖厵纞虋"}, ("", 2))
    }

    @TestCase
    func test_textlogger_fatal_07(): Unit {
        tl10.fatal({=> "♫♬♪♩✲✳❃❂❁❀"}, ("仓颉", 2))
    }

    @TestCase
    func test_textlogger_fatal_08(): Unit {
        tl10.fatal({=> "cangjietest"}, ("123456", 2))
    }

    @TestCase
    func test_textlogger_fatal_09(): Unit {
        tl10.fatal({=> "cangjietest"}, ("123456", ""))
    }

    @TestCase
    func test_textlogger_fatal_10(): Unit {
        tl10.fatal({=> "cangjietest"}, ("123456", "仓颉"))
    }
}
