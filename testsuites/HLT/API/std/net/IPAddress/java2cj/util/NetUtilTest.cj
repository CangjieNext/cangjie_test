/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: NetUtil.cj internal
// EXEC: %compiler %cmp_opt %compile_lib_opt internal/StringUtil.cj -o StringUtil.%middle
// EXEC: %compiler %cmp_opt %f NetUtil.cj StringUtil.%middle -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package io.netty.util

import std.unittest.*
import std.unittest.testmacro.*
import io.netty.util.internal.StringUtil

// ==================== 测试数据 ====================

func validIpV4Hosts(): Array<(String, String)> {
    return [
        ("192.168.1.0", "c0a80100"),
        ("10.255.255.254", "0afffffe"),
        ("172.18.5.4", "ac120504"),
        ("0.0.0.0", "00000000"),
        ("127.0.0.1", "7f000001"),
        ("255.255.255.255", "ffffffff"),
        ("1.2.3.4", "01020304")
    ]
}

// 原 Java 版本中 invalid 映射的 value 均为 null，这里只保留 host 列表
func invalidIpV4Hosts(): Array<String> {
    return [
        "1.256.3.4",
        "256.0.0.1",
        "1.1.1.1.1",
        "x.255.255.255",
        "0.1:0.0",
        "0.1.0.0:",
        "127.0.0.",
        "1.2..4",
        "192.0.1",
        "192.0.1.1.1",
        "192.0.1.a",
        "19a.0.1.1",
        "a.0.1.1",
        ".0.1.1",
        "127.0.0",
        "192.0.1.256",
        "0.0.200.259",
        "1.1.-1.1",
        "1.1. 1.1",
        "1.1.1.1 ",
        "1.1.+1.1",
        "0.0x1.0.255",
        "0.01x.0.255",
        "0.x01.0.255",
        "0.-.0.0",
        "0..0.0",
        "0.A.0.0",
        "0.1111.0.0",
        "..."
    ]
}

func validIpV6Hosts(): Array<(String, String)> {
    return [
        ("::ffff:5.6.7.8", "00000000000000000000ffff05060708"),
        ("fdf8:f53b:82e4::53", "fdf8f53b82e400000000000000000053"),
        ("fe80::200:5aee:feaa:20a2", "fe8000000000000002005aeefeaa20a2"),
        ("2001::1", "20010000000000000000000000000001"),
        ("2001:0000:4136:e378:8000:63bf:3fff:fdd2", "200100004136e378800063bf3ffffdd2"),
        ("2001:0002:6c::430", "20010002006c00000000000000000430"),
        ("2001:10:240:ab::a", "20010010024000ab000000000000000a"),
        ("2002:cb0a:3cdd:1::1", "2002cb0a3cdd00010000000000000001"),
        ("2001:db8:8:4::2", "20010db8000800040000000000000002"),
        ("ff01:0:0:0:0:0:0:2", "ff010000000000000000000000000002"),
        ("[fdf8:f53b:82e4::53]", "fdf8f53b82e400000000000000000053"),
        ("[fe80::200:5aee:feaa:20a2]", "fe8000000000000002005aeefeaa20a2"),
        ("[2001::1]", "20010000000000000000000000000001"),
        ("[2001:0000:4136:e378:8000:63bf:3fff:fdd2]", "200100004136e378800063bf3ffffdd2"),
        ("0:1:2:3:4:5:6:789a", "0000000100020003000400050006789a"),
        ("0:1:2:3::f", "0000000100020003000000000000000f"),
        ("0:0:0:0:0:0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0:0:0:0::10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0:0:0::10.0.0.1", "00000000000000000000ffff0a000001"),
        ("::0:0:0:0:0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0::0:0:0:0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0::0:0:0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0:0::0:0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0:0:0::0:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("0:0:0:0:0:ffff:10.0.0.1", "00000000000000000000ffff0a000001"),
        ("::ffff:192.168.0.1", "00000000000000000000ffffc0a80001"),
        // Test if various interface names after the percent sign are recognized.
        ("[::1%1]", "00000000000000000000000000000001"),
        ("[::1%eth0]", "00000000000000000000000000000001"),
        ("[::1%%]", "00000000000000000000000000000001"),
        ("0:0:0:0:0:ffff:10.0.0.1%", "00000000000000000000ffff0a000001"),
        ("0:0:0:0:0:ffff:10.0.0.1%1", "00000000000000000000ffff0a000001"),
        ("[0:0:0:0:0:ffff:10.0.0.1%1]", "00000000000000000000ffff0a000001"),
        ("[0:0:0:0:0::10.0.0.1%1]", "00000000000000000000ffff0a000001"),
        ("[::0:0:0:0:ffff:10.0.0.1%1]", "00000000000000000000ffff0a000001"),
        ("::0:0:0:0:ffff:10.0.0.1%1", "00000000000000000000ffff0a000001"),
        ("::1%1", "00000000000000000000000000000001"),
        ("::1%eth0", "00000000000000000000000000000001"),
        ("::1%%", "00000000000000000000000000000001"),
        // Tests with leading or trailing compression
        ("0:0:0:0:0:0:0::", "00000000000000000000000000000000"),
        ("0:0:0:0:0:0::", "00000000000000000000000000000000"),
        ("0:0:0:0:0::", "00000000000000000000000000000000"),
        ("0:0:0:0::", "00000000000000000000000000000000"),
        ("0:0:0::", "00000000000000000000000000000000"),
        ("0:0::", "00000000000000000000000000000000"),
        ("0::", "00000000000000000000000000000000"),
        ("::", "00000000000000000000000000000000"),
        ("::0", "00000000000000000000000000000000"),
        ("::0:0", "00000000000000000000000000000000"),
        ("::0:0:0", "00000000000000000000000000000000"),
        ("::0:0:0:0", "00000000000000000000000000000000"),
        ("::0:0:0:0:0", "00000000000000000000000000000000"),
        ("::0:0:0:0:0:0", "00000000000000000000000000000000"),
        ("::0:0:0:0:0:0:0", "00000000000000000000000000000000")
    ]
}

// 原 Java 版本中 invalid 映射的 value 均为 null，这里只保留 host 列表
func invalidIpV6Hosts(): Array<String> {
    return [
        // Test method with garbage.
        "Obvious Garbage",
        // Test method with preferred style, too many :
        "0:1:2:3:4:5:6:7:8",
        // Test method with preferred style, not enough :
        "0:1:2:3:4:5:6",
        // Test method with preferred style, bad digits.
        "0:1:2:3:4:5:6:x",
        // Test method with preferred style, adjacent :
        "0:1:2:3:4:5:6::7",
        // Too many : separators trailing
        "0:1:2:3:4:5:6:7::",
        // Too many : separators leading
        "::0:1:2:3:4:5:6:7",
        // Too many : separators trailing
        "1:2:3:4:5:6:7:",
        // Too many : separators leading
        ":1:2:3:4:5:6:7",
        // Compression with : separators trailing
        "0:1:2:3:4:5::7:",
        "0:1:2:3:4::7:",
        "0:1:2:3::7:",
        "0:1:2::7:",
        "0:1::7:",
        "0::7:",
        // Compression at start with : separators trailing
        "::0:1:2:3:4:5:7:",
        "::0:1:2:3:4:7:",
        "::0:1:2:3:7:",
        "::0:1:2:7:",
        "::0:1:7:",
        "::7:",
        // The : separators leading and trailing
        ":1:2:3:4:5:6:7:",
        ":1:2:3:4:5:6:",
        ":1:2:3:4:5:",
        ":1:2:3:",
        ":1:2:",
        ":1:",
        // Compression with : separators leading
        ":1::2:3:4:5:6:7",
        ":1::3:4:5:6:7",
        ":1::4:5:6:7",
        ":1::5:6:7",
        ":1::6:7",
        ":1::7",
        ":1:2:3:4:5:6::7",
        ":1:3:4:5:6::7",
        ":1:4:5:6::7",
        ":1:5:6::7",
        ":1:6::7",
        ":1::",
        // Compression trailing with : separators leading
        ":1:2:3:4:5:6:7::",
        ":1:3:4:5:6:7::",
        ":1:4:5:6:7::",
        ":1:5:6:7::",
        ":1:6:7::",
        ":1:7::",
        // Double compression
        "1::2:3:4:5:6::",
        "::1:2:3:4:5::6",
        "::1:2:3:4:5:6::",
        "::1:2:3:4:5::",
        "::1:2:3:4::",
        "::1:2:3::",
        "::1:2::",
        "::0::",
        "12::0::12",
        // Too many : separators leading 0
        "0::1:2:3:4:5:6:7",
        // Test method with preferred style, too many digits.
        "0:1:2:3:4:5:6:789abcdef",
        // Test method with compressed style, bad digits.
        "0:1:2:3::x",
        // Test method with compressed style, too many adjacent :
        "0:1:2:::3",
        // Test method with compressed style, too many digits.
        "0:1:2:3::abcde",
        // Test method with compressed style, not enough :
        "0:1",
        // Test method with ipv4 style, bad ipv6 digits.
        "0:0:0:0:0:x:10.0.0.1",
        // Test method with ipv4 style, bad ipv4 digits.
        "0:0:0:0:0:0:10.0.0.x",
        // Test method with ipv4 style, too many ipv6 digits.
        "0:0:0:0:0:00000:10.0.0.1",
        // Test method with ipv4 style, too many :
        "0:0:0:0:0:0:0:10.0.0.1",
        // Test method with ipv4 style, not enough :
        "0:0:0:0:0:10.0.0.1",
        // Test method with ipv4 style, too many .
        "0:0:0:0:0:0:10.0.0.0.1",
        // Test method with ipv4 style, not enough .
        "0:0:0:0:0:0:10.0.1",
        // Test method with ipv4 style, adjacent .
        "0:0:0:0:0:0:10..0.0.1",
        // Test method with ipv4 style, leading .
        "0:0:0:0:0:0:.0.0.1",
        // Test method with ipv4 style, leading .
        "0:0:0:0:0:0:.10.0.0.1",
        // Test method with ipv4 style, trailing .
        "0:0:0:0:0:0:10.0.0.",
        // Test method with ipv4 style, trailing .
        "0:0:0:0:0:0:10.0.0.1.",
        // Test method with compressed ipv4 style, bad ipv6 digits.
        "::fffx:192.168.0.1",
        // Test method with compressed ipv4 style, bad ipv4 digits.
        "::ffff:192.168.0.x",
        // Test method with compressed ipv4 style, too many adjacent :
        ":::ffff:192.168.0.1",
        // Test method with compressed ipv4 style, too many ipv6 digits.
        "::fffff:192.168.0.1",
        // Test method with compressed ipv4 style, too many ipv4 digits.
        "::ffff:1923.168.0.1",
        // Test method with compressed ipv4 style, not enough :
        ":ffff:192.168.0.1",
        // Test method with compressed ipv4 style, too many .
        "::ffff:192.168.0.1.2",
        // Test method with compressed ipv4 style, not enough .
        "::ffff:192.168.0",
        // Test method with compressed ipv4 style, adjacent .
        "::ffff:192.168..0.1",
        // Test method, bad ipv6 digits.
        "x:0:0:0:0:0:10.0.0.1",
        // Test method, bad ipv4 digits.
        "0:0:0:0:0:0:x.0.0.1",
        // Test method, too many ipv6 digits.
        "00000:0:0:0:0:0:10.0.0.1",
        // Test method, too many ipv4 digits.
        "0:0:0:0:0:0:10.0.0.1000",
        // Test method, too many :
        "0:0:0:0:0:0:0:10.0.0.1",
        // Test method, not enough :
        "0:0:0:0:0:10.0.0.1",
        // Test method, out of order trailing :
        "0:0:0:0:0:10.0.0.1:",
        // Test method, out of order leading :
        ":0:0:0:0:0:10.0.0.1",
        // Test method, out of order leading :
        "0:0:0:0::10.0.0.1:",
        // Test method, out of order trailing :
        ":0:0:0:0::10.0.0.1",
        // Test method, too many .
        "0:0:0:0:0:0:10.0.0.0.1",
        // Test method, not enough .
        "0:0:0:0:0:0:10.0.1",
        // Test method, adjacent .
        "0:0:0:0:0:0:10.0.0..1",
        // Empty contents
        "",
        // Invalid single compression
        ":",
        ":::",
        // Trailing : (max number of : = 8)
        "2001:0:4136:e378:8000:63bf:3fff:fdd2:",
        // Leading : (max number of : = 8)
        ":aaaa:bbbb:cccc:dddd:eeee:ffff:1111:2222",
        // Invalid character
        "1234:2345:3456:4567:5678:6789::X890",
        // Trailing . in IPv4
        "::ffff:255.255.255.255.",
        // To many characters in IPv4
        "::ffff:0.0.1111.0",
        // Test method, adjacent .
        "::ffff:0.0..0",
        // Not enough IPv4 entries trailing .
        "::ffff:127.0.0.",
        // Invalid trailing IPv4 character
        "::ffff:127.0.0.a",
        // Invalid leading IPv4 character
        "::ffff:a.0.0.1",
        // Invalid middle IPv4 character
        "::ffff:127.a.0.1",
        // Invalid middle IPv4 character
        "::ffff:127.0.a.1",
        // Not enough IPv4 entries no trailing .
        "::ffff:1.2.4",
        // Extra IPv4 entry
        "::ffff:192.168.0.1.255",
        // Not enough IPv6 content
        ":ffff:192.168.0.1.255",
        // Intermixed IPv4 and IPv6 symbols
        "::ffff:255.255:255.255.",
        // Invalid IPv4 mapped address - invalid ipv4 separator
        "0:0:0::0:0:00f.0.0.1",
        // Invalid IPv4 mapped address - not enough f's
        "0:0:0:0:0:fff:1.0.0.1",
        // Invalid IPv4 mapped address - not IPv4 mapped, not IPv4 compatible
        "0:0:0:0:0:ff00:1.0.0.1",
        // Invalid IPv4 mapped address - not IPv4 mapped, not IPv4 compatible
        "0:0:0:0:0:ff:1.0.0.1",
        // Invalid IPv4 mapped address - too many f's
        "0:0:0:0:0:fffff:1.0.0.1",
        // Invalid IPv4 mapped address - too many bytes (too many 0's)
        "0:0:0:0:0:0:ffff:1.0.0.1",
        // Invalid IPv4 mapped address - too many bytes (too many 0's)
        "::0:0:0:0:0:ffff:1.0.0.1",
        // Invalid IPv4 mapped address - too many bytes (too many 0's)
        "0:0:0:0:0:0::1.0.0.1",
        // Invalid IPv4 mapped address - too many bytes (too many 0's)
        "0:0:0:0:0:00000:1.0.0.1",
        // Invalid IPv4 mapped address - too few bytes (not enough 0's)
        "0:0:0:0:ffff:1.0.0.1",
        // Invalid IPv4 mapped address - too few bytes (not enough 0's)
        "ffff:192.168.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "0:0:0:0:0:ffff::10.0.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "0:0:0:0:ffff::10.0.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "0:0:0:ffff::10.0.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "0:0:ffff::10.0.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "0:ffff::10.0.0.1",
        // Invalid IPv4 mapped address - 0's after the mapped ffff indicator
        "ffff::10.0.0.1",
        // Invalid IPv4 mapped address - not all 0's before the mapped separator
        "1:0:0:0:0:ffff:10.0.0.1",
        // Address that is similar to IPv4 mapped, but is invalid
        "0:0:0:0:ffff:ffff:1.0.0.1",
        // Valid number of separators, but invalid IPv4 format
        "::1:2:3:4:5:6.7.8.9",
        // Too many digits
        "0:0:0:0:0:0:ffff:10.0.0.1",
        // Invalid IPv4 format
        ":1.2.3.4",
        // Invalid IPv4 format
        "::.2.3.4",
        // Invalid IPv4 format
        "::ffff:0.1.2."
    ]
}

// 原 Java 版本为 Map<byte[], String>；改用二元组数组以保留重复项与遍历顺序
func ipv6ToAddressStrings(): Array<(Array<UInt8>, String)> {
    return [
        // From the RFC 5952 https://tools.ietf.org/html/rfc5952#section-4
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], "2001:db8::1"),
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1], "2001:db8::2:1"),
        ([32, 1, 13, 184, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1], "2001:db8:0:1:1:1:1:1"),

        // Other examples
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1], "2001:db8::2:1"),
        ([32, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], "2001:0:0:1::1"),
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], "2001:db8::1:0:0:1"),
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0], "2001:db8:0:0:1::"),
        ([32, 1, 13, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0], "2001:db8::2:0"),
        ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], "::1"),
        ([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], "::1:0:0:0:1"),
        ([0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0], "::100:1:0:0:100:0"),
        ([32, 1, 0, 0, 65, 54, 227, 120, 128, 0, 99, 191, 63, 255, 253, 210], "2001:0:4136:e378:8000:63bf:3fff:fdd2"),
        ([170, 170, 187, 187, 204, 204, 221, 221, 238, 238, 255, 255, 17, 17, 34, 34], "aaaa:bbbb:cccc:dddd:eeee:ffff:1111:2222"),
        ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], "::")
    ]
}

func ipv4MappedToIPv6AddressStrings(): Array<(String, String)> {
    return [
        // IPv4 addresses
        ("255.255.255.255", "::ffff:255.255.255.255"),
        ("0.0.0.0", "::ffff:0.0.0.0"),
        ("127.0.0.1", "::ffff:127.0.0.1"),
        ("1.2.3.4", "::ffff:1.2.3.4"),
        ("192.168.0.1", "::ffff:192.168.0.1"),

        // IPv4 compatible addresses are deprecated [1], so we don't support outputting them, but we do support
        // parsing them into IPv4 mapped addresses. These values are treated the same as a plain IPv4 address above.
        // [1] https://tools.ietf.org/html/rfc4291#section-2.5.5.1
        ("0:0:0:0:0:0:255.254.253.252", "::ffff:255.254.253.252"),
        ("0:0:0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:0:0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0::0:0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0::0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0::0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0:0::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0::0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0::0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0::0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0::0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0::0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("0:0::1.2.3.4", "::ffff:1.2.3.4"),
        ("::0:1.2.3.4", "::ffff:1.2.3.4"),
        ("::1.2.3.4", "::ffff:1.2.3.4"),

        // IPv4 mapped (fully specified)
        ("0:0:0:0:0:ffff:1.2.3.4", "::ffff:1.2.3.4"),

        // IPv6 addresses
        // Fully specified
        ("2001:0:4136:e378:8000:63bf:3fff:fdd2", "2001:0:4136:e378:8000:63bf:3fff:fdd2"),
        ("aaaa:bbbb:cccc:dddd:eeee:ffff:1111:2222", "aaaa:bbbb:cccc:dddd:eeee:ffff:1111:2222"),
        ("0:0:0:0:0:0:0:0", "::"),
        ("0:0:0:0:0:0:0:1", "::1"),

        // Compressing at the beginning
        ("::1:0:0:0:1", "::1:0:0:0:1"),
        ("::1:ffff:ffff", "::1:ffff:ffff"),
        ("::", "::"),
        ("::1", "::1"),
        ("::ffff", "::ffff"),
        ("::ffff:0", "::ffff:0"),
        ("::ffff:ffff", "::ffff:ffff"),
        ("::0987:9876:8765", "::987:9876:8765"),
        ("::0987:9876:8765:7654", "::987:9876:8765:7654"),
        ("::0987:9876:8765:7654:6543", "::987:9876:8765:7654:6543"),
        ("::0987:9876:8765:7654:6543:5432", "::987:9876:8765:7654:6543:5432"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("::0987:9876:8765:7654:6543:5432:3210", "0:987:9876:8765:7654:6543:5432:3210"),

        // Compressing at the end
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("2001:db8:abcd:bcde:cdef:def1:ef12::", "2001:db8:abcd:bcde:cdef:def1:ef12:0"),
        ("2001:db8:abcd:bcde:cdef:def1::", "2001:db8:abcd:bcde:cdef:def1::"),
        ("2001:db8:abcd:bcde:cdef::", "2001:db8:abcd:bcde:cdef::"),
        ("2001:db8:abcd:bcde::", "2001:db8:abcd:bcde::"),
        ("2001:db8:abcd::", "2001:db8:abcd::"),
        ("2001:1234::", "2001:1234::"),
        ("2001::", "2001::"),
        ("0::", "::"),

        // Compressing in the middle
        ("1234:2345::7890", "1234:2345::7890"),
        ("1234::2345:7890", "1234::2345:7890"),
        ("1234:2345:3456::7890", "1234:2345:3456::7890"),
        ("1234:2345::3456:7890", "1234:2345::3456:7890"),
        ("1234::2345:3456:7890", "1234::2345:3456:7890"),
        ("1234:2345:3456:4567::7890", "1234:2345:3456:4567::7890"),
        ("1234:2345:3456::4567:7890", "1234:2345:3456::4567:7890"),
        ("1234:2345::3456:4567:7890", "1234:2345::3456:4567:7890"),
        ("1234::2345:3456:4567:7890", "1234::2345:3456:4567:7890"),
        ("1234:2345:3456:4567:5678::7890", "1234:2345:3456:4567:5678::7890"),
        ("1234:2345:3456:4567::5678:7890", "1234:2345:3456:4567::5678:7890"),
        ("1234:2345:3456::4567:5678:7890", "1234:2345:3456::4567:5678:7890"),
        ("1234:2345::3456:4567:5678:7890", "1234:2345::3456:4567:5678:7890"),
        ("1234::2345:3456:4567:5678:7890", "1234::2345:3456:4567:5678:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234:2345:3456:4567:5678:6789::7890", "1234:2345:3456:4567:5678:6789:0:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234:2345:3456:4567:5678::6789:7890", "1234:2345:3456:4567:5678:0:6789:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234:2345:3456:4567::5678:6789:7890", "1234:2345:3456:4567:0:5678:6789:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234:2345:3456::4567:5678:6789:7890", "1234:2345:3456:0:4567:5678:6789:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234:2345::3456:4567:5678:6789:7890", "1234:2345:0:3456:4567:5678:6789:7890"),
        // Note the compression is removed (rfc 5952 section 4.2.2)
        ("1234::2345:3456:4567:5678:6789:7890", "1234:0:2345:3456:4567:5678:6789:7890"),

        // IPv4 mapped addresses
        ("::ffff:255.255.255.255", "::ffff:255.255.255.255"),
        ("::ffff:0.0.0.0", "::ffff:0.0.0.0"),
        ("::ffff:127.0.0.1", "::ffff:127.0.0.1"),
        ("::ffff:1.2.3.4", "::ffff:1.2.3.4"),
        ("::ffff:192.168.0.1", "::ffff:192.168.0.1")
    ]
}

// ==================== 辅助函数 ====================

func assertHexDumpEquals(expected: ?String, actual: ?Array<UInt8>): Unit {
    @Assert(expected, hex(actual))
}

func hex(value: ?Array<UInt8>): ?String {
    if (value.isNone()) {
        return None
    }
    let buf = StringBuilder()
    for (b in value.getOrThrow()) {
        let h = StringUtil.byteToHexString(b)
        if (h.size == 1) {
            buf.append("0")
        }
        buf.append(h)
    }
    return buf.toString()
}

func unhex(value: String): Array<UInt8> {
    return StringUtil.decodeHexDump(value)
}

func copyWithOffset(bytes: ?Array<UInt8>): ?Array<UInt8> {
    if (bytes.isNone()) {
        return None
    }
    let b = bytes.getOrThrow()
    let array = Array<UInt8>(b.size + 2, repeat: 0)
    for (i in 0..b.size) {
        array[i + 1] = b[i]
    }
    return Some(array)
}

// ==================== 测试用例 ====================

@Test
class NetUtilTest {

    @TestCase
    func testLocalhost(): Unit {
        @Assert(LOCALHOST.isSome())
    }

    @TestCase
    func testLoopback(): Unit {
        @Assert(LOOPBACK_IF.isSome())
    }

    @TestCase
    func testIsValidIpV4Address(): Unit {
        for ((host, _) in validIpV4Hosts()) {
            @Assert(isValidIpV4Address(host), true)
        }
        for (host in invalidIpV4Hosts()) {
            @Assert(!isValidIpV4Address(host), true)
        }
    }

    @TestCase
    func testIsValidIpV6Address(): Unit {
        for ((host, _) in validIpV6Hosts()) {
            @Assert(isValidIpV6Address(host), true)
            if (!host.startsWith("[") && !host.contains("%")) {
                @Assert(getByName(host, true).isSome(), true)

                var hostMod = "[" + host + "]"
                @Assert(isValidIpV6Address(hostMod), true)

                hostMod = host + "%"
                @Assert(isValidIpV6Address(hostMod), true)

                hostMod = host + "%eth1"
                @Assert(isValidIpV6Address(hostMod), true)

                hostMod = "[" + host + "%]"
                @Assert(isValidIpV6Address(hostMod), true)

                hostMod = "[" + host + "%1]"
                @Assert(isValidIpV6Address(hostMod), true)

                hostMod = "[" + host + "]%"
                @Assert(!isValidIpV6Address(hostMod), true)

                hostMod = "[" + host + "]%1"
                @Assert(!isValidIpV6Address(hostMod), true)
            }
        }
        for (host in invalidIpV6Hosts()) {
            @Assert(!isValidIpV6Address(host), true)
            @Assert(getByName(host).isNone(), true)

            var hostMod = "[" + host + "]"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = host + "%"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = host + "%eth1"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = "[" + host + "%]"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = "[" + host + "%1]"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = "[" + host + "]%"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = "[" + host + "]%1"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = host + "]"
            @Assert(!isValidIpV6Address(hostMod), true)

            hostMod = "[" + host
            @Assert(!isValidIpV6Address(hostMod), true)
        }
    }

    @TestCase
    func testCreateByteArrayFromIpAddressString(): Unit {
        for ((ip, expected) in validIpV4Hosts()) {
            assertHexDumpEquals(Some(expected), createByteArrayFromIpAddressString(ip))
        }
        for (ip in invalidIpV4Hosts()) {
            assertHexDumpEquals(None, createByteArrayFromIpAddressString(ip))
        }
        for ((ip, expected) in validIpV6Hosts()) {
            assertHexDumpEquals(Some(expected), createByteArrayFromIpAddressString(ip))
        }
        for (ip in invalidIpV6Hosts()) {
            assertHexDumpEquals(None, createByteArrayFromIpAddressString(ip))
        }
    }

    @TestCase
    func testBytesToIpAddress(): Unit {
        for ((ip, _) in validIpV4Hosts()) {
            @Assert(ip == bytesToIpAddress(createByteArrayFromIpAddressString(ip).getOrThrow()))
            @Assert(ip == bytesToIpAddress(validIpV4ToBytes(ip)))
        }
        for ((bytes, expected) in ipv6ToAddressStrings()) {
            @Assert(expected == bytesToIpAddress(bytes))
        }
    }

    @TestCase
    func testBytesToIpAddressWithOffset(): Unit {
        for ((ip, _) in validIpV4Hosts()) {
            let bytes = copyWithOffset(createByteArrayFromIpAddressString(ip)).getOrThrow()
            @Assert(ip == bytesToIpAddress(bytes, 1, bytes.size - 2))

            let bytes2 = copyWithOffset(createByteArrayFromIpAddressString(ip)).getOrThrow()
            @Assert(ip == bytesToIpAddress(bytes2, 1, bytes2.size - 2))
        }

        for ((bytes, expected) in ipv6ToAddressStrings()) {
            let offsetBytes = copyWithOffset(Some(bytes)).getOrThrow()
            @Assert(expected == bytesToIpAddress(offsetBytes, 1, offsetBytes.size - 2))
        }
    }

    @TestCase
    func testIp6AddressToString(): Unit {
        for ((bytes, expected) in ipv6ToAddressStrings()) {
            @Assert(expected == toAddressString(InetAddress.getByAddress(bytes)))
        }
    }

    @TestCase
    func testIp4AddressToString(): Unit {
        for ((ip, expected) in validIpV4Hosts()) {
            @Assert(ip == toAddressString(InetAddress.getByAddress(unhex(expected))))
        }
    }

    @TestCase
    func testIPv4ToInt(): Unit {
        let loopback = (InetAddress.getByName("127.0.0.1").getOrThrow() as Inet4Address).getOrThrow()
        let expected1: Int32 = 2130706433
        @Assert(ipv4AddressToInt(loopback) == expected1)

        let address = (InetAddress.getByName("192.168.1.1").getOrThrow() as Inet4Address).getOrThrow()
        let expected2: Int32 = -1062731519
        @Assert(ipv4AddressToInt(address) == expected2)
    }

    @TestCase
    func testIpv4MappedIp6GetByName(): Unit {
        for ((srcIp, dstIp) in ipv4MappedToIPv6AddressStrings()) {
            let inet6Address = getByName(srcIp, true)
            @Assert(inet6Address.isSome(), true)
            @Assert(dstIp, toAddressString(inet6Address.getOrThrow(), true))
        }
    }

    @TestCase
    func testInvalidIpv4MappedIp6GetByName(): Unit {
        for (host in invalidIpV4Hosts()) {
            @Assert(getByName(host, true).isNone(), true)
        }

        for (host in invalidIpV6Hosts()) {
            @Assert(getByName(host, true).isNone(), true)
        }
    }

    @TestCase
    func testIp6InetSocketAddressToString(): Unit {
        for ((bytes, expected) in ipv6ToAddressStrings()) {
            let address = InetAddress.getByAddress(bytes)
            @Assert("[" + expected + "]:9999" == toSocketAddressString(InetSocketAddress(address, 9999)))
        }
    }

    @TestCase
    func testIp4SocketAddressToString(): Unit {
        for ((ip, expected) in validIpV4Hosts()) {
            let address = InetAddress.getByAddress(unhex(expected))
            @Assert(ip + ":9999" == toSocketAddressString(InetSocketAddress(address, 9999)))
        }
    }
}
