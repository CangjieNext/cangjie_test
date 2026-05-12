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
class Test_JsonFloat_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(JsonFloat(2e3).toString(), "2000.000000")
        @Expect(JsonFloat(2.4e-1f64).toJsonString(), "0.240000")
        @Expect(JsonFloat(0x1.1p0).toStringWithoutEscaping(), "1.062500")
        @Expect(JsonFloat(-3.1415926).toJsonStringWithoutEscaping(), "-3.141593")
    }
}
