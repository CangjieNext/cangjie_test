/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows)DEPENDENCE: ../../../asan
// (not Windows)EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// (not Windows)EXEC: %compiler %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// (not Windows)EXEC: rm -rf ./uds_socket_temp1
// (not Windows)EXEC: rm -rf ./uds_socket_temp2

/*
 * Test description:
 *      test connect unsupported types
 * Test API:
 *      public func connect(addr: RawAddress, timeout!: ?Duration = None): Unit
 */

import std.net.*
import std.time.*
import std.sync.*

@Test
class Test_RawSocket_Connect_Timeout {
    @TestCase
    func case01(): Unit {
        let server = RawSocket(SocketDomain.UNIX, SocketType.DATAGRAM, ProtocolType.Unspecified)
        let client = RawSocket(SocketDomain.UNIX, SocketType.DATAGRAM, ProtocolType.Unspecified)
        let array = Array<Byte>(110, repeat: 0)
        array[0..2] = [1, 0] // AF_UNIX
        let addr: Array<Byte> = "./uds_socket_temp1".toArray()
        array[2..(2 + addr.size)] = addr
        let s_addr = RawAddress(array)
        server.bind(s_addr)

        var count = 0
        try {
            client.connect(s_addr, timeout: Duration.Zero)
            count += 1
        } catch (e: SocketTimeoutException) {
        }
        @Expect(count, 0)
        server.close()
        client.close()
    }

    @TestCase
    func case02(): Unit {
        let server = RawSocket(SocketDomain.UNIX, SocketType.DATAGRAM, ProtocolType.Unspecified)
        let client = RawSocket(SocketDomain.UNIX, SocketType.DATAGRAM, ProtocolType.Unspecified)
        let array = Array<Byte>(110, repeat: 0)
        array[0..2] = [1, 0] // AF_UNIX
        let addr: Array<Byte> = "./uds_socket_temp2".toArray()
        array[2..(2 + addr.size)] = addr
        let s_addr = RawAddress(array)
        server.bind(s_addr)

        client.connect(s_addr, timeout: Duration.second)
        var count = 0
        try {
            client.connect(s_addr, timeout: Duration.second)
            count += 1
        } catch (e: SocketException) {
        }
        @Expect(count, 1)
        server.close()
    }
}
