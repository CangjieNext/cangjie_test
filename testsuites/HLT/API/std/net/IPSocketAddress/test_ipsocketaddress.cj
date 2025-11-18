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
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_IPSocketAddress {
    @TestCase
    func case_ip_socketaddress_01() {
        let addr1: IPSocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        @Expect(addr1.size, 16)
        @Expect(addr1.family.toString(), "INET")
        @Expect(addr1.getAddressBytes(), [2u8, 0u8, 31u8, 144u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        let addr1_1: IPSocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        @Expect(addr1 == addr1_1)
        let addr2: IPSocketAddress = IPSocketAddress.parse("0.0.0.0:8081")
        @Expect(addr2.getAddressBytes(), [2u8, 0u8, 31u8, 145u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), -756921228794979323)
        @Expect(addr1_1.hashCode(), -756921228794979323)
        @Expect(addr2.hashCode(), -756921228794979302)
    }

    @TestCase
    func case_ip_socketaddress_02() {
        let addr1: IPSocketAddress = IPSocketAddress.parse("[::]:8080")
        @Expect(addr1.size, 28)
        @Expect(addr1.family.toString(), "INET6")
        @Expect(addr1.getAddressBytes()[1..28], [0u8, 31u8, 144u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 
        0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        let addr1_1: IPSocketAddress = IPSocketAddress.parse("[::]:8080")
        @Expect(addr1 == addr1_1)
        let addr2: IPSocketAddress = IPSocketAddress.parse("[::]:8081")
        @Expect(addr2.getAddressBytes()[1..28], [0u8, 31u8, 145u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,0u8, 
        0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), -4705207227553743927)
        @Expect(addr1_1.hashCode(), -4705207227553743927)
        @Expect(addr2.hashCode(), -4705207227553743922)
    }

    @TestCase[arr in [ 
 [ 0u8, 0u8, 0u8, 0u8 ], 
 [ 255u8, 0u8, 0u8, 255u8 ], 
 [ 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8 ], 
 [ 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8, 255u8 ] 
 ], 
 port in [ 0u16, 1000u16, 65535u16 ] 
]
    func case_ip_socketaddress_init_1_01(arr: Array<Byte>, port: UInt16) {
        let addr = IPSocketAddress(arr, port)
        @Expect(addr.port, port)
    }

    @TestCase
    func case_ip_socketaddress_init_1_02() {
        var e = @AssertThrows[IllegalArgumentException](IPSocketAddress(Array<Byte>(), 0))
        @Expect(e.message.contains("IPSocketAddress only support IPv4 and IPv6 address"))
        e = @AssertThrows[IllegalArgumentException](IPSocketAddress(Array<Byte>(3, repeat: 0u8), 0))
        @Expect(e.message.contains("IPSocketAddress only support IPv4 and IPv6 address"))
        e = @AssertThrows[IllegalArgumentException](IPSocketAddress(Array<Byte>(5, repeat: 0u8), 0))
        @Expect(e.message.contains("IPSocketAddress only support IPv4 and IPv6 address"))
        e = @AssertThrows[IllegalArgumentException](IPSocketAddress(Array<Byte>(17, repeat: 0u8), 0))
        @Expect(e.message.contains("IPSocketAddress only support IPv4 and IPv6 address"))
    }

    @TestCase[str in [ 
 "0.0.0.0", 
 "255.255.255.255", 
 "::", 
 "::1", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%128" 
 ], 
 port in [ 0u16, 1000u16, 65535u16 ] 
]
    func case_ip_socketaddress_init_2_01(str: String, port: UInt16) {
        let addr = IPSocketAddress(str, port)
    }

    @TestCase[str in [ 
 "", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:fffg", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff%1280", 
 "::ffff:ffff:ffff:ffff::", 
 "::G", 
 "\00.0.0.0", 
 "0.0.0.", 
 ".0.0.0", 
 "0.0.0", 
 "255.255.255.256", 
 "256.255.255.255", 
 "::10000", 
 "华::1", 
 "/tmp/path", 
 "./path01" 
 ], 
 port in [ 0u16, 1000u16, 65535u16 ] 
]
    func case_ip_socketaddress_init_2_02(str: String, port: UInt16) {
        @AssertThrows[IllegalArgumentException](IPSocketAddress(str, port))
    }

    @TestCase[str in [ 
 "0.0.0.0", 
 "255.255.255.255", 
 "::", 
 "::1", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%128" 
 ], 
 port in [ 0u16, 1000u16, 65535u16 ] 
]
    func case_ip_socketaddress_init_3_01(str: String, port: UInt16) {
        let ip = IPAddress.parse(str)
        let addr = IPSocketAddress(ip, port)
    }

    @TestCase[str_cp in [ 
("0.0.0.0:0", "0.0.0.0"), 
("255.255.255.255:65535", "255.255.255.255"), 
("[000::000]:12345", "::"), 
("[::1]:0", "::1"), 
("[ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff]:65535", "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"), 
("[2001:0db8:85a3:0000:0000:8a2e:0370:7334%128]:111", "2001:db8:85a3::8a2e:370:7334%128") 
 ] 
]
    func case_parse_01(str_cp: (String, String)) {
        let (ipsocketaddress, addr) = str_cp
        @Expect(IPSocketAddress.parse(ipsocketaddress).address.toString(), addr)
    }

    @TestCase[str in [ 
 "0.0.0.0", 
 "2001:0db8:85a3:0000:0000:8a2e:0370:7334%128", 
 "0.0.0.:0", 
 "0.0.0:123", 
 ".0.0.0:0", 
 "::1::123", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff:123a", 
 "ffff:ffff:ffff:ffff:ffff:ffff:ffff:fffg:123", 
 "[ffff:ffff:ffff:ffff:ffff:ffff:ffff]:65535", 
 "[2001:0db8:85a3:0000:0000:8a2e:0370:7334:0%128]:111", 
 "[::0::%128]:111", 
 "[2001:0db8:85a3:0000:0000:8a2e:0370:7334%123456789098]:111", 
 "[2001:0db8:85a3:0000:0000:8a2e:0370:7334%128]:-1", 
 "[2001:0db8:85a3:0000:0000:8a2e:0370:7334%128]:65536", 
 "[2001:0db8:85a3:0000:0000:8a2e:0370:7334%128]:1111.0" 
 ] 
]
    func case_parse_02(str: String) {
        @AssertThrows[IllegalArgumentException](IPSocketAddress.parse(str))
    }

    @TestCase[str in [ 
 "ffff:ffff:ffff:ffff:ffff:fFff:ffff:ffff:123", 
 "::1:123", 
 "::12345" 
 ] 
]
    @Skip
    func case_parse_03(str: String) {
        @AssertThrows[IllegalArgumentException](IPSocketAddress.parse(str))
    }

    @TestCase
    func case_getAddressBytes() {
        let addr1: IPSocketAddress = IPSocketAddress.parse("[::%1234]:8080")
        @Expect(addr1.size, 28)
        @Expect(addr1.family.toString(), "INET6")
        let data: Array<Byte> = [10, 0, 31, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 4, 0,
            0]
        @Expect(addr1.getAddressBytes()[1..28], data[1..28])
    }

    @TestCase
    func case_ipv4_ipv6() {
        let addr1: IPSocketAddress = IPSocketAddress.parse("[::%1234]:8080")
        let addr2: IPSocketAddress = IPSocketAddress.parse("127.0.0.0:8080")
        @Expect(addr1.isIPv4(), false)
        @Expect(addr1.isIPv6())
        @Expect(addr2.isIPv4())
        @Expect(addr2.isIPv6(), false)
    }
}
