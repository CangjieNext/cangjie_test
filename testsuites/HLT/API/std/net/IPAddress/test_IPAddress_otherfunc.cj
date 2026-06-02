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
public class Test_IPAddress_Funcs {
    @TestCase
    @Skip //当前未实现
    func case_hostName() {
        @Expect(IPAddress.parse("127.0.0.1").hostName, "")
        @Expect(IPAddress.parse("0.0.0.0").hostName, "")
    }

    @TestCase
    func case_size() {
        @Expect(IPAddress.parse("127.0.0.1").size, 4)
        @Expect(IPAddress.parse("0.0.0.0").size, 4)
        @Expect(IPAddress.parse("::").size, 16)
        @Expect(IPAddress.parse("::1").size, 16)
        @Expect(IPAddress.parse("::ffff:192.0.2.128").size, 16)
    }

    let All_Str = [
        "192.168.1.1",
        "::1",
        "ff02::1",
        "2001:db8::1",
        "0.0.0.0",
        "255.255.255.255",
        "223.255.255.255",
        "172.16.0.0",
        "169.254.1.1",
        "2001:0db8:85a3:0000:0000:8a2e:0370:7334",
        "fe80::1",
        "127.0.0.1",
        "10.0.0.1",
        "::",
        "2607:f0d0:1002:51::4",
        "100.64.0.0",
        "192.0.0.8",
        "192.0.0.9",
        "192.0.0.171",
        "192.31.196.0",
        "192.52.193.0",
        "192.88.99.0",
        "192.175.48.0",
        "198.18.0.0",
        "240.0.0.0",
        "203.0.113.0",
        "198.51.100.0",
        "::ffff:0:0",
        "64:ff9b::",
        "64:ff9b:1::",
        "100::",
        "2001::",
        "2001:1::1",
        "2001:1::2",
        "2001:1::3",
        "2001:2::",
        "2001:3::",
        "2001:4:112::",
        "2001:10::",
        "2001:20::",
        "2001:30::",
        "2001:db8::",
        "2002::",
        "2620:4f:8000::",
        "3fff::",
        "5f00::",
        "fc00::",
        "fe80::"
    ]

    @TestCase[pos_str in All_Str 
]
    func case_getAddressBytes(pos_str: String) {
        let ip_0 = IPAddress.parse(pos_str)
        var arr = ip_0.getAddressBytes()
        let ip_1 = IPAddress.readBigEndian(arr)
        @Expect(ip_0.size, ip_1.size)
        @Expect(ip_0.toString(), ip_1.toString())
    }

    @TestCase
    func case_hashCode() {
        @Expect(IPAddress.parse("127.0.0.1").hashCode(), -7046029252255646698)
        @Expect(IPAddress.parse("0.0.0.0").hashCode(), -7046029254386353131)
        @Expect(IPAddress.parse("::").hashCode(), -3307087234192089307)
    }

    @TestCase[pos_str in All_Str, 
 pre_len in [ 0, 4, 8, 32 ] 
]
    func case_getPrefix(pos_str: String, pre_len: UInt8) {
        let ip_0 = IPAddress.parse(pos_str)
        let ip_pre = ip_0.getPrefix(pre_len)
        @Expect(ip_0.toString(), ip_pre.address.toString())
        @Expect(ip_pre.prefixLength, pre_len)
    }

    @TestCase
    func case_toString() {
        @Expect(IPAddress.parse("0.0.0.0").toString(), "0.0.0.0")
        @Expect(IPAddress.parse("::").toString(), "::")
        @Expect(IPAddress.parse("::ffff:192.0.2.128").toString(), "::ffff:192.0.2.128")
        @Expect(IPAddress.parse("::ffff:c000:0280").toString(), "::ffff:192.0.2.128")
        @Expect(IPAddress.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334").toString(), "2001:db8:85a3::8a2e:370:7334")
    }
}
