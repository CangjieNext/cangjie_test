/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 --death-aware | compare %f
// ASSERT: scan-not Exception: Unsupported CheckResultValue format to deserialize
// ASSERT: scan [ FAILED ] CASE: deserialization_of_ExpectThrows_fail
// ASSERT: scan Expect Failed: `(@ExpectThrows: Expected 'Exception' was not caught.)`
// ASSERT: scan [ FAILED ] CASE: deserialization_of_AsertThrows_fail
// ASSERT: scan Assert Failed: `(@AssertThrows: Expected 'Exception' was not caught.)`
// ASSERT: scan [ FAILED ] CASE: deserialization_of_Fail
// ASSERT: scan Assert Failed: `(error 3!)`
// ASSERT: scan [ FAILED ] CASE: deserialization_of_FailExpect
// ASSERT: scan Expect Failed: `(error 4!)`

import std.unittest.*
import std.unittest.testmacro.*

// The test checks that
// @ExpectThrows, @AssertThrows, @Fail, @FailExpect are serilizable/deserializable 
// serialization forced by --death-aware option

@Test
class Tests {
    @TestCase
    func deserialization_of_ExpectThrows_fail() {
        @ExpectThrows(1)
    }

    @TestCase
    func deserialization_of_AsertThrows_fail() {
        @AssertThrows(1)
    }

    @TestCase
    func deserialization_of_Fail() {
        @Fail("error 3!")
    }

    @TestCase
    func deserialization_of_FailExpect() {
        @FailExpect("error 4!")
    }
}
