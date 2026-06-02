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

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var cli = Option<TcpSocket>.None
var data = Array<Byte>(1000, repeat: 55)
var empty_buffer = Array<Byte>(50000, repeat: 0)

@Test
class Test_Tcp_ServerSocket_Timeout {
    func startClient(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect(timeout: 2 * Duration.second)
        cli = Option<TcpSocket>.Some(socket)
    }

    @TestCase
    func test_set_timeouts_2(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        spawn {
            startClient(port.load())
        }
        var serversocket = server.accept()
        serversocket.readTimeout = Duration.Zero
        serversocket.writeTimeout = Duration.Zero
        @Expect(serversocket.readTimeout.getOrThrow(), Duration.Zero)
        @Expect(serversocket.writeTimeout.getOrThrow(), Duration.Zero)

        var sum = 0
        var buf = Array<Byte>(data.size, repeat: 0)
        spawn {
            cli.getOrThrow().write(data)
        }
        sleep(Duration.second)
        // readtimeout = 0, if the data are waiting in buffer, read correctly
        try {
            var datasize = serversocket.read(buf)
            @Expect(datasize, data.size)
            @Expect(data, buf)
        } catch (e: SocketTimeoutException) {
        }

        sleep(Duration.second)
        try {
            var sss = serversocket.read(buf)
            println(sss)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        @Expect(sum, 1)
        server.close()
    }

    @TestCase
    func test_set_timeouts_3(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        spawn {
            startClient(port.load())
        }
        var serversocket = server.accept()
        var sum = 0
        try {
            serversocket.readTimeout = -10 * Duration.second
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        try {
            serversocket.writeTimeout = -10 * Duration.second
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        @Expect(sum, 2)

        server.close()
    }

    @TestCase
    func test_set_writetimeout(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        spawn {
            startClient(port.load())
        }
        var serversocket = server.accept()

        serversocket.sendBufferSize = 1000
        serversocket.receiveBufferSize = 1000
        serversocket.writeTimeout = 20 * Duration.nanosecond

        //write to the send buffer to make it totally filled
        var data_tem = Array<Byte>(serversocket.sendBufferSize, repeat: 10)
        var sum = 0

        try {
            //the kernel give more space here
            while (true) {
                serversocket.write(data_tem)
            }
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        serversocket.writeTimeout = Duration.Zero
        try {
            //the kernel give more space here
            while (true) {
                serversocket.write(data_tem)
            }
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        @Expect(sum, 2)
        server.close()
    }
}
