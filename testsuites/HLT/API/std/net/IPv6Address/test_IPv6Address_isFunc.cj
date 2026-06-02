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
import std.collection.*
import std.math.*

@Test
public class Test_IPv6Address_Is_Func {
    let All_Str = [
        "::1",
        "ff02::1",
        "2001:db8::1",
        "2001:0db8:85a3:0000:0000:8a2e:0370:7334",
        "fe80::1",
        "::",
        "2607:f0d0:1002:51::4",
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
    let GlobalUnicast_Str = [
        "2001:db8::1",
        "2001:0db8:85a3:0000:0000:8a2e:0370:7334",
        "2607:f0d0:1002:51::4",
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
        "fc00::"
    ] // 单播
    let Unspecified_Str = ["::"] //未指定
    let Loopback_Str = ["::1"] //环回
    let LinkLocal_Str = ["fe80::1", "fe80::"] //链路本地
    let Multicast_Str = ["ff02::1"] //多播
    let Private_Str = ["fc00::"] //私有
    let Teredo_Str = ["2001::"]
    let Maped_Str = ["::ffff:0:0"]

    let UN_GlobalUnicast_Str = ArrayList<String>(All_Str)
    let UN_Unspecified_Str = ArrayList<String>(All_Str)
    let UN_Loopback_Str = ArrayList<String>(All_Str)
    let UN_LinkLocal_Str = ArrayList<String>(All_Str)
    let UN_Multicast_Str = ArrayList<String>(All_Str)
    let UN_Private_Str = ArrayList<String>(All_Str)
    let UN_Teredo_Str = ArrayList<String>(All_Str)
    let UN_Maped_Str = ArrayList<String>(All_Str)

    @BeforeAll
    func dataSetup() {
        UN_GlobalUnicast_Str.removeIf({x: String => GlobalUnicast_Str.contains(x)})
        UN_Unspecified_Str.removeIf({x: String => Unspecified_Str.contains(x)})
        UN_Loopback_Str.removeIf({x: String => Loopback_Str.contains(x)})
        UN_LinkLocal_Str.removeIf({x: String => LinkLocal_Str.contains(x)})
        UN_Multicast_Str.removeIf({x: String => Multicast_Str.contains(x)})
        UN_Private_Str.removeIf({x: String => Private_Str.contains(x)})
        UN_Teredo_Str.removeIf({x: String => Teredo_Str.contains(x)})
        UN_Maped_Str.removeIf({x: String => Maped_Str.contains(x)})
    }

    @TestCase[str in GlobalUnicast_Str 
]
    func case_isGlobalUnicast_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isGlobalUnicast())
    }

    @TestCase[str in UN_GlobalUnicast_Str.toArray() 
]
    func case_isGlobalUnicast_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isGlobalUnicast(), false)
    }

    @TestCase[str in Unspecified_Str 
]
    func case_isUnspecified_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isUnspecified())
    }

    @TestCase[str in UN_Unspecified_Str.toArray() 
]
    func case_isUnspecified_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isUnspecified(), false)
    }

    @TestCase[str in Loopback_Str 
]
    func case_isLoopback_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isLoopback())
    }

    @TestCase[str in UN_Loopback_Str.toArray() 
]
    func case_isLoopback_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isLoopback(), false)
    }

    @TestCase[str in LinkLocal_Str 
]
    func case_isLinkLocal_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isLinkLocal())
    }

    @TestCase[str in UN_LinkLocal_Str.toArray() 
]
    func case_isLinkLocal_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isLinkLocal(), false)
    }

    @TestCase[str in Multicast_Str 
]
    func case_isMulticast_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isMulticast())
    }

    @TestCase[str in UN_Multicast_Str.toArray() 
]
    func case_isMulticast_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isMulticast(), false)
    }

    @TestCase[str in Private_Str 
]
    func case_isPrivate_01(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isPrivate())
    }

    @TestCase[str in UN_Private_Str.toArray() 
]
    func case_isPrivate_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isPrivate(), false)
    }

    @TestCase[str in UN_Maped_Str.toArray() 
]
    func case_isIPv4Mapped_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isIPv4Mapped(), false)
    }

    @TestCase
    func case_isIPv4Mapped_01(): Unit {
        @Expect((IPAddress.parse("::ffff:192.0.2.128") as IPv6Address).getOrThrow().isIPv4Mapped())
        @Expect((IPAddress.parse("::ffff:0:0") as IPv6Address).getOrThrow().isIPv4Mapped())
    }

    @TestCase
    func case_isTeredo_01(): Unit {
        @Expect((IPAddress.parse("2001::") as IPv6Address).getOrThrow().isTeredo())
        @Expect((IPAddress.parse("2001::ffff:ffff") as IPv6Address).getOrThrow().isTeredo())
        @Expect((IPAddress.parse("2001::1:1:1:1:1:1") as IPv6Address).getOrThrow().isTeredo())
    }

    @TestCase[str in UN_Teredo_Str.toArray() 
]
    func case_isTeredo_02(str: String): Unit {
        @Expect((IPAddress.parse(str) as IPv6Address).getOrThrow().isTeredo(), false)
    }

    @TestCase
    func case_scopeID_work(): Unit {
        var buf: Array<Byte> = [32u8, 1u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8, 0u8]
        @Expect(IPv6Address(buf).isTeredo())
        @Expect(IPv6Address(buf, scopeId: 0).isTeredo())
        @Expect(IPv6Address(buf, scopeId: UInt32.Max).isTeredo())
    }
}
