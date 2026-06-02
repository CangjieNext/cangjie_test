/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output  %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

let d = -0.1 * Duration.millisecond

@Test
class TestNegativeDuration {
    func shouldThrow(action: () -> Unit): Unit {
        try {
            action()
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("duration cannot be negative"))
        }
    }

    @TestCase
    func test_tcp_server(): Unit {
        let tcpServer = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        tcpServer.bind()
        shouldThrow {
            tcpServer.accept(timeout: d)
        }
    }

    @TestCase
    func test_tcp(): Unit {
        let tcpClient = TcpSocket(IPSocketAddress("127.0.0.1", 0))
        shouldThrow {
            tcpClient.connect(timeout: d)
        }
        shouldThrow {
            tcpClient.writeTimeout = d
        }
        shouldThrow {
            tcpClient.readTimeout = d
        }
        shouldThrow {
            tcpClient.linger = d
        }
    }

    @TestCase
    func test_udp(): Unit {
        let udp = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        shouldThrow {
            udp.sendTimeout = d
        }
        shouldThrow {
            udp.receiveTimeout = d
        }
    }

    @TestCase
    func test_keepalive_constructor(): Unit {
        shouldThrow {
            SocketKeepAliveConfig(idle: d)
        }
        shouldThrow {
            SocketKeepAliveConfig(interval: d)
        }
    }
}
