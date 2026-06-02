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
import std.math.*

@Test
public class Test_IPv4Address_Init {
    @TestCase
    func case_init_01() {
        @Expect(IPv4Address(0).toString(), "0.0.0.0")
        @Expect(IPv4Address(UInt32.Max).toString(), "255.255.255.255")
    }

    @TestCase
    func case_init_02() {
        @Expect(IPv4Address(0, 0, 0, 0).toString(), "0.0.0.0")
        @Expect(IPv4Address(255, 255, 255, 255).toString(), "255.255.255.255")
        @Expect(IPv4Address(127, 0, 0, 1).toString(), "127.0.0.1")
        @Expect(IPv4Address(127, 0, 0, 1), IPv4Address(IPv4Address(127, 0, 0, 1).toBits()))
    }

    @TestCase
    func case_readBigEndian_01() {
        @Expect(IPv4Address(0, 0, 0, 0), IPv4Address.readBigEndian([0u8, 0u8, 0u8, 0u8]))
        @Expect(IPv4Address(255, 255, 255, 255), IPv4Address.readBigEndian([255u8, 255u8, 255u8, 255u8]))
        @Expect(IPv4Address(127, 0, 0, 1), IPv4Address.readBigEndian([127u8, 0u8, 0u8, 1u8]))
    }

    @TestCase
    func case_readBigEndian_02() {
        // var e = @AssertThrows[IllegalArgumentException](IPv4Address.readBigEndian(Array<Byte>()))

        var e = @AssertThrows[IllegalArgumentException](IPv4Address.readBigEndian([0u8, 0u8, 0u8]))
    }
}
