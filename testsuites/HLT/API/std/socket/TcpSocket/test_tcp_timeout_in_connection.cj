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
 * Test description: Test if timeout parameters of accept and connect works
 * correctly in tcp server or socket
 * Test API: public func connect(timeout!: ?Duration = None)
 *           public func connect(timeoutSeconds: Int64)
 *           public override func accept(): TcpSocket
 *           public override func accept(timeout!: ?Duration): TcpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

@Test
class Test_Tcp_Connect_Timeout {
    var port = AtomicUInt16(0)
    var ser = Option<TcpServerSocket>.None

    func startServer1(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.backlogSize = 7
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        ser = Option<TcpServerSocket>.Some(server)
    }

    @TestCase
    func test_connect_success(): Unit {
        // tese if connects received by the server
        let f = spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)
        for (i in [100, 100000]) {
            var client1 = TcpSocket("127.0.0.1", port.load())
            client1.connect(timeout: i * Duration.millisecond)
            var client2 = TcpSocket("127.0.0.1", port.load())
            client2.connect(timeout: i * Duration.millisecond)
        }
        var client3 = TcpSocket("127.0.0.1", port.load())
        client3.connect()

        ser.getOrThrow().close()

        f.get()
    }

    @TestCase
    @Skip // it's too flaky because depends on kernel implementation details
    func test_connect_nonblocking(): Unit {
        var sum = 0
        // tese if connects can not received
        let f = spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)
        // backlogsize, set 7, actually 8
        for (_ in 0..8) {
            var client1 = TcpSocket("127.0.0.1", port.load())
            client1.connect(timeout: 1 * Duration.second)
        }

        var client2 = TcpSocket("127.0.0.1", port.load())
        try {
            client2.connect(timeout: 2 * Duration.second)
        } catch (e: SocketException | SocketTimeoutException) {
            // we catch both here and later because when the queue is full
            // it's not guaranteed to fail with timeout
            // it may fail with conn refused or conn aborted instead
            sum += 1
        }
        ser.getOrThrow().accept().close()
        sleep(2 * Duration.second)

        for (_ in 0..4) {
            try {
                TcpSocket("127.0.0.1", port.load()).connect(timeout: 2 * Duration.second)
            } catch (e: SocketException | SocketTimeoutException) {
                sum += 1
            }
        }
        ser.getOrThrow().close()
        @Expect(sum >= 4 && sum <= 5)

        f.get()
    }

    @TestCase
    @Skip // 门禁负载大时异常
    func test_connect_blocking(): Unit {
        // tese if connects can not received
        spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)
        var sum = 0
        // backlogsize, set 7, actually 8
        for (_ in 0..8) {
            var client1 = TcpSocket("127.0.0.1", port.load())
            client1.connect(timeout: 3 * Duration.second)
        }

        var client2 = TcpSocket("127.0.0.1", port.load())
        var time1 = DateTime.now()
        spawn {
            sleep(2 * Duration.second)
            ser.getOrThrow().accept()
        }
        client2.connect()
        var time2 = DateTime.now()

        try {
            var client3 = TcpSocket("127.0.0.1", port.load())
            client3.connect(timeout: -1 * Duration.second)
        } catch (e: IllegalArgumentException) {
            sum += 1
        }

        var time4 = DateTime.now()

        var client5 = TcpSocket("127.0.0.1", port.load())
        spawn {
            sleep(2 * Duration.second)
            ser.getOrThrow().accept()
        }
        client5.connect(timeout: Duration.Zero)
        var time5 = DateTime.now()

        var client6 = TcpSocket("127.0.0.1", port.load())
        spawn {
            sleep(2 * Duration.second)
            ser.getOrThrow().accept()
        }
        client6.connect(timeout: Duration.Zero)
        var time6 = DateTime.now()

        ser.getOrThrow().close()
        @Expect(time2 - time1 > Duration.second, true)
        @Expect(time5 - time4 > Duration.second, true)
        @Expect(time6 - time5 > Duration.second, true)
        @Expect(sum, 1)
    }
}

@Test
class Test_Tcp_Accept_Timeout {
    var port = AtomicUInt16(0)
    var ser = Option<TcpServerSocket>.None

    func startClient1(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect(timeout: 1 * Duration.second)
    }

    func startClient2(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect()
    }

    func startClient3(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect(timeout: 500 * Duration.millisecond)
    }

    @TestCase
    func test_accept_blocking(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        var time1 = DateTime.now()
        spawn {
            sleep(3 * Duration.second)
            startClient1(port.load())
        }
        var socket1 = server.accept()
        var time2 = DateTime.now()

        var sum = 0
        try {
            var _ = server.accept(timeout: -1 * Duration.nanosecond)
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        @Expect(sum, 1)
        @Expect(time2 - time1 > 2.5 * Duration.second, true)
        socket1.close()
        server.close()
    }

    @TestCase
    func test_accept_nonblocking_1(): Unit {
        // tese if nonblocking accepts deal with requests
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        spawn {
            startClient3(port.load())
        }
        sleep(200 * Duration.millisecond)
        var socket1 = server.accept(timeout: Duration.Zero)

        spawn {
            sleep(1500 * Duration.millisecond)
            startClient2(port.load())
        }
        var socket2 = server.accept(timeout: 2 * Duration.second)
        @Expect(socket1.isClosed(), false)
        @Expect(socket2.isClosed(), false)
        server.close()

        sleep(5 * Duration.second)
        socket1.close()
        socket2.close()
        @Expect(socket1.isClosed(), true)
        @Expect(socket2.isClosed(), true)
    }

    @TestCase
    func test_accept_nonblocking_2(): Unit {
        // tese if nonblocking accepts timeout
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        var sum = 0
        try {
            server.accept(timeout: Duration.Zero)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }
        var time1 = DateTime.now()
        try {
            server.accept(timeout: 2 * Duration.second)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }
        var time2 = DateTime.now()

        @Expect(sum, 2)
        @Expect(time2 -time1 > 1.5 * Duration.second)
        @Expect(time2 -time1 < 3 * Duration.second)
        server.close()
    }
}
