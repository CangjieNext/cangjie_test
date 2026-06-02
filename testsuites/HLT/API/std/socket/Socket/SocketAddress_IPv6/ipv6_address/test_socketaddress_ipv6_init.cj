/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_SocketAddress_Ipv6 {
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
        "::FFFF:129.144.52.38"
    ]

    static var illegalAddress = [
        "2001:db8:85a3::8a2e:0370:7334:仓颉",
        "2001:db8:85a3::8a2e:0370:7334::",
        "2001:db8:85a3::8a2e:0370:7334:256.0.0.1",
        "2001:db8:85a3::8a2e:0370:7334:ghij",
        "2001:db8:85a3::8a2e:0370:7334:12345",
        "::1::",
        "::ffff:256.256.256.256",
        "2001:db8::g123:4567:89ab:cdef",
        "2001:db8::H123:4567:89ab:cdef",
        "::::1",
        "0000:0000:0000:0000:0000:0000:0000:0000:0001"
    ]

    @TestCase[add_str in textAddress, port in [ 0u16, 65535u16 ]]
    func test_textAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
    }

    @TestCase[add_str in compressionAddress, port in [ 0u16, 65535u16 ]]
    func test_compressionAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
    }

    @TestCase[add_str in mixAddress, port in [ 0u16, 65535u16 ]]
    func test_mixAddress(add_str: String, port: UInt16): Unit {
        var socketaddress = IPSocketAddress(add_str, port)
    }

    @TestCase[add_str in illegalAddress, port in [ 0u16, 65535u16 ]]
    func test_illegalAddress(add_str: String, port: UInt16): Unit {
        let e = @AssertThrows[IllegalFormatException | SocketException](IPSocketAddress(add_str, port))
        let flag = e.message.contains("each field must have at least one digit") || e
            .message
            .contains("an IPv6 address can only have one ellipsis") || e.message.contains("too many hex fields") ||
            e.message.contains("IPv6 field has value >=2^16") || e.message.contains("IPv4 field has value >255") ||
            e.message.contains("extra characters at the end of the address") || e
            .message
            .contains("unable to parse IP") || e.message.contains("field part value width large than")
        if (!flag) {
            println(e.message)
        }
        @Expect(flag)
    }
}
