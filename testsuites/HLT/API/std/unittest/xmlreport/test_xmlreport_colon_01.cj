/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not Windows or OHOS) RUN-EXEC-PIPE: %run %run_opt %output %run_args --reportFormat=xml --reportPath=./tmp && ls ./tmp/tests/test-default.my_suite.xml | compare %f
// (Windows and not OHOS) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --reportFormat=xml --reportPath=./tmp && dir ./tmp\tests\test-default.my_suite.xml | compare %f
// ASSERT: scan test-default.my_suite.xml

import std.unittest.*
import std.unittest.testmacro.*

@TestBuilder
func colonSuite(): TestSuite {
    let builder = TestSuite.builder("my:suite")
    builder.add(UnitTestCase.create("case1") { })
    builder.build()
}
