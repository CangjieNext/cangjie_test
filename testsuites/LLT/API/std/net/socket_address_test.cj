/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.convert.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestSockAddr {
    let ipsockaddrs: Array<(String, SocketAddress, String)> = [
        ("1.2.3.4:80", IPSocketAddress([1, 2, 3, 4], 80), ""),
        ("[::]:80", IPSocketAddress(IPv6Address.unspecified, 80), ""),
        ("[::1%12]:80", IPSocketAddress(IPv6Address.localhost.scope(12), 80), ""),
        ("[::FFFF:192.168.140.255]:80", IPSocketAddress(IPv6Address(0x0, 0x0, 0x0, 0x0, 0x0, 0xffff, 0xc0a8, 0x8cff), 80),
            ""),
        ("[::FFFF:192.168.140.255%12]:80", IPSocketAddress(
                IPv6Address(0x0, 0x0, 0x0, 0x0, 0x0, 0xffff, 0xc0a8, 0x8cff, scopeId: 12), 80), "")
    ]
    @TestCase
    func testIPSockAddrParse(): Unit {
        for ((ipsockstr, expect, errmsg) in ipsockaddrs) {
            try {
                let addr = IPSocketAddress.parse(ipsockstr)
                println("addr = ${addr.getAddressBytes()}")
                @Expect(addr, expect)
                @Expect(addr.toString().toAsciiLower(), ipsockstr.toAsciiLower())
            } catch (e: Exception) {
                if (!e.message.contains(errmsg)) {
                    eprintln(e.message)
                    throw e
                }
            }
        }
    }
    let invalidIPsockaddrs: Array<String> = [
        "ffff:ffff:ffff:ffff:ffff:fFff:ffff:ffff:123",
        "::1:123",
        "::12345",
        ":::12345",
        "::12r45"
    ]
    @TestCase[ipsockstr in invalidIPsockaddrs]
    func testInvalidIPSockAddrParse(ipsockstr: String): Unit {
        @AssertThrows[IllegalFormatException](IPSocketAddress.parse(ipsockstr))
    }
    let unixsockaddrstrs: Array<(String, SocketAddress, String)> = [
        ("/tmp/sock1.a", UnixSocketAddress("/tmp/sock1.a"), ""),
        ("\u{0000}/tmp/sock1.a", UnixSocketAddress("\u{0000}/tmp/sock1.a"), "")
    ]
    @TestCase[ex in unixsockaddrstrs]
    func testUdsAddrStr(ex: (String, SocketAddress, String)): Unit {
        let (sockaddrstr, expect, errmsg) = ex
        try {
            let addr: SocketAddress = UnixSocketAddress(sockaddrstr)
            println("addr = ${addr.getAddressBytes()}")
            @Expect(addr, expect)
            @Expect(addr.toString().toAsciiLower(), sockaddrstr.toAsciiLower())
        } catch (e: Exception) {
            if (!e.message.contains(errmsg)) {
                eprintln(e.message)
                throw e
            }
        }
    }

    let unixsockaddrArrs: Array<(Array<Byte>, SocketAddress, String)> = [
        ("/tmp/sock1.a".toArray(), UnixSocketAddress("/tmp/sock1.a"), "/tmp/sock1.a"),
        ("\u{0000}/tmp/sock1.a".toArray(), UnixSocketAddress("\u{0000}/tmp/sock1.a"), "\u{0000}/tmp/sock1.a"),
        ("/tmp/sock1.a\u{0000}\u{0000}\u{0000}\u{0000}\u{0000}".toArray(), UnixSocketAddress("/tmp/sock1.a"),
            "/tmp/sock1.a"),
        ("\u{0000}/tmp/sock1.a\u{0000}\u{0000}".toArray(), UnixSocketAddress("\u{0000}/tmp/sock1.a"),
            "\u{0000}/tmp/sock1.a"),
        ("\u{0000}\u{0000}\u{0000}".toArray(), UnixSocketAddress(""), ""),
        ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            UnixSocketAddress(""), "")
    ]
    @TestCase[ex in unixsockaddrArrs]
    func testUdsAddrBytes(ex: (Array<Byte>, SocketAddress, String)): Unit {
        let (sockaddrArr, expect, expectStr) = ex
        let addr: SocketAddress = UnixSocketAddress(sockaddrArr)
        println("addr = ${addr.getAddressBytes()}")
        @Expect(addr, expect)
        @Expect(addr.toString(), expectStr)
    }

    let inUnixsockaddrs1: Array<String> = [
        "/tmp/so\u{0000}ck1.a",
        "/tmp/sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1sock1.a"
    ]
    @TestCase[sockaddrstr in inUnixsockaddrs1]
    func testUdsAddrInvalid1(sockaddrstr: String): Unit {
        @AssertThrows[IllegalArgumentException](UnixSocketAddress(sockaddrstr))
    }

    let inUnixsockaddrArr1: Array<Array<Byte>> = [
        "/tmp/so\u{0000}ck1.a".toArray(),
        "/tmp/sock1.a\u{0000}\u{0000}\u{0000}b".toArray()
    ]
    @TestCase[sockaddrstr in inUnixsockaddrArr1]
    func testUdsAddrInvalidArr1(sockaddrstr: Array<Byte>): Unit {
        @AssertThrows[IllegalArgumentException](UnixSocketAddress(sockaddrstr))
    }
}
