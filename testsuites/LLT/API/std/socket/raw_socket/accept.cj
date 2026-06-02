/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../socket_platform_difference.cj
// (Unix) EXEC: %compiler %cmp_opt %f socket_platform_difference.cj -o %output %cmp_utest_opt
// (Unix) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*
import std.time.*
import std.sync.*

@When[backend == "cjnative"]
const backend = true

@Test
class TestAccept {
    @TestCase
    func accept_success(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 12, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        array[0..2] = getSocketFamily(AF_INET)
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
        }
        let com_sock = server.accept()
        sleep(Duration.second)
        com_sock.close()
        client.close()
        server.close()
    }

    @TestCase
    func accept_without_listening(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        try {
            ipv4_socket.accept()
            @Expect(1, 2)
        } catch (e: SocketException) {
            if (backend) {
                @Expect(e.message.contains("socket handle invalid"), true)
            } else {
                @Expect(e.message.contains("Socket operation accept() failed: Invalid argument (EINVAL)"), true)
            }
            ipv4_socket.close()
        }
    }

    @TestCase
    func accept_timeout(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        ipv4_socket.listen(0)
        try {
            ipv4_socket.accept(timeout: Duration.second)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to accept: accept timeout."), true)
            } else {
                @Expect(e.message.contains("Socket operation timed out"), true)
            }

            ipv4_socket.close()
        }
    }

    @TestCase
    func accept_timeout_zero_after_connect(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 13, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        array[0..2] = getSocketFamily(AF_INET)
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
        }
        sleep(Duration.second)
        let srv_com = server.accept(timeout: Duration.Zero) // will try to accept
        srv_com.close()
        server.close()
        client.close()
    }

    @TestCase
    func accept_timeout_zero_without_connect(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        ipv4_socket.listen(0)
        try {
            ipv4_socket.accept(timeout: Duration.Zero)
            @Expect(1, 2)
        } catch (e: SocketTimeoutException) {
            if (backend) {
                @Expect(e.message.contains("Failed to accept: accept timeout."), true)
            } else {
                @Expect(e.message.contains("Socket operation timed out"), true)
            }
            ipv4_socket.close()
        }
    }

    @TestCase
    func accept_illegal_timeout(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        ipv4_socket.listen(0)
        try {
            ipv4_socket.accept(timeout: Duration.second * (-1))
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Timeout should not be negative."), true)
            ipv4_socket.close()
        }
    }
}
