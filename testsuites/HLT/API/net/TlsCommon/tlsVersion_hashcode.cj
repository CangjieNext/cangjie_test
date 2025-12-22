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

import stdx.net.tls.common.*

@Test
class Test_TlsVersion_HashCode {
    @TestCase
    func test_01(): Unit {
        let enum_1 = TlsVersion.V1_2
        let enum_2 = TlsVersion.V1_3
        let enum_3 = TlsVersion.TLCP
        let enum_1_1 = V1_2
        let enum_2_1 = V1_3
        let enum_3_1 = TLCP
        @Assert(enum_1.hashCode() != enum_2.hashCode())
        @Assert(enum_1.hashCode() != enum_3.hashCode())
        @Assert(enum_2.hashCode() != enum_3.hashCode())

        @Assert(enum_1.hashCode() == enum_1_1.hashCode())
        @Assert(enum_2.hashCode() == enum_2_1.hashCode())
        @Assert(enum_3.hashCode() == enum_3_1.hashCode())
    }
}
