/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest11.txt | compare %f
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest11.txt | compare %f
// ASSERT: regex {"time":".*","level":"WARN","msg":"abc","age":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"","age":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"","age":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"aaaa.*aaaa","age":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"仓颉鸿蒙","":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"齾爩麤龗灪龖厵纞虋","":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"♫♬♪♩✲✳❃❂❁❀","仓颉":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"cangjietest","123456":2}
// ASSERT: regex {"time":".*","level":"WARN","msg":"cangjietest","123456":""}
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
class Test_jsonlogger_warn_11 {
    var fs = File("jloggertest11.txt", ReadWrite)
    var jl11 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl11.close()
        fs.close()
    }

    @TestCase
    func test_jsonlogger_warn_01(): Unit {
        jl11.warn("abc", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_warn_02(): Unit {
        jl11.warn("", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_warn_03(): Unit {
        jl11.warn("\0", ("age", 2))
    }

    @TestCase
    func test_jsonlogger_warn_04(): Unit {
        let string_long = StringBuilder(r'a', 1000).toString()
        jl11.warn(string_long, ("age", 2))
    }

    @TestCase
    func test_jsonlogger_warn_05(): Unit {
        jl11.warn("仓颉鸿蒙", ("", 2))
    }

    @TestCase
    func test_jsonlogger_warn_06(): Unit {
        jl11.warn("齾爩麤龗灪龖厵纞虋", ("", 2))
    }

    @TestCase
    func test_jsonlogger_warn_07(): Unit {
        jl11.warn("♫♬♪♩✲✳❃❂❁❀", ("仓颉", 2))
    }

    @TestCase
    func test_jsonlogger_warn_08(): Unit {
        jl11.warn("cangjietest", ("123456", 2))
    }

    @TestCase
    func test_jsonlogger_warn_09(): Unit {
        jl11.warn("cangjietest", ("123456", ""))
    }

    @TestCase
    func test_jsonlogger_warn_10(): Unit {
        jl11.warn("cangjietest", ("123456", "仓颉"))
    }
}
