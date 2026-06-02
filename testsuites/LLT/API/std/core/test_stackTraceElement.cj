/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.math.*

@Test
class StackTraceElementTest {
    /*
     * Test description: Test Hashable ::core
     * Test API:
     * public init(declaringClass: String, methodName: String, fileName: String, lineNumber: Int64)
     */
    @TestCase
    func testInit(): Unit {
        StackTraceElement("", "", "", 0)
        @Expect(true)
    }
}
