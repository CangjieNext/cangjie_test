/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test if timeout parameters of read and write works
 * correctly in tcp serversocket or clientsocket
 * Test API: public override mut prop readTimeout: ?Duration
 *           public override mut prop writeTimeout: ?Duration
 *           public override func read(buffer: Array<Byte>): Int64
 *           public override func write(buffer: Array<Byte>): Unit
 */

import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var cli = Option<TcpSocket>.None
var data = Array<Byte>(1048576, repeat: 55)
var empty_buffer = Array<Byte>(50000, repeat: 0)
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_ClientSocket_Timeout {
    @BeforeEach
    func beforeEach(): Unit {
        resetSockets()
        port.store(0)
        bound.store(0)
    }

    @AfterEach
    func afterEach(): Unit {
        resetSockets()
    }

    func resetSockets(): Unit {
        try {
            cli.getOrThrow().close()
        } catch (e: Exception) {}
        try {
            ser.getOrThrow().close()
        } catch (e: Exception) {}
        cli = Option<TcpSocket>.None
        ser = Option<TcpServerSocket>.None
    }

    func waitServerBound(): Bool {
        for (_ in 0..10000) {
            let state = bound.load()
            if (state == UInt16(1) || state == UInt16(2)) {
                return true
            }
            if (state == UInt16(3)) {
                return false
            }
            sleep(Duration.millisecond)
        }
        return false
    }

    func waitServerAccepted(): Bool {
        for (_ in 0..10000) {
            let state = bound.load()
            if (state == UInt16(2)) {
                return true
            }
            if (state == UInt16(3)) {
                return false
            }
            sleep(Duration.millisecond)
        }
        return false
    }

    func startServer(): Unit {
        try {
            var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
            server.receiveBufferSize = 1024
            server.bind()
            port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
            ser = Option<TcpServerSocket>.Some(server)
            bound.store(1)
            var serversocket = server.accept(timeout: 10 * Duration.second)
            serversocket.receiveBufferSize = 1024
            cli = Option<TcpSocket>.Some(serversocket)
            bound.store(2)
        } catch (e: Exception) {
            bound.store(3)
        }
    }

    @TestCase
    func test_default_settings(): Unit {
        let serverTask = spawn {
            startServer()
        }
        if (!waitServerBound()) {
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }

        var client1 = TcpSocket("127.0.0.1", port.load())
        @Expect(client1.readTimeout, Option<Duration>.None)
        @Expect(client1.writeTimeout, Option<Duration>.None)
        client1.connect(timeout: 10 * Duration.second)
        @Expect(client1.readTimeout, Option<Duration>.None)
        @Expect(client1.writeTimeout, Option<Duration>.None)

        if (!waitServerAccepted()) {
            client1.close()
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }
        cli.getOrThrow().readTimeout = Duration.second
        cli.getOrThrow().writeTimeout = Duration.second
        @Expect(client1.readTimeout, Option<Duration>.None)
        @Expect(client1.writeTimeout, Option<Duration>.None)

        ser.getOrThrow().close()
        @Expect(client1.readTimeout, Option<Duration>.None)
        @Expect(client1.writeTimeout, Option<Duration>.None)

        client1.close()
        var sum = 0
        try {
            client1.readTimeout
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            client1.writeTimeout = Duration.Zero
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            client1.remoteAddress
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            client1.localAddress
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            client1.keepAlive
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 5)
        resetSockets()
        serverTask.get()
    }

    @TestCase
    func test_read_timeout(): Unit {
        let serverTask = spawn {
            startServer()
        }
        if (!waitServerBound()) {
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }
        var client = TcpSocket("127.0.0.1", port.load())
        client.connect(timeout: 10 * Duration.second)
        if (!waitServerAccepted()) {
            client.close()
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }

        client.readTimeout = Duration.second
        var sum = 0
        try {
            client.read(empty_buffer)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }
        @Expect(sum, 1)
        client.close()
        resetSockets()
        serverTask.get()
    }

    @TestCase
    func test_write_timeout(): Unit {
        let serverTask = spawn {
            startServer()
        }
        if (!waitServerBound()) {
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }
        var client = TcpSocket("127.0.0.1", port.load())
        client.sendBufferSize = 1024
        client.connect(timeout: 10 * Duration.second)
        if (!waitServerAccepted()) {
            client.close()
            resetSockets()
            serverTask.get()
            @Expect(false, true)
            return
        }

        client.writeTimeout = Duration.second
        var sum = 0
        var writeCount = 0
        let startTime = DateTime.now()
        while (sum == 0 && writeCount < 128 && DateTime.now() - startTime < 30 * Duration.second) {
            try {
                client.write(data)
                writeCount += 1
            } catch (e: SocketTimeoutException) {
                sum += 1
            }
        }
        @Expect(sum, 1)
        client.close()
        resetSockets()
        serverTask.get()
    }
}
