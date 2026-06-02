/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*

@Test
public class Test_AddressFamily {
    @TestCase
    func test_init_01() {
        var addressfamily = AddressFamily("1.1.1.1", 123)
        @Expect(addressfamily.toString(), "1.1.1.1")
        addressfamily = AddressFamily("inet", 123)
        @Expect(addressfamily.toString(), "inet")
        addressfamily = AddressFamily("INET", 0)
        @Expect(addressfamily.toString(), "INET")
    }

    @TestCase
    func test_assertion() {
        var addressfamily1 = AddressFamily("1.1.1.1", 123)
        var addressfamily2 = AddressFamily("1.1.1.1", 123)
        var addressfamily3 = AddressFamily("1.1.1.1", 0)
        @Expect(addressfamily1 == addressfamily2)
        @Expect(addressfamily2 != addressfamily3)
    }
}
