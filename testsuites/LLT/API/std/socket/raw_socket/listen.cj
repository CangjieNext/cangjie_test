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

@When[os != "Windows"]
const os = true
@When[os == "Windows"]
const os = false

@Test
class TestListen {
    @TestCase
    func ipv4_listen_success(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 6, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        ipv4_socket.bind(s_addr)
        ipv4_socket.listen(0)
    }

    @TestCase
    func listen_without_binding(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        // windows must bind then listen
        if (os) {
            ipv4_socket.listen(0)
        } else {
            try {
                ipv4_socket.listen(0)
                @Expect(1, 2)
            } catch (e: SocketException) {
                @Expect(e.message.contains("Failed to listen 10022: An invalid argument was supplied"), true)
            }
        }
        ipv4_socket.close()
    }

    @TestCase
    func listen_twice(): Unit {
        let ipv4_socket = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 71, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        ipv4_socket.bind(s_addr)
        ipv4_socket.listen(0)
        ipv4_socket.listen(0)
        ipv4_socket.close()
    }
}
