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
public class Test_IPAddress_Static_Func {
    @TestCase[pos_str in [ "0.0.0.0", "255.255.255.255", "::", "::1", "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff" ] 
]
    func case_parse_01(pos_str: String): Unit {
        @Expect(IPAddress.parse(pos_str).toString(), pos_str)
    }

    let illegal_addr = [
        "",
        "ffff:ffff:ffff:ffff:ffff:ffff:ffff:fffg",
        "ffff:ffff:ffff:ffff:ffff:ffff:ffff",
        "::ffff:ffff:ffff:ffff::",
        "::G",
        "\00.0.0.0",
        "0.0.0.",
        ".0.0.0",
        "0.0.0",
        "255.255.255.256",
        "256.255.255.255",
        "::10000",
        "华::1"
    ]

    @TestCase[str in illegal_addr 
]
    func case_parse_02(str: String): Unit {
        let e = @AssertThrows[IllegalFormatException](IPAddress.parse(str))
        println(e.message)
    }

    @TestCase[pos_str in [ "0.0.0.0", "255.255.255.255", "::", "::1", "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff" ] 
]
    func case_tryParse_01(pos_str: String): Unit {
        @Expect(IPAddress.tryParse(pos_str).getOrThrow().toString(), pos_str)
    }

    @TestCase[str in illegal_addr 
]
    func case_tryParse_02(str: String): Unit {
        @Expect(IPAddress.tryParse(str), None)
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
    func case_readBigEndian_01(pos_str: String): Unit {
        let buf = Array<Byte>(128, repeat: 0)
        let ip_0 = IPAddress.parse(pos_str)
        var len = ip_0.writeBigEndian(buf)
        let ip_1 = IPAddress.readBigEndian(buf[0..len])
        @Expect(ip_0.size, ip_1.size)
        @Expect(ip_0.toString(), ip_1.toString())
    }

    @TestCase
    func case_readBigEndian_02(): Unit {
        var arr = Array<Byte>()
        var e = @AssertThrows[IllegalArgumentException](IPAddress.readBigEndian(arr))
        @Expect(e.message, "The buffer size must be 4 or 16")
        arr = Array<Byte>(16, repeat: 255u8)
        @Expect(IPAddress.readBigEndian(arr).toString(), "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff")
        arr = Array<Byte>(16, repeat: 0u8)
        @Expect(IPAddress.readBigEndian(arr).toString(), "::")
        arr = Array<Byte>(17, repeat: 0u8)
        e = @AssertThrows[IllegalArgumentException](IPAddress.readBigEndian(arr))
        @Expect(e.message, "The buffer size must be 4 or 16")
    }

    @TestCase
    func case_resolve_01(): Unit {
        IPAddress.resolve("LOCALHOST")
        IPAddress.resolve("localhost")
        IPAddress.resolve("example.com")
        // 难以稳定，随时可能变化
        //@Expect(IPAddress.resolve("example.com").toString().contains("39.156.66.10") || IPAddress.resolve("example.com").toString().contains("110.242.68.66"))
        //@Expect(IPAddress.resolve("LOCALHOST"), IPAddress.resolve("localhost"))
    }
}
