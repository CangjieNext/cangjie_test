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
// (not Windows)EXEC: rm -rf ./uds_socket_temp03

/*
 * Test description:
 *      test send, sendto, receive, receivefrom method of sockets
 * Test API:
 *      public class RawSocket
 */

import std.net.*
import std.time.*
import std.sync.*

@When[os == "macOS" || os == "iOS"]
let (times, str) = (1, "Hello, cangjie server.Hello, cangjie server.")

@When[os != "macOS" && os != "iOS"]
let (times, str) = (2, "Hello, cangjie server.")

@Test
class Test_RawSocket_Transport {
    // sendto and receivefrom in connected tcp sockets
    @TestCase
    func case01(): Unit {
        let serversocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.STREAM, ProtocolType.TCP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 201] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)
        serversocket.listen(100)
        spawn {
            clientsocket.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            clientsocket.sendTo(s_addr, msg_send, 0)
        }
        sleep(Duration.second * 2)
        var socket00 = serversocket.accept(timeout: Duration.second * 2)
        let msg_arr = Array<Byte>(100, repeat: 0)
        let (_, msg_size) = socket00.receiveFrom(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        clientsocket.close()
        serversocket.close()
        @Expect(msg_recv, "Hello, cangjie server.")
    }

    // sendto and receivefrom in connected udp sockets
    @TestCase
    func case02(): Unit {
        let serversocket = RawSocket(SocketDomain.IPV6, SocketType.DATAGRAM, ProtocolType.UDP)
        let clientsocket = RawSocket(SocketDomain.IPV6, SocketType.DATAGRAM, ProtocolType.UDP)
        let array = Array<Byte>(28, repeat: 0)
        array[0..2] = [10, 0] // AF_INET6
        array[2..4] = [60, 102] // PORT
        array[18..24] = [255, 255, 127, 0, 0, 1] // ipv4(4): 127 0 0 1 -> ipv6(16): 0 0 0 0 0 0 0 0 0 0 ff ff 127 0 0 1
        let s_addr = RawAddress(array)
        serversocket.bind(s_addr)

        spawn {
            clientsocket.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            clientsocket.send(msg_send, 0)
        }
        sleep(Duration.second * 2)

        let msg_arr = Array<Byte>(100, repeat: 0)
        let (_, msg_size) = serversocket.receiveFrom(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        clientsocket.close()
        serversocket.close()
        @Expect(msg_recv, "Hello, cangjie server.")
    }

    // sendto and receivefrom in connected unix sockets
    @TestCase
    func case03(): Unit {
        let server = RawSocket(SocketDomain.UNIX, SocketType.STREAM, ProtocolType.Unspecified)
        let client = RawSocket(SocketDomain.UNIX, SocketType.STREAM, ProtocolType.Unspecified)
        let array = Array<Byte>(110, repeat: 0)
        array[0..2] = [1, 0] // AF_UNIX
        let addr: Array<Byte> = "./uds_socket_temp03".toArray()
        array[2..(2 + addr.size)] = addr
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(10)

        spawn {
            client.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            try {
                // not supported 
                client.sendTo(s_addr, msg_send, 0)
                @Expect(1, times)
            } catch (e: SocketException) {}
            client.send(msg_send, 0)
        }
        sleep(Duration.second * 2)

        var socket = server.accept(timeout: Duration.second)
        let msg_arr = Array<Byte>(100, repeat: 0)

        // supported
        let (_, msg_size) = socket.receiveFrom(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        socket.close()
        client.close()
        server.close()
        @Expect(msg_recv, str)
    }
}
