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
class TestUnixSocketAddress {
    let unixsockaddrstrs: Array<(String, UnixSocketAddress, Array<Byte>)> = [("#", UnixSocketAddress("#"),
        "\u{1}\u{0}#".toArray()), ("123", UnixSocketAddress("123"), "\u{1}\u{0}123".toArray())]
    @TestCase[ex in unixsockaddrstrs]
    func testUdsAddrStr(ex: (String, UnixSocketAddress, Array<Byte>)): Unit {
        let (sockaddrstr, expect, expectArr) = ex
        let addr = UnixSocketAddress(sockaddrstr)
        @Expect(addr, expect)
        @Expect(addr.toString(), sockaddrstr)
        @Expect(addr.getAddressBytes(), expectArr)
    }

    let unixsockaddrArrs: Array<(Array<Byte>, UnixSocketAddress, Array<Byte>, String)> = [("#".toArray(),
        UnixSocketAddress("#"), "\u{1}\u{0}#".toArray(), "#"),
        ("123".toArray(), UnixSocketAddress("123"), "\u{1}\u{0}123".toArray(), "123")]
    @TestCase[ex in unixsockaddrArrs]
    func testUdsAddrBytes(ex: (Array<Byte>, UnixSocketAddress, Array<Byte>, String)): Unit {
        let (sockaddrArr, expect, expectArr, expectStr) = ex
        let addr = UnixSocketAddress(sockaddrArr)
        @Expect(addr, expect)
        @Expect(addr.toString(), expectStr)
        @Expect(addr.getAddressBytes(), expectArr)
    }

    @TestCase[ex in unixsockaddrArrs]
    func testUdsToString() {
        let expect1 = "/tmp/server1.sock"
        let expect2 = "\u{0}/tmp/server1.sock"
        let udsa1_1: UnixSocketAddress = UnixSocketAddress("/tmp/server1.sock")
        let udsa2_1: UnixSocketAddress = UnixSocketAddress("/tmp/server1.sock".toArray())
        let udsa2_2: UnixSocketAddress = UnixSocketAddress("/tmp/server1.sock\u{0}\u{0}".toArray())
        let udsa3_1: UnixSocketAddress = UnixSocketAddress("\u{0}/tmp/server1.sock")
        let udsa4_1: UnixSocketAddress = UnixSocketAddress("\u{0}/tmp/server1.sock".toArray())
        let udsa4_2: UnixSocketAddress = UnixSocketAddress("\u{0}/tmp/server1.sock\u{0}\u{0}".toArray())
        @Assert(udsa1_1.toString(), expect1)
        @Assert(udsa2_1.toString(), expect1)
        @Assert(udsa2_2.toString(), expect1)
        @Assert(udsa3_1.toString(), expect2)
        @Assert(udsa1_1, udsa2_1)
        @Assert(udsa1_1, udsa2_2)
        @Assert(udsa3_1, udsa4_1)
        @Assert(udsa3_1, udsa4_2)
        @Assert(udsa4_1.toString(), expect2)
        @Assert(udsa4_2.toString(), expect2)

        @AssertThrows[IllegalArgumentException](UnixSocketAddress("/tmp/server1\u{0}.sock"))
        @AssertThrows[IllegalArgumentException](UnixSocketAddress("/tmp/server1.sock\u{0}\u{0}"))
        @AssertThrows[IllegalArgumentException](UnixSocketAddress("\u{0}/tmp/server1.sock\u{0}\u{0}"))
        @AssertThrows[IllegalArgumentException](UnixSocketAddress("/tmp/server1\u{0}.sock".toArray()))
    }
}
