/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest13.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest13.txt| compare %f
// ASSERT: regex {"time":".*","level":"INFO","msg":"abc","age":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":".*","age":2}
// ASSERT: regex {"time":".*","level":"ERROR","msg":"aaaa.*aaaa","age":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"仓颉鸿蒙","":2}
// ASSERT: regex {"time":".*","level":"INFO","msg":"♫♬♪♩✲✳❃❂❁❀","仓颉":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"cangjietest","123456":""}
// ASSERT: regex {"time":".*","level":"WARN","msg":"cangjietest","123456":"仓颉"}

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_jsonlogger_log_13 {
    var fs = File("jloggertest13.txt", ReadWrite)
    var jl13 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl13.close()
        fs.close()
    }

    @TestCase
    func test_jsonlogger_log_01(): Unit {
        jl13.log(LogLevel.INFO, "abc", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_log_02(): Unit {
        jl13.log(LogLevel.DEBUG, "", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_log_03(): Unit {
        jl13.log(LogLevel.WARN, "\0", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_log_04(): Unit {
        let string_long = StringBuilder(r'a', 1000).toString()
        jl13.log(LogLevel.ERROR, string_long, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_log_05(): Unit {
        jl13.log(LogLevel.FATAL, "仓颉鸿蒙", ("", 2))
    }

    @TestCase
    func test_jsonlogger_log_06(): Unit {
        jl13.log(LogLevel.TRACE, "齾爩麤龗灪龖厵纞虋", ("", 2))
    }

    @TestCase
    func test_jsonlogger_log_07(): Unit {
        jl13.log(LogLevel.INFO, "♫♬♪♩✲✳❃❂❁❀", ("仓颉", 2))
    }

    @TestCase
    func test_jsonlogger_log_08(): Unit {
        jl13.log(LogLevel.DEBUG, "cangjietest", ("123456", 2))
    }

    @TestCase
    func test_jsonlogger_log_09(): Unit {
        jl13.log(LogLevel.FATAL, "cangjietest", ("123456", ""))
    }

    @TestCase
    func test_jsonlogger_log_10(): Unit {
        jl13.log(LogLevel.WARN, "cangjietest", ("123456", "仓颉"))
    }
}
