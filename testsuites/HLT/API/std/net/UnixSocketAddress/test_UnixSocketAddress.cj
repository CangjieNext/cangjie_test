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

@When[os != "macOS"]
const MAX_UDS_PATH_LENGTH: Int64 = 108
@When[os == "macOS"]
const MAX_UDS_PATH_LENGTH: Int64 = 104

@Test
public class Test_UnixSocketAddress_Init {
    let addr_illegal = [
        "\0\0./temp",
        "./te\0mp",
        "./temp\0\0"
    ]

    @TestCase
    func case_unixsocketaddr_init_01(): Unit {
        @Expect(UnixSocketAddress("").getAddressBytes(), [1u8, 0u8])
        @Expect(UnixSocketAddress(Array<Byte>()).getAddressBytes(), [1u8, 0u8])
        @Expect(UnixSocketAddress([1u8, 0u8]).getAddressBytes(), [1u8, 0u8, 1u8])
    }

    @TestCase[addr_path in addr_illegal
]
    func case_unixsocketaddr_init_02(addr_path: String): Unit {
        let e = @AssertThrows[IllegalArgumentException](UnixSocketAddress(addr_path))
        @Expect(e.message.contains("Unix domain socket path must not contain interior null bytes"))
    }

    @TestCase
    func case_unixsocketaddr_init_03(): Unit {
        let arr = Array<Byte>(MAX_UDS_PATH_LENGTH, repeat: 11)
        UnixSocketAddress(arr)
        let arr1 = Array<Byte>(MAX_UDS_PATH_LENGTH + 1, repeat: 11)
        var e = @AssertThrows[IllegalArgumentException](UnixSocketAddress(arr1))
        @Expect(e.message.contains("Path size(${MAX_UDS_PATH_LENGTH + 1}) is too long"))
        e = @AssertThrows[IllegalArgumentException](UnixSocketAddress(String.fromUtf8(arr1)))
        @Expect(e.message.contains("Path size(${MAX_UDS_PATH_LENGTH + 1}) is too long"))
    }

    @TestCase
    func case_unix_socketaddress_01() {
        let addr1: UnixSocketAddress = UnixSocketAddress("./path01")
        @Expect(addr1.size, 10)
        @Expect(addr1.family.toString(), "UNIX")
        @Expect(addr1.getAddressBytes(), [1u8, 0u8, 46u8, 47u8, 112u8, 97u8, 116u8, 104u8, 48u8, 49u8])
        if (exists("./path01") == false) {
            File.create("./path01").close()
        }
        let addr1_1: UnixSocketAddress = UnixSocketAddress("./path01")
        @Expect(addr1 == addr1_1)
        let path_str = canonicalize(Path("./path01")).toString()
        if (path_str.toArray().size <= 108) {
            let addr1_2: UnixSocketAddress = UnixSocketAddress(canonicalize(Path("./path01")).toString())
            @Expect(addr1 != addr1_2) //不做规范化处理
        } else {
            let e = @AssertThrows[IllegalArgumentException](UnixSocketAddress(path_str))
            @Expect(e.message.contains("Path size(${path_str.toArray().size}) is too long"))
        }

        let addr2: UnixSocketAddress = UnixSocketAddress("./path02")
        @Expect(addr2.getAddressBytes(), [1u8, 0u8, 46u8, 47u8, 112u8, 97u8, 116u8, 104u8, 48u8, 50u8])
        @Expect(addr1 != addr2)
        @Expect(addr1.hashCode(), 7908304158472571730)
        @Expect(addr1_1.hashCode(), 7908304158472571730)
        @Expect(addr2.hashCode(), 7908304158472571741)
    }
}
