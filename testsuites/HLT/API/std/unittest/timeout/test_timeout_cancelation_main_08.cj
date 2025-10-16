/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan Execution time exceeded specified timeout

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
public func checkNotNone<T>(ctx: AssertionCtx, value: ?T): T {
    if (let Some(res) <- value) {
        return res
    }
    ctx.fail("Expected ${ctx.arg("value")} to be Some(_) but got None")
}

@Test
public class Test_Timeout_Cancelation_Main_08 {
    @TestCase
    @Timeout[Duration.second * 1]
    func case001(): Unit {
        spawn {
            sleep(Duration.second * 3)
            @Assert[checkNotNone]("unittest")
        }
        sleep(Duration.second * 5)
    }
}

main() {
    Test_Timeout_Cancelation_Main_08().asTestSuite().runTests().reportTo(ConsoleReporter())
}
