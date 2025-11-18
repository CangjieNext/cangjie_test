/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

//import stdx.net.tls.common.*

@Test
class Test_TlsVersion_Equals {
    @TestCase
    func test_01(): Unit {
        let enum_1 = TlsVersion.V1_2
        let enum_2 = TlsVersion.V1_3
        let enum_3 = TlsVersion.TLCP
        let enum_1_1 = V1_2
        let enum_2_1 = V1_3
        let enum_3_1 = TLCP
        @Assert(enum_1 != enum_2)
        @Assert(enum_1 != enum_3)
        @Assert(enum_2 != enum_3)

        @Assert(enum_1 == enum_1_1)
        @Assert(enum_2 == enum_2_1)
        @Assert(enum_3 == enum_3_1)
    }
}
