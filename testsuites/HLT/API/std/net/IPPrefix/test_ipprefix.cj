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
public class Test_IPPrefix {
    @TestCase[ip_cp in [ 
("0.0.0.0/0", "0.0.0.0"), 
("0.0.0.0/32", "0.0.0.0"), 
("255.255.255.255/16", "255.255.255.255"), 
("1.2.3.4/1", "1.2.3.4"), 
("192.0.2.128/31", "192.0.2.128"), 
("::/0", "::"), 
("::1/128", "::1"), 
("2620:4f:8000::/16", "2620:4f:8000::"), 
("::ffff:0:0/127", "::ffff:0.0.0.0"), 
("2001:0db8:85a3:0000:0000:8a2e:0370:7334/13", "2001:db8:85a3::8a2e:370:7334"), 
("::ffff:0:0%0/127", "::ffff:0.0.0.0%0"), 
("2001:0db8:85a3:0000:0000:8a2e:0370:7334%128/13", "2001:db8:85a3::8a2e:370:7334%128") 
 ] 
]
    func case_parse_01(ip_cp: (String, String)) {
        let (ippre_str, ip_str) = ip_cp
        @Expect(IPPrefix.parse(ippre_str).address.toString(), ip_str)
    }

    @TestCase[ippre_str in [ 
 "", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:fffg/32", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff/128", 
 "::ffff:ffff:ffff:ffff::/4", 
 "::G/0", 
 "\00.0.0.0/30", 
 "0.0.0./0", 
 ".0.0.0/0", 
 "0.0.0/0", 
 "255.255.255.256/0", 
 "256.255.255.255/0", 
 "::10000/0", 
 "华::1/0", 
 "0.0.0.0//0", 
 "0.0.0.0/33", 
 "0.0.0.0/", 
 "::/129", 
 "::/", 
 "::/\030", 
 "::/30\0", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%4294967296/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%-1/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:-334%0/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%\0128/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%中128/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:-334%0%0/13", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:-334%0%0/" 
 ] 
]
    func case_parse_02(ippre_str: String) {
        @AssertThrows[IllegalFormatException | IllegalArgumentException](IPPrefix.parse(ippre_str))
    }

    @TestCase
    func case_contains_addr_01() {
        var ip_pre = IPPrefix.parse("0.0.0.0/32")
        @Expect(ip_pre.contains(IPAddress.parse("0.0.0.0")))
        @Expect(ip_pre.contains(IPAddress.parse("0.0.0.1")), false)
        @Expect(ip_pre.contains(IPAddress.parse("::")), false)
        ip_pre = IPPrefix.parse("0.0.0.0/0")
        @Expect(ip_pre.contains(IPAddress.parse("0.0.0.0")))
        @Expect(ip_pre.contains(IPAddress.parse("255.255.255.255")))
        @Expect(ip_pre.contains(IPAddress.parse("::")), false)
        ip_pre = IPPrefix.parse("192.168.0.0/12")
        @Expect(ip_pre.contains(IPAddress.parse("192.160.0.0")))
        @Expect(ip_pre.contains(IPAddress.parse("192.175.255.255")))
        @Expect(ip_pre.contains(IPAddress.parse("192.159.255.255")), false)
        @Expect(ip_pre.contains(IPAddress.parse("192.176.0.0")), false)
    }

    @TestCase
    func case_contains_addr_02() {
        var ip_pre = IPPrefix.parse("::/128")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("::1")), false)
        ip_pre = IPPrefix.parse("::/0")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")))
        @Expect(ip_pre.contains(IPAddress.parse("0.0.0.0")), false)
        ip_pre = IPPrefix.parse("::/64")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("::ffff:ffff:ffff:ffff")))
        @Expect(ip_pre.contains(IPAddress.parse("::1:0:0:0:0")), false)
        ip_pre = IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23")
        @Expect(ip_pre.contains(IPAddress.parse("2001:0C00:0000:0000:0000:0000:0000:0000")))
        @Expect(ip_pre.contains(IPAddress.parse("2001:0DFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF")))
        @Expect(ip_pre.contains(IPAddress.parse("2001:0BFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF")), false)
        @Expect(ip_pre.contains(IPAddress.parse("2001:0E00:0000:0000:0000:0000:0000:0000")), false)
    }

    @TestCase
    func case_contains_addr_03() {
        var ip_pre = IPPrefix.parse("::%0/128")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("::1")), false)
        ip_pre = IPPrefix.parse("::%1/0")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")))
        @Expect(ip_pre.contains(IPAddress.parse("0.0.0.0")), false)
        ip_pre = IPPrefix.parse("::%128/64")
        @Expect(ip_pre.contains(IPAddress.parse("::")))
        @Expect(ip_pre.contains(IPAddress.parse("::ffff:ffff:ffff:ffff")))
        @Expect(ip_pre.contains(IPAddress.parse("::1:0:0:0:0")), false)
        ip_pre = IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%20/23")
        @Expect(ip_pre.contains(IPAddress.parse("2001:0C00:0000:0000:0000:0000:0000:0000")))
        @Expect(ip_pre.contains(IPAddress.parse("2001:0DFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF")))
        @Expect(ip_pre.contains(IPAddress.parse("2001:0BFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF")), false)
        @Expect(ip_pre.contains(IPAddress.parse("2001:0E00:0000:0000:0000:0000:0000:0000")), false)
    }

    @TestCase
    func case_contains_ippre_01() {
        var ip_pre = IPPrefix.parse("0.0.0.0/32")
        @Expect(ip_pre.contains(IPPrefix.parse("0.0.0.0/32")))
        @Expect(ip_pre.contains(IPPrefix.parse("0.0.0.0/31")), false)
        ip_pre = IPPrefix.parse("0.0.0.0/0")
        @Expect(ip_pre.contains(IPPrefix.parse("0.0.0.0/0")))
        @Expect(ip_pre.contains(IPPrefix.parse("0.0.0.0/32")))
        @Expect(ip_pre.contains(IPPrefix.parse("255.255.255.255/16")))
        @Expect(ip_pre.contains(IPPrefix.parse("::/16")), false)
        ip_pre = IPPrefix.parse("192.168.0.0/12")
        @Expect(ip_pre.contains(IPPrefix.parse("192.168.0.0/13")))
        @Expect(ip_pre.contains(IPPrefix.parse("192.168.255.0/12")))
        @Expect(ip_pre.contains(IPPrefix.parse("192.160.0.0/12")))
        @Expect(ip_pre.contains(IPPrefix.parse("192.175.255.255/13")))
        @Expect(ip_pre.contains(IPPrefix.parse("192.175.255.255/11")), false)
    }

    @TestCase
    func case_contains_ippre_02() {
        var ip_pre = IPPrefix.parse("::/128")
        @Expect(ip_pre.contains(IPPrefix.parse("::/128")))
        @Expect(ip_pre.contains(IPPrefix.parse("::/127")), false)
        ip_pre = IPPrefix.parse("::/0")
        @Expect(ip_pre.contains(IPPrefix.parse("::/0")))
        @Expect(ip_pre.contains(IPPrefix.parse("::/128")))
        @Expect(ip_pre.contains(IPPrefix.parse("ffff::/16")))
        @Expect(ip_pre.contains(IPPrefix.parse("0.0.0.0/16")), false)
        ip_pre = IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23")
        @Expect(ip_pre.contains(IPPrefix.parse("2001:0C00:0000:0000:0000:0000:0000:0000/23")))
        @Expect(ip_pre.contains(IPPrefix.parse("2001:0DFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF/128")))
        @Expect(ip_pre.contains(IPPrefix.parse("2001:0BFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF/23")), false)
        @Expect(ip_pre.contains(IPPrefix.parse("2001:0C00:0000:0000:0000:0000:0000:0000/22")), false)
    }

    @TestCase
    func case_overlaps_ippre_01() {
        var ip_pre = IPPrefix.parse("0.0.0.0/32")
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/32")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/31")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.1/32")), false)
        @Expect(ip_pre.overlaps(IPPrefix.parse("::1/32")), false)
        ip_pre = IPPrefix.parse("0.0.0.0/0")
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/0")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/32")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("255.255.255.255/16")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("::/16")), false)
        ip_pre = IPPrefix.parse("192.168.0.0/12")
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.168.0.0/13")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.168.255.0/12")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.160.0.0/12")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.175.255.255/13")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.175.255.255/11")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("192.176.0.0/12")),false)
    }

    @TestCase
    func case_overlaps_ippre_02() {
        var ip_pre = IPPrefix.parse("::/128")
        @Expect(ip_pre.overlaps(IPPrefix.parse("::/128")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("::/0")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("1::/15")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("1::/16")), false)
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/0")), false)
        ip_pre = IPPrefix.parse("::/0")
        @Expect(ip_pre.overlaps(IPPrefix.parse("::/0")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("::/128")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("ffff::/16")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("0.0.0.0/16")), false)
        ip_pre = IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23")
        @Expect(ip_pre.overlaps(IPPrefix.parse("2001:0C00:0000:0000:0000:0000:0000:0000/23")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("2001:0DFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF/128")))
        @Expect(ip_pre.overlaps(IPPrefix.parse("2001:0BFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF/24")), false)
        @Expect(ip_pre.overlaps(IPPrefix.parse("2001:0E00:0000:0000:0000:0000:0000:0000/32")), false)
        @Expect(ip_pre.overlaps(IPPrefix.parse("2001:0C00:0000:0000:0000:0000:0000:0000/20")))
    }

    @TestCase
    func case_netmask_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32").netmask().toString(), "255.255.255.255")
        @Expect(IPPrefix.parse("0.0.0.0/0").netmask().toString(), "0.0.0.0")
        @Expect(IPPrefix.parse("192.168.0.0/12").netmask().toString(), "255.240.0.0")
        @Expect(IPPrefix.parse("::/128").netmask().toString(), "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")
        @Expect(IPPrefix.parse("::/0").netmask().toString(), "::")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23").netmask().toString(), "ffff:fe00::")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%0/128").netmask().toString(), "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")
    }

    @TestCase
    func case_hostmask_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32").hostmask().toString(), "0.0.0.0")
        @Expect(IPPrefix.parse("0.0.0.0/0").hostmask().toString(), "255.255.255.255")
        @Expect(IPPrefix.parse("192.168.0.0/12").hostmask().toString(), "0.15.255.255")
        @Expect(IPPrefix.parse("::/128").hostmask().toString(), "::")
        @Expect(IPPrefix.parse("::/0").hostmask().toString(), "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23").hostmask().toString(), "0:1ff:ffff:ffff:ffff:ffff:ffff:ffff")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%0/128").hostmask().toString(), "::")
    }

    @TestCase
    func case_broadcast_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32").broadcast().toString(), "0.0.0.0")
        @Expect(IPPrefix.parse("0.0.0.0/0").broadcast().toString(), "255.255.255.255")
        @Expect(IPPrefix.parse("192.168.0.0/12").broadcast().toString(), "192.175.255.255")
        @Expect(IPPrefix.parse("::/128").broadcast().toString(), "::")
        @Expect(IPPrefix.parse("::/0").broadcast().toString(), "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23").broadcast().toString(), "2001:dff:ffff:ffff:ffff:ffff:ffff:ffff")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%0/128").broadcast().toString(), "2001:db8:85a3::8a2e:370:7334")
    }

    @TestCase
    func case_network_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32").network().toString(), "0.0.0.0")
        @Expect(IPPrefix.parse("0.0.0.0/0").network().toString(), "0.0.0.0")
        @Expect(IPPrefix.parse("192.168.0.0/12").network().toString(), "192.160.0.0")
        @Expect(IPPrefix.parse("::/128").network().toString(), "::")
        @Expect(IPPrefix.parse("::/0").network().toString(), "::")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23").network().toString(), "2001:c00::")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%0/128").network().toString(), "2001:db8:85a3::8a2e:370:7334")
    }

    @TestCase
    func case_masked_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32").masked().toString(), "0.0.0.0/32")
        @Expect(IPPrefix.parse("0.0.0.0/0").masked().toString(), "0.0.0.0/0")
        @Expect(IPPrefix.parse("192.168.1.1/12").masked().toString(), "192.160.0.0/12")
        @Expect(IPPrefix.parse("::/128").masked().toString(), "::/128")
        @Expect(IPPrefix.parse("::/0").masked().toString(), "::/0")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23").masked().toString(), "2001:c00::/23")
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%0/128").masked().toString(), "2001:db8:85a3::8a2e:370:7334/128")
    }

    @TestCase
    func case_assertEqual_01() {
        @Expect(IPPrefix.parse("0.0.0.0/32") == IPPrefix.parse("0.0.0.0/32"))
        @Expect(IPPrefix.parse("0.0.0.0/32") == IPPrefix.parse("0.0.0.0/31"), false)
        @Expect(IPPrefix.parse("0.0.0.0/0") == IPPrefix.parse("0.0.0.0/0"))
        @Expect(IPPrefix.parse("0.0.0.0/0") == IPPrefix.parse("0.0.0.0/16"), false)
        @Expect(IPPrefix.parse("0.0.0.0/0") == IPPrefix.parse("::/0"), false)

        @Expect(IPPrefix.parse("::/128") == IPPrefix.parse("::/128"))
        @Expect(IPPrefix.parse("::/128") == IPPrefix.parse("::/127"), false)
        @Expect(IPPrefix.parse("::/128") == IPPrefix.parse("0.0.0.0/32"), false)
        @Expect(IPPrefix.parse("::/128") == IPPrefix.parse("::%128/128"), false)
        @Expect(IPPrefix.parse("::%0/128") == IPPrefix.parse("::%0/127"), false)
        @Expect(IPPrefix.parse("::%32/128") == IPPrefix.parse("::%128/128"), false)
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23") == IPPrefix.parse("2001:c00::/23"), false)
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/128") == IPPrefix.parse("2001:db8:85a3::8a2e:370:7334/128"))
    }

    @TestCase
    func case_assertUnEqual_01() {
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23") != IPPrefix.parse("2001:c00::/23"))
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23") != IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334%1/23"))
        @Expect(IPPrefix.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334/23") != IPPrefix.parse("0.0.0.0/23"))
    }
}
