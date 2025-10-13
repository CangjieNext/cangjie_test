/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan MyTestSuite.default.failing

import std.unittest.*
import std.unittest.testmacro.*
import std.process.*

@Test
class MyTestSuite {
    @TestCase
    @Timeout[Duration.second]
    func failing() {
        while (true) {}
    }
}

main() {
    let conf = Configuration()
    conf.set(
        KeyTimeoutHandler.timeoutHandler,
        {
            info =>
                print("Timeout in ${info.suiteName}.${info.groupName}.${info.caseName} :(", flush: true)
                Process.current.exit(1)
        }
    )
    MyTestSuite().asTestSuite().runTests(conf).reportTo(ConsoleReporter())
}
