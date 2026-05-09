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

@Test
public class Test_IPv4Address_Is_Func {
    let All_Str = [
        "192.168.1.1",
        "0.0.0.0",
        "255.255.255.255",
        "223.255.255.255",
        "172.16.0.0",
        "169.254.1.1",
        "127.0.0.1",
        "10.0.0.1",
        "100.64.0.0",
        "192.0.0.8",
        "192.0.0.9",
        "192.0.0.171",
        "192.31.196.0",
        "192.52.193.0",
        "192.88.99.0",
        "192.175.48.0",
        "198.18.0.0",
        "224.0.0.0",
        "203.0.113.0",
        "198.51.100.0"
    ]
    let Broadcast_Str = ["255.255.255.255"]
    let GlobalUnicast_Str = [
        "223.255.255.255",
        "100.64.0.0",
        "192.0.0.8",
        "192.0.0.9",
        "192.0.0.171",
        "192.31.196.0",
        "192.52.193.0",
        "192.88.99.0",
        "192.175.48.0",
        "198.18.0.0",
        "203.0.113.0",
        "198.51.100.0"
    ] // 单播
    let Unspecified_Str = ["0.0.0.0"] //未指定
    let Loopback_Str = ["127.0.0.1"] //环回
    let LinkLocal_Str = ["169.254.1.1"] //链路本地
    let Multicast_Str = ["224.0.0.0"] //多播
    let Private_Str = ["192.168.1.1", "10.0.0.1", "172.16.0.0"] //私有

    let UN_GlobalUnicast_Str = ArrayList<String>(All_Str)
    let UN_Unspecified_Str = ArrayList<String>(All_Str)
    let UN_Loopback_Str = ArrayList<String>(All_Str)
    let UN_LinkLocal_Str = ArrayList<String>(All_Str)
    let UN_Multicast_Str = ArrayList<String>(All_Str)
    let UN_Private_Str = ArrayList<String>(All_Str)
    let UN_Broadcast_Str = ArrayList<String>(All_Str)

    @BeforeAll
    func dataSetup() {
        UN_GlobalUnicast_Str.removeIf({x: String => GlobalUnicast_Str.contains(x)})
        UN_Unspecified_Str.removeIf({x: String => Unspecified_Str.contains(x)})
        UN_Loopback_Str.removeIf({x: String => Loopback_Str.contains(x)})
        UN_LinkLocal_Str.removeIf({x: String => LinkLocal_Str.contains(x)})
        UN_Multicast_Str.removeIf({x: String => Multicast_Str.contains(x)})
        UN_Private_Str.removeIf({x: String => Private_Str.contains(x)})
        UN_Broadcast_Str.removeIf({x: String => Broadcast_Str.contains(x)})
    }

    @TestCase[str in Broadcast_Str 
]
    func case_isBroadcast_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isBroadcast())
    }

    @TestCase[str in UN_Broadcast_Str.toArray() 
]
    func case_isBroadcast_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isBroadcast(), false)
    }

    @TestCase[str in GlobalUnicast_Str 
]
    func case_isGlobalUnicast_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isGlobalUnicast())
    }

    @TestCase[str in UN_GlobalUnicast_Str.toArray() 
]
    func case_isGlobalUnicast_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isGlobalUnicast(), false)
    }

    @TestCase[str in Unspecified_Str 
]
    func case_isUnspecified_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isUnspecified())
    }

    @TestCase[str in UN_Unspecified_Str.toArray() 
]
    func case_isUnspecified_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isUnspecified(), false)
    }

    @TestCase[str in Loopback_Str 
]
    func case_isLoopback_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isLoopback())
    }

    @TestCase[str in UN_Loopback_Str.toArray() 
]
    func case_isLoopback_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isLoopback(), false)
    }

    @TestCase[str in LinkLocal_Str 
]
    func case_isLinkLocal_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isLinkLocal())
    }

    @TestCase[str in UN_LinkLocal_Str.toArray() 
]
    func case_isLinkLocal_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isLinkLocal(), false)
    }

    @TestCase[str in Multicast_Str 
]
    func case_isMulticast_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isMulticast())
    }

    @TestCase[str in UN_Multicast_Str.toArray() 
]
    func case_isMulticast_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isMulticast(), false)
    }

    @TestCase[str in Private_Str 
]
    func case_isPrivate_01(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isPrivate())
    }

    @TestCase[str in UN_Private_Str.toArray() 
]
    func case_isPrivate_02(str: String): Unit {
        @Expect(IPv4Address.readBigEndian(IPAddress.parse(str).getAddressBytes()).isPrivate(), false)
    }
}
