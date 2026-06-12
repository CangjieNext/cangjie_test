/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest6.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest6.txt| compare %f
// ASSERT: regex {"time":".*","level":"TRACE","msg":"abc","age":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"","age":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":".*","age":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"aaaa.*aaaa","age":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"仓颉鸿蒙","":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"齾爩麤龗灪龖厵纞虋","":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"♫♬♪♩✲✳❃❂❁❀","仓颉":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"cangjietest","123456":2}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"cangjietest","123456":""}
// ASSERT: regex {"time":".*","level":"TRACE","msg":"cangjietest","123456":"仓颉"}

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_jsonlogger_trace_06 {
    var fs = File("jloggertest6.txt", ReadWrite)
    var jl6 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl6.close()
        fs.close()
    }

    public init() {
        jl6.level = LogLevel.TRACE
    }

    @TestCase
    func test_jsonlogger_trace_01(): Unit {
        jl6.trace({=> "abc"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_trace_02(): Unit {
        jl6.trace({=> ""}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_trace_03(): Unit {
        jl6.trace({=> "\0"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_trace_04(): Unit {
        let string_long = StringBuilder(r'a', 1000).toString()
        jl6.trace({=> string_long}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_trace_05(): Unit {
        jl6.trace({=> "仓颉鸿蒙"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_trace_06(): Unit {
        jl6.trace({=> "齾爩麤龗灪龖厵纞虋"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_trace_07(): Unit {
        jl6.trace({=> "♫♬♪♩✲✳❃❂❁❀"}, ("仓颉", 2))
    }

    @TestCase
    func test_jsonlogger_trace_08(): Unit {
        jl6.trace({=> "cangjietest"}, ("123456", 2))
    }

    @TestCase
    func test_jsonlogger_trace_09(): Unit {
        jl6.trace({=> "cangjietest"}, ("123456", ""))
    }

    @TestCase
    func test_jsonlogger_trace_10(): Unit {
        jl6.trace({=> "cangjietest"}, ("123456", "仓颉"))
    }
}
