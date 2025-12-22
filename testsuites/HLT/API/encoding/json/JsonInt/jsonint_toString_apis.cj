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
class Test_JsonInt_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(JsonInt(-1234).toString(), "-1234")
        @Expect(JsonInt(12345).toJsonString(), "12345")
        @Expect(JsonInt(0).toStringWithoutEscaping(), "0")
        @Expect(JsonInt(1271784687546237i64).toJsonStringWithoutEscaping(), "1271784687546237")
    }
}
