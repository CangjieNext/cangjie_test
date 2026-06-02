/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT:scan [2001:db8::8:800:200c:417a]:40000
// ASSERT:scan [ff01::101]:40000
// ASSERT:scan [::1]:40000
// ASSERT:scan [::]:40000
// ASSERT:scan [abcd:ef01:2345:6789:abcd:ef01:2345:6789]:40000
// ASSERT:scan [2001:db8::8:800:200c:417a]:40000
// ASSERT:scan [ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff]:40000
// ASSERT:scan [fedc:baab:fffa:fcff:fedf:ffff:ffff:ffff]:40000
// ASSERT:scan [2001:db8::8:800:200c:417a]:40000
// ASSERT:scan [ff01::101]:40000
// ASSERT:scan [::1]:40000
// ASSERT:scan [::]:40000
// ASSERT:scan [::d01:4403]:40000
// ASSERT:scan [::fff:8190:3426]:40000
// ASSERT:scan [2001:db8::c000:201]:40000
// ASSERT:scan [::ffff:129.144.52.38]:40000

import std.net.*

@Test
public class Test_SocketAddress_Ipv6_ToString {
    static var textAddress = [
        "2001:DB8:0:0:8:800:200C:417A",
        "FF01:0:0:0:0:0:0:101",
        "0:0:0:0:0:0:0:1",
        "0:0:0:0:0:0:0:0",
        "ABCD:EF01:2345:6789:ABCD:EF01:2345:6789",
        "2001:DB8:0:0:8:800:200C:417A",
        "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff",
        "fEDc:Baab:FffA:fCff:fedf:ffff:ffff:ffff"
    ]
    static var compressionAddress = [
        "2001:DB8::8:800:200C:417A",
        "FF01::101",
        "::1",
        "::"
    ]
    static var mixAddress = [
        "::13.1.68.3",
        "::FFF:129.144.52.38",
        "2001:db8::192.0.2.1",
        "::FFFF:129.144.52.38"
    ]

    @TestCase[add_str in textAddress, port in [ 40000u16 ]]
    func test_textAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
        println(socketaddress.toString())
    }

    @TestCase[add_str in compressionAddress, port in [ 40000u16 ]]
    func test_compressionAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
        println(socketaddress.toString())
    }

    @TestCase[add_str in mixAddress, port in [ 40000u16 ]]
    func test_mixAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
        println(socketaddress.toString())
    }
}
