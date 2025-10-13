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

@Test
public class Test_Timeout_Cancelation_Main_07 {
    @TestCase
    @Timeout[Duration.second * 1]
    func case001(): Unit {
        for (_ in 0..1000) {
            sleep(Duration.second * 3)
            @FailExpect("unittest")
        }
    }
}

main() {
    Test_Timeout_Cancelation_Main_07().asTestSuite().runTests().reportTo(ConsoleReporter())
}
