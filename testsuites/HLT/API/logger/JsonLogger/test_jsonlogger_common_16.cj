/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler  %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (OHOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && cat jloggertest16.txt| compare %f
// (not OHOS and not iOS)RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args && %cat jloggertest16.txt| compare %f
// ASSERT: regex {"time":".*","level":"DEBUG","msg":"abc","name":"cangjietest","age":2}

import std.time.*
import std.io.*
import std.console.Console
import std.fs.*
import std.collection.*
import stdx.encoding.json.stream.*
import stdx.log.*
import stdx.logger.*

@Test
class Test_jsonlogger_common_16 {
    var fs = File("jloggertest16.txt", ReadWrite)
    var jl16 = JsonLogger(fs)

    public override func afterAll(): Unit {
        jl16.close()
        fs.close()
    }

    @TestCase
    func test_jsonlogger_common_01(): Unit {
        jl16.level = LogLevel.DEBUG
        let wjl = jl16.withAttrs(("name", "cangjietest"))
        wjl.log(LogLevel.DEBUG, {=> "abc"}, ("age", 2))
    }
}
