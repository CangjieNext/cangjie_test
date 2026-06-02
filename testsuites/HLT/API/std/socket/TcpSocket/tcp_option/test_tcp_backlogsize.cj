/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the backlogSize option in TcpServerSocket
 * Test API: public mut prop backlogSize: Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)

@Test
class Test_Tcp_BacklogSize {
    @TestCase
    func test_Illegal_input(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        var sum = 0
        try {
            server.backlogSize = 0
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message, "BacklogSize should be positive: 0.")
        }
        try {
            server.backlogSize = -1
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message, "BacklogSize should be positive: -1.")
        }

        server.bind()
        try {
            server.backlogSize = 0
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "The socket is already bound")
        }
        try {
            server.backlogSize = -1
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "The socket is already bound")
        }
        server.close()
        try {
            server.backlogSize = 0
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            server.backlogSize = 100
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(sum, 6)
    }

    // test if backlogSize setting works here
    @TestCase
    @Skip //门禁环境backlogsize的linux配置不一样
    func test_backlogsize_settings(): Unit {
        var sum = 0
        var server = TcpServerSocket(bindAt: 0)
        server.reusePort = true
        server.backlogSize = 10
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        // can contain 11 requests
        for (_ in 0..11) {
            var client1 = TcpSocket("127.0.0.1", port.load())
            client1.connect(timeout: Duration.second)
        }
        var client2 = TcpSocket("127.0.0.1", port.load())
        try {
            client2.connect(timeout: 3 * Duration.second)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        for (_ in 0..11) {
            var serversocket1 = server.accept()
            serversocket1.close()
        }
        sleep(Duration.second)
        server.close()
        @Expect(sum, 1)
    }
}
