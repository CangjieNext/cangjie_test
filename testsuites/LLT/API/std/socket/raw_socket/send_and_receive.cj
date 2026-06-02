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
    func ipv4_tcp_send(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 20, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.send(msg_send, 0)
        }
        let server_com = server.accept()
        let msg_arr = Array<Byte>(100, repeat: 0)
        let msg_size = server_com.receive(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        client.close()
        server.close()
        @Expect(msg_recv, "Hello, cangjie server.")
    }

    @TestCase
    func ipv4_send_big_data(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 21, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
            let msg_send: Array<Byte> = ("x" * 1024 * 1024).toArray()
            client.send(msg_send, 0)
            client.close()
        }
        let server_com = server.accept()
        let msg_arr = Array<Byte>(1024 * 1024, repeat: 0)
        var msg_size = 1
        var totalSize = 0
        while (msg_size != 0) {
            let array = Array<Byte>(65536, repeat: 0)
            msg_size = server_com.receive(array, 0)
            println(msg_size)
            msg_arr[totalSize..totalSize + msg_size] = array.slice(0, msg_size)
            totalSize += msg_size
        }

        @Expect(totalSize, 1024 * 1024)
        server.close()
    }

    @TestCase
    func ipv4_writeTimeout(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        client.writeTimeout = Duration.second
        let array: Array<Byte> = [2, 0, 39, 22, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)

        client.connect(s_addr)
        let msg_send: Array<Byte> = ("x" * 10 * 1024 * 1024).toArray()
        try {
            client.send(msg_send, 0)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to write data: write data timeout."), true)
            } else {
                // Socket operation write(10485760) failed: 2619280 bytes written until timeout expires.
                @Expect(e.message.contains("written until timeout expires"), true)
            }
        }
        client.close()
        server.close()
    }

    @TestCase
    func ipv4_tcp_readTimeout(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 23, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr) // do not send
        }
        let server_com = server.accept()
        server_com.readTimeout = Duration.second
        let msg_arr = Array<Byte>(100, repeat: 0)
        try {
            server_com.receive(msg_arr, 0)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to read data: read data timeout"), true)
            } else {
                @Expect(e.message.contains("Socket operation timed out"), true)
            }
        }
        client.close()
        server.close()
    }

    @TestCase
    func writeTimeout_Zero_success(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        client.writeTimeout = Duration.Zero
        let array: Array<Byte> = [2, 0, 39, 24, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr) // do not send
            let msg_send = "Hello, cangjie server.".toArray()
            client.send(msg_send, 0)
            client.close()
        }
        let msg_arr = Array<Byte>(100, repeat: 0)
        let server_com = server.accept()
        server_com.readTimeout = Duration.second
        server_com.receive(msg_arr, 0)
        server.close()
    }

    @TestCase
    func readTimeout_Zero_success(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 25, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr) // do not send
            let msg_send = "Hello, cangjie server.".toArray()
            client.send(msg_send, 0)
            client.close()
        }
        let msg_arr = Array<Byte>(100, repeat: 0)
        let server_com = server.accept()
        server_com.readTimeout = Duration.Zero
        sleep(Duration.second) // wait for data, receive will success
        server_com.receive(msg_arr, 0)
        server.close()
    }

    @TestCase
    func writeTimeout_Zero_fail(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 26, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr) // do not send
            let msg_send = "Hello, cangjie server.".toArray()
            sleep(Duration.second) // wait for server receive first
            client.send(msg_send, 0)
            client.close()
        }
        let msg_arr = Array<Byte>(100, repeat: 0)
        let server_com = server.accept()
        server_com.readTimeout = Duration.Zero
        try {
            server_com.receive(msg_arr, 0)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to read data: read data timeout."), true)
            } else {
                @Expect(e.message.contains("Socket operation timed out"), true)
            }
        }
        server.close()
    }
}
