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

/*
 * Test description:
 *      test connect timeout = 0, >0
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
        var serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 106] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)
        var count = 0
        for (_ in 0..102) {
            try {
                let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
                clientsocket.connect(s_addr, timeout: Duration.Zero)
                count += 1
            } catch (e: SocketTimeoutException) {
            }
        }
        @Expect(count, 0)
        serversocket.close()
    }

    @TestCase
    @Skip // CI环境中的backlogsize设置有差异
    func case02(): Unit {
        var serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 107] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)
        var count = 0
        for (_ in 0..105) {
            try {
                let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
                clientsocket.connect(s_addr, timeout: Duration.second)
                count += 1
            } catch (e: SocketTimeoutException) {
            }
        }
        @Expect(count, 101)
        serversocket.close()
    }
}
