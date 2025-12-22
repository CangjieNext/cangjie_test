/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat tloggertest1.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat tloggertest1.txt| compare %f
// ASSERT: regex time=.* level="INFO" msg="abc" age=2
// ASSERT: regex time=.* level="INFO" msg="" age=2
// ASSERT: regex time=.* level="INFO" msg=".*" age=2
// ASSERT: regex time=.* level="INFO" msg="aaaa.*aaaa" age=2
// ASSERT: regex time=.* level="INFO" msg="仓颉鸿蒙" ""=2
// ASSERT: regex time=.* level="INFO" msg="齾爩麤龗灪龖厵纞虋" ""=2
// ASSERT: regex time=.* level="INFO" msg="♫♬♪♩✲✳❃❂❁❀" 仓颉=2
// ASSERT: regex time=.* level="INFO" msg="cangjietest" 123456=2
// ASSERT: regex time=.* level="INFO" msg="cangjietest" 123456=""
// ASSERT: regex time=.* level="INFO" msg="cangjietest" 123456="仓颉"

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_textlogger_info_01 {
    var fs = File("tloggertest1.txt", ReadWrite)
    var tl1 = TextLogger(fs)

    public override func afterAll(): Unit {
        tl1.close()
        fs.close()
    }

    @TestCase
    func test_textlogger_info_01(): Unit {
        tl1.info("abc", ("age", 2))
    }

    @TestCase
    func test_textlogger_info_02(): Unit {
        tl1.info("", ("age", 2))
    }

    @TestCase
    func test_textlogger_info_03(): Unit {
        tl1.info("\0", ("age", 2))
    }

    @TestCase
    func test_textlogger_info_04(): Unit {
        let string_long = StringBuilder(r'a', 100000).toString()
        tl1.info(string_long, ("age", 2))
    }

    @TestCase
    func test_textlogger_info_05(): Unit {
        tl1.info("仓颉鸿蒙", ("", 2))
    }

    @TestCase
    func test_textlogger_info_06(): Unit {
        tl1.info("齾爩麤龗灪龖厵纞虋", ("", 2))
    }

    @TestCase
    func test_TextLogger_info_07(): Unit {
        tl1.info("♫♬♪♩✲✳❃❂❁❀", ("仓颉", 2))
    }

    @TestCase
    func test_textlogger_info_08(): Unit {
        tl1.info("cangjietest", ("123456", 2))
    }

    @TestCase
    func test_textlogger_info_09(): Unit {
        tl1.info("cangjietest", ("123456", ""))
    }

    @TestCase
    func test_textlogger_info_10(): Unit {
        tl1.info("cangjietest", ("123456", "仓颉"))
    }
}
