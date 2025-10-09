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
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_SocketAddress {
    @TestCase
    func case_ip_socketaddress_01() {
        let addr1: SocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        @Expect(addr1.size, 16)
        @Expect(addr1.family.toString(), "INET")
        @Expect(addr1.getAddressBytes(), [2u8, 0u8, 31u8, 144u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        let addr1_1: SocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        @Expect(addr1 == addr1_1)
        let addr2: SocketAddress = IPSocketAddress.parse("0.0.0.0:8081")
        @Expect(addr2.getAddressBytes(), [2u8, 0u8, 31u8, 145u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), -756921228794979323)
        @Expect(addr1_1.hashCode(), -756921228794979323)
        @Expect(addr2.hashCode(), -756921228794979302)
    }

    @TestCase
    func case_ip_socketaddress_02() {
        let addr1: SocketAddress = IPSocketAddress.parse("[::]:8080")
        @Expect(addr1.size, 28)
        @Expect(addr1.family.toString(), "INET6")
        @Expect(addr1.getAddressBytes()[1..28], [0u8, 31u8, 144u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,
        0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        let addr1_1: SocketAddress = IPSocketAddress.parse("[::]:8080")
        @Expect(addr1 == addr1_1)
        let addr2: SocketAddress = IPSocketAddress.parse("[::]:8081")
        @Expect(addr2.getAddressBytes()[1..28], [0u8, 31u8, 145u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8,0u8,
        0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), -4705207227553743927)
        @Expect(addr1_1.hashCode(), -4705207227553743927)
        @Expect(addr2.hashCode(), -4705207227553743922)
    }

    @TestCase
    func case_unix_socketaddress_01() {
        let addr1: SocketAddress = UnixSocketAddress("./path01")
        @Expect(addr1.size, 10)
        @Expect(addr1.family.toString(), "UNIX")
        @Expect(addr1.getAddressBytes(), [1u8, 0u8, 46u8, 47u8, 112u8, 97u8, 116u8, 104u8, 48u8, 49u8])
        if (exists("./path01") == false) {
            File.create("./path01").close()
        }
        let addr1_1: SocketAddress = UnixSocketAddress("./path01")
        @Expect(addr1 == addr1_1)
        let path_str = canonicalize(Path("./path01")).toString()
        if (path_str.toArray().size <= 108) {
            let addr1_2: SocketAddress = UnixSocketAddress(canonicalize(Path("./path01")).toString())
            @Expect(addr1 != addr1_2) //不做规范化处理
        } else {
            let e = @AssertThrows[IllegalArgumentException](UnixSocketAddress(path_str))
            @Expect(e.message.contains("Path size(${path_str.toArray().size}) is too long"))
        }

        let addr2: SocketAddress = UnixSocketAddress("./path02")
        @Expect(addr2.getAddressBytes(), [1u8, 0u8, 46u8, 47u8, 112u8, 97u8, 116u8, 104u8, 48u8, 50u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), 7908304158472571730)
        @Expect(addr1_1.hashCode(), 7908304158472571730)
        @Expect(addr2.hashCode(), 7908304158472571741)
    }

    @TestCase
    func case_address_assertion() {
        let addr1: SocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        let addr2: SocketAddress = IPSocketAddress.parse("[::]:8080")
        let addr3: SocketAddress = IPSocketAddress.parse("[2001:0db8:85a3:0000:0000:8a2e:0370:7334]:8080")
        let addr4: SocketAddress = IPSocketAddress.parse("[2001:db8:85a3::8a2e:370:7334]:8080")
        let addr5: SocketAddress = IPSocketAddress.parse("[2001:db8:85a3::8a2e:370:7334%0]:8080")
        let addr6: SocketAddress = UnixSocketAddress("./00008080")
        @Expect(addr1 != addr2)
        @Expect(addr3 == addr4)
        @Expect(addr4 != addr5)
        @Expect(addr5 != addr6)
    }

    @TestCase
    func case_address_tostring() {
        let addr1: SocketAddress = IPSocketAddress.parse("0.0.0.0:8080")
        let addr2: SocketAddress = IPSocketAddress.parse("[::]:8080")
        let addr3: SocketAddress = IPSocketAddress.parse("[2001:0db8:85a3:0000:0000:8a2e:0370:7334]:8080")
        let addr4: SocketAddress = IPSocketAddress.parse("[2001:db8:85a3::8a2e:370:7334]:8080")
        let addr5: SocketAddress = IPSocketAddress.parse("[2001:db8:85a3::8a2e:370:7334%0]:8080")
        let addr6: SocketAddress = UnixSocketAddress("./00008080")
        @Expect(addr1.toString(), "0.0.0.0:8080")
        @Expect(addr2.toString(), "[::]:8080")
        @Expect(addr3.toString(), "[2001:db8:85a3::8a2e:370:7334]:8080")
        @Expect(addr4.toString(), "[2001:db8:85a3::8a2e:370:7334]:8080")
        @Expect(addr5.toString(), "[2001:db8:85a3::8a2e:370:7334%0]:8080")
        @Expect(addr6.toString(), "./00008080")
    }
}
