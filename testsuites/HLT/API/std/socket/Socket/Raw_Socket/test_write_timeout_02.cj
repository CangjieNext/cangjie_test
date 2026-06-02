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
 *      test write timeout = 0, >0
 * Test API:
 *      public mut prop writeTimeout: ?Duration
 *      public func sendTo(addr: RawAddress, buffer: Array<Byte>, flags: Int32): Unit
 */

import std.net.*
import std.time.*
import std.sync.*

@Test
class Test_RawSocket_Write_Timeout {
    @TestCase
    func case01(): Unit {
        let serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 109] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)

        spawn {
            var _ = serversocket.accept()
        }
        let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        clientsocket.writeTimeout = Duration.Zero
        clientsocket.connect(s_addr, timeout: Duration.second * 2)

        var count = 0
        var data = Array<UInt8>(10000, repeat: 50)
        while (count == 0) {
            try {
                clientsocket.sendTo(s_addr, data, 0)
            } catch (e: SocketTimeoutException) {
                count += 1
            }
        }
        @Expect(count, 1)
        serversocket.close()
        clientsocket.close()
    }

    @TestCase
    func case02(): Unit {
        let serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 110] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)

        spawn {
            var _ = serversocket.accept()
        }
        let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        clientsocket.writeTimeout = Duration.second * 2
        clientsocket.connect(s_addr, timeout: Duration.second * 2)

        var count = 0
        var data = Array<UInt8>(10000, repeat: 50)
        var time1 = DateTime.now()
        while (count == 0) {
            try {
                clientsocket.sendTo(s_addr, data, 0)
            } catch (e: SocketTimeoutException) {
                count += 1
            }
        }
        var time2 = DateTime.now()
        @Expect(count, 1)
        @Expect(time2 - time1 > Duration.second * 2, true)
        serversocket.close()
        clientsocket.close()
    }
}
