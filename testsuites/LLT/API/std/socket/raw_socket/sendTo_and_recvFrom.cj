/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*
import std.time.*
import std.sync.*

@When[backend == "cjnative"]
const backend = true

@Test
class TestSendAndRecv {
    @TestCase
    func ipv4_udp_send(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let array: Array<Byte> = [2, 0, 39, 40, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        spawn {
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.sendTo(s_addr, msg_send, 0)
        }
        let msg_arr = Array<Byte>(100, repeat: 0)
        let (client_addr, msg_size) = server.receiveFrom(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        client.close()
        server.close()
        println(client_addr.addr)
        @Expect(msg_recv, "Hello, cangjie server.")
    }

    @TestCase
    func ipv4_send_big_data(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let array: Array<Byte> = [2, 0, 39, 41, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        let msg_send: Array<Byte> = ("x" * 65508).toArray()
        try {
            client.sendTo(s_addr, msg_send, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            // cjnative: Failed to write data: Message too long.
            // windows: Failed to write data 10040: A message sent on a datagram socket was larger than the internal 
            //          message buffer or some other network limit, or the buffer used to receive a datagram into 
            //          was smaller than the datagram itself.
            let res = e.message.contains("Message too long") || e.message.contains("Failed to write data 10040:")
            @Expect(res, true)
        }
        client.close()
        server.close()
    }

    @TestCase
    func ipv4_writeTimeout(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        client.writeTimeout = Duration.second
        let array: Array<Byte> = [2, 0, 39, 42, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        spawn {
            let msg_send: Array<Byte> = ("x" * 100).toArray()
            client.sendTo(s_addr, msg_send, 0)
        }
        sleep(Duration.second * 2)
        client.close()
        server.close()
    }

    @TestCase
    func ipv4_udp_readTimeout(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        server.readTimeout = Duration.second
        let array: Array<Byte> = [2, 0, 39, 43, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        let msg_arr = Array<Byte>(100, repeat: 0)
        try {
            server.receiveFrom(msg_arr, 0)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to read data: read data timeout."), true)
            } else {
                @Expect(e.message.contains("Socket operation timed out"), true)
            }
        }
        sleep(Duration.second * 2)
        client.close()
        server.close()
    }
}
