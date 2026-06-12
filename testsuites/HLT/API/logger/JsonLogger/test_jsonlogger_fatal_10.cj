/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest10.txt| compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest10.txt| compare %f
// ASSERT: regex {"time":".*","level":"FATAL","msg":"abc","age":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"","age":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":".*","age":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"aaaa.*aaaa","age":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"仓颉鸿蒙","":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"齾爩麤龗灪龖厵纞虋","":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"♫♬♪♩✲✳❃❂❁❀","仓颉":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"cangjietest","123456":2}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"cangjietest","123456":""}
// ASSERT: regex {"time":".*","level":"FATAL","msg":"cangjietest","123456":"仓颉"}

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_jsonlogger_fatal_10 {
    var fs = File("jloggertest10.txt", ReadWrite)
    var jl10 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl10.close()
        fs.close()
    }

    @TestCase
    func test_jsonlogger_fatal_01(): Unit {
        jl10.fatal({=> "abc"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_02(): Unit {
        jl10.fatal({=> ""}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_03(): Unit {
        jl10.fatal({=> "\0"}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_04(): Unit {
        let string_long = StringBuilder(r'a', 1000).toString()
        jl10.fatal({=> string_long}, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_05(): Unit {
        jl10.fatal({=> "仓颉鸿蒙"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_06(): Unit {
        jl10.fatal({=> "齾爩麤龗灪龖厵纞虋"}, ("", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_07(): Unit {
        jl10.fatal({=> "♫♬♪♩✲✳❃❂❁❀"}, ("仓颉", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_08(): Unit {
        jl10.fatal({=> "cangjietest"}, ("123456", 2))
    }

    @TestCase
    func test_jsonlogger_fatal_09(): Unit {
        jl10.fatal({=> "cangjietest"}, ("123456", ""))
    }

    @TestCase
    func test_jsonlogger_fatal_10(): Unit {
        jl10.fatal({=> "cangjietest"}, ("123456", "仓颉"))
    }
}
