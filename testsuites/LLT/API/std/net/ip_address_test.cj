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
class TestIPAddr {
    let ipstrs2 = [
        ("fd7a:115c:a1e0:ab12:4843:cd96:626b:430b%eth0", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0xab12, 0x4843, 0xcd96,
                0x626b, 0x430b, scopeId: None), ""),
        ("1:2::ffff:192.168.140.255%eth1", IPv6Address(0x0001, 0x0002, 0x0, 0x0, 0x0, 0xffff, 0xc0a8, 0x8cff,
                scopeId: None), ""),
        ("::ffff:192.168.140.255%eth1", IPv6Address(0, 0, 0, 0, 0x0, 0xffff, 0xc0a8, 0x8cff, scopeId: None), "")
    ]
    let ipstrarrs: Array<(String, IPAddress, String)> = [
        ("0.0.0.0", IPv4Address.unspecified, ""),
        ("192.168.140.255", IPv4Address(0xc0a88cff), ""),
        ("010.000.015.001", IPv4Address.unspecified, "Parse (010.000.015.001): has leading zero."),
        ("000001.00000002.00000003.000000004", IPv4Address.unspecified,
            "Parse (000001.00000002.00000003.000000004): IPv4 address too long."),
        ("::ffff:1.2.03.4", IPv6Address.unspecified, "Parse (::ffff:1.2.03.4): has leading zero."),
        ("::ffff:1.2.3.z", IPv6Address.unspecified, "Parse (::ffff:1.2.3.z): each segment must have at least 1 digit."),
        ("::", IPv6Address.unspecified, ""),
        ("::%12", IPv6Address.unspecified.scope(12), ""),
        ("::1", IPv6Address.localhost, ""),
        ("::1%12", IPv6Address.localhost.scope(12), ""),
        ("fd7a:115c:a1e0:ab12:4843:cd96:626b:430b", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0xab12, 0x4843, 0xcd96, 0x626b,
                0x430b, scopeId: None), ""),
        ("fd7a:115c::626b:430b", IPv6Address(0xfd7a, 0x115c, 0x0, 0x0, 0x0, 0x0, 0x626b, 0x430b, scopeId: None), ""),
        ("fd00:1234:5678::", IPv6Address(0xfd00, 0x1234, 0x5678, 0x0, 0x0, 0x0, 0x0, 0x0, scopeId: None), ""),
        ("fd7a:115c:a1e0:ab12:4843:cd96::", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0xab12, 0x4843, 0xcd96, 0x0, 0x0,
                scopeId: None), ""),
        ("fd7a:115c:a1e0:ab12:4843:cd96::%2", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0xab12, 0x4843, 0xcd96, 0x0, 0x0,
                scopeId: 2), ""),
        ("fd7a:115c:a1e0:ab12:4843:cd96:626b::", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0xab12, 0x4843, 0xcd96, 0x626b, 0x0,
                scopeId: None), ""),
        ("fd7a:115c:a1e0::4843:cd96:626b:430b", IPv6Address(0xfd7a, 0x115c, 0xa1e0, 0x0, 0x4843, 0xcd96, 0x626b, 0x430b,
                scopeId: None), ""),
        ("::ffff:192.168.140.255", IPv6Address(0x0, 0x0, 0x0, 0x0, 0x0, 0xffff, 0xc0a8, 0x8cff, scopeId: None), ""),
        ("::ffff:192.168.140.255%12", IPv6Address(0x0, 0x0, 0x0, 0x0, 0x0, 0xffff, 0xc0a8, 0x8cff, scopeId: 12), ""),
        ("FD9E:1A04:F01D::1", IPv6Address(0xfd9e, 0x1a04, 0xf01d, 0x0, 0x0, 0x0, 0x0, 0x1, scopeId: None), ""),
        ("FD9E:1A04:F01D::1%12", IPv6Address(0xfd9e, 0x1a04, 0xf01d, 0x0, 0x0, 0x0, 0x0, 0x1, scopeId: 12), ""),
        ("fe80::82bc:839e:69a6:6a98%35", IPv6Address(0xfe80, 0x0, 0x0, 0x0, 0x82bc, 0x839e, 0x69a6, 0x6a98, scopeId: 35),
            ""),
        ("2001:250:1006:dff0:4913:2aa5:8075:7c01", IPv6Address(0x2001, 0x0250, 0x1006, 0xdff0, 0x4913, 0x2aa5, 0x8075,
                0x7c01, scopeId: None), "")
    ]
    @TestCase[ipt in ipstrarrs]
    func testparseIp(ipt: (String, IPAddress, String)): Unit {
        let (ipstr, expect, errmsg) = ipt
        try {
            let addr = IPAddress.parse(ipstr)
            @Expect(addr, expect)
        } catch (e: Exception) {
            if (errmsg == "" || !e.message.contains(errmsg)) {
                eprintln(e.message)
                throw e
            }
        }
    }
    let invalidIPstrs = [
        // Empty string
        "",
        ".",
        // Garbage non-IP
        "bad",
        // Single number. Some parsers accept this as an IPv4 address in
        // big-endian uint32 form, but we don't.
        "1234",
        // IPv4 with a zone specifier
        "1.2.3.4%eth0",
        // IPv4 field must have at least one digit
        ".1.2.3",
        "1.2.3.",
        "1..2.3",
        // IPv4 address too long
        "1.2.3.4.5",
        // IPv4 in dotted octal form
        "0300.0250.0214.0377",
        // IPv4 in dotted hex form
        "0xc0.0xa8.0x8c.0xff",
        // IPv4 in class B form
        "192.168.12345",
        // IPv4 in class B form, with a small enough number to be
        // parseable as a regular dotted decimal field.
        "127.0.1",
        // IPv4 in class A form
        "192.1234567",
        // IPv4 in class A form, with a small enough number to be
        // parseable as a regular dotted decimal field.
        "127.1",
        // IPv4 field has value >255
        "192.168.300.1",
        // IPv4 with too many fields
        "192.168.0.1.5.6",
        // IPv6 with not enough fields
        "1:2:3:4:5:6:7",
        // IPv6 with too many fields
        "1:2:3:4:5:6:7:8:9",
        // IPv6 with 8 fields and a :: expander
        "1:2:3:4::5:6:7:8",
        ":",
        // IPv6 with a field bigger than 2b
        "fe801::1",
        // IPv6 with non-hex values in field
        "fe80:tail:scal:e::",
        // IPv6 with a zone delimiter but no zone.
        "fe80::1%",
        // IPv6 (without ellipsis) with too many fields for trailing embedded IPv4.
        "ffff:ffff:ffff:ffff:ffff:ffff:ffff:192.168.140.255",
        // IPv6 (with ellipsis) with too many fields for trailing embedded IPv4.
        "ffff::ffff:ffff:ffff:ffff:ffff:ffff:192.168.140.255",
        // IPv6 with invalid embedded IPv4.
        "::ffff:192.168.140.bad",
        // IPv6 with multiple ellipsis ::.
        "fe80::1::1",
        // IPv6 with invalid non hex/colon character.
        "fe80:1?:1",
        // IPv6 with truncated bytes after single colon.
        "fe80:",
        // IPv6 with 5 zeros in last group
        "0:0:0:0:0:ffff:0:00000",
        // IPv6 with 5 zeros in one group and embedded IPv4
        "0:0:0:0:00000:ffff:127.1.2.3"
    ]
    @TestCase[ipstr in invalidIPstrs]
    func testInvalidIPs(ipstr: String) {
        @AssertThrows[IllegalFormatException](IPAddress.parse(ipstr))
    }
    let wbs: Array<(String, Array<Byte>)> = [
        ("2001:0250:1006:dff0:4913:2aa5:8075:7c10", [0x20, 0x01, 0x02, 0x50, 0x10, 0x06, 0xdf, 0xf0, 0x49, 0x13, 0x2a,
                0xa5, 0x80, 0x75, 0x7c, 0x10]),
        ("1.2.3.4", [1, 2, 3, 4])
    ]
    @TestCase[ipt in wbs]
    func testWriteBigEndian(ipt: (String, Array<Byte>)) {
        let (str, expect) = ipt
        let ip: IPAddress = IPAddress.parse(str)
        let b = Array<Byte>(16, repeat: 0)
        let len = ip.writeBigEndian(b)
        @Expect(b[..len], expect)
    }
    @TestCase
    func case_isIPv4Mapped_01(): Unit {
        @Expect((IPAddress.parse("::ffff:192.0.2.128") as IPv6Address).getOrThrow().isIPv4Mapped())
    }
    let invalidIPv6Zones = [
        "::ffff:192.0.2.128%-1",
        "::ffff:192.0.2.128%4294967296",
        "::ffff:192.0.2.128%zone"
    ]
    @TestCase[ipstr in invalidIPstrs]
    func testInvalidIPv6Zones(ipstr: String) {
        @AssertThrows[IllegalFormatException](IPAddress.parse(ipstr))
    }
    @TestCase
    func case_readBigEndian_01() {
        @Expect(IPv4Address(0, 0, 0, 0), IPv4Address.readBigEndian([0u8, 0u8, 0u8, 0u8]))
        @Expect(IPv4Address(255, 255, 255, 255), IPv4Address.readBigEndian([255u8, 255u8, 255u8, 255u8]))
        @Expect(IPv4Address(127, 0, 0, 1), IPv4Address.readBigEndian([127u8, 0u8, 0u8, 1u8]))
    }

    @TestCase
    func case_readBigEndian_02() {
        var e = @AssertThrows[IllegalArgumentException](IPv4Address.readBigEndian([0u8, 0u8, 0u8]))
    }
}
