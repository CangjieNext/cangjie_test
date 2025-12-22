/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest4.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest4.txt| compare %f
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"abc","age":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"","age":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":".*","age":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"aaaa.*aaaa","age":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"仓颉鸿蒙","":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"齾爩麤龗灪龖厵纞虋","":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"♫♬♪♩✲✳❃❂❁❀","仓颉":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"cangjietest","123456":2}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"cangjietest","123456":""}
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"cangjietest","123456":"仓颉"}

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_jsonlogger_debug_04 {
    var fs = File("jloggertest4.txt", ReadWrite)
    var jl4 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl4.close()
        fs.close()
    }

    public init() {
        jl4.level = LogLevel.DEBUG
    }

    @TestCase
    func test_jsonlogger_debug_01(): Unit {
        jl4.debug({=> "abc"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_debug_02(): Unit {
        jl4.debug({=> ""}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_debug_03(): Unit {
        jl4.debug({=> "\0"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_debug_04(): Unit {
        let string_long = StringBuilder(r'a', 1000).toString()
        jl4.debug({=> string_long}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_debug_05(): Unit {
        jl4.debug({=> "仓颉鸿蒙"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_debug_06(): Unit {
        jl4.debug({=> "齾爩麤龗灪龖厵纞虋"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_debug_07(): Unit {
        jl4.debug({=> "♫♬♪♩✲✳❃❂❁❀"}, ("仓颉", 2))
    }

    @TestCase
    func test_jsonlogger_debug_08(): Unit {
        jl4.debug({=> "cangjietest"}, ("123456", 2))
    }

    @TestCase
    func test_jsonlogger_debug_09(): Unit {
        jl4.debug({=> "cangjietest"}, ("123456", ""))
    }

    @TestCase
    func test_jsonlogger_debug_10(): Unit {
        jl4.debug({=> "cangjietest"}, ("123456", "仓颉"))
    }
}
