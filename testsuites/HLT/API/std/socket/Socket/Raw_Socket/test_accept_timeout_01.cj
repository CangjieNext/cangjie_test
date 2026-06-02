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
 *      test accept timeout = 0
 * Test API:
 *      public func accept(timeout!: ?Duration = None): RawSocket
 */

import std.net.*
import std.time.*
import std.sync.*

@Test
class Test_RawSocket_Accept_Timeout {
    @TestCase
    func case01(): Unit {
        var serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 100] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)
        try {
            serversocket.accept(timeout: Duration.Zero)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
        }
        serversocket.close()
    }

    @TestCase
    func case02(): Unit {
        let serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 101] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)
        spawn {
            clientsocket.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            clientsocket.send(msg_send, 0)
        }
        sleep(Duration.second * 2)
        var socket00 = serversocket.accept(timeout: Duration.Zero)
        let msg_arr = Array<Byte>(100, repeat: 0)
        let msg_size = socket00.receive(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        clientsocket.close()
        serversocket.close()
        @Expect(msg_recv, "Hello, cangjie server.")
    }
}
