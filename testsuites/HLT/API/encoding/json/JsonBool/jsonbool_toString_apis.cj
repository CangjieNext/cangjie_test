/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
class Test_JsonBool_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(JsonBool(true).toString(), "true")
        @Expect(JsonBool(true).toJsonString(), "true")
        @Expect(JsonBool(true).toStringWithoutEscaping(), "true")
        @Expect(JsonBool(true).toJsonStringWithoutEscaping(), "true")
    }

    @TestCase
    func test_tojsonstring_02(): Unit {
        @Expect(JsonBool(false).toString(), "false")
        @Expect(JsonBool(false).toJsonString(), "false")
        @Expect(JsonBool(false).toStringWithoutEscaping(), "false")
        @Expect(JsonBool(false).toJsonStringWithoutEscaping(), "false")
    }
}
