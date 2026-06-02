/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test if localAddress and remoteAddress can
 * be get correctly in tcp server or socket
 * Test API: public override prop remoteAddress: SocketAddress
 *           public override prop localAddress: SocketAddress
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var data = Array<Byte>(1000, repeat: 55)
var cli = Option<TcpSocket>.None
var sum = 0
@When[os == "Windows"]
var localBindAddress = "127.0.0.1"
@When[os != "Windows"]
var localBindAddress = "0.0.0.0"

@Test
class Test_Tcp_Server_Address {
    public override func beforeEach(): Unit {
        sum = 0
    }

    func startClient1(port: UInt16): Unit {
        var socket = TcpSocket(localBindAddress, port)
        socket.connect(timeout: 2 * Duration.second)
        cli = Option<TcpSocket>.Some(socket)
    }

    func startClient2(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect(timeout: 2 * Duration.second)
        cli = Option<TcpSocket>.Some(socket)
    }

    // get localAddress in different periods of tcp serversocket
    @TestCase
    func test_get_address_1(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        @Expect(server.localAddress.toString(), "0.0.0.0:0")

        server.bind()

        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        var addr1 = server.localAddress
        spawn {
            startClient1(port.load())
        }
        @Expect(server.localAddress, addr1)

        ser = Option<TcpServerSocket>.Some(server)
        spawn {
            sleep(Duration.second)
            cli.getOrThrow().write(data)
        }
        @Expect(server.localAddress, addr1)

        var socket = server.accept()
        sleep(2 * Duration.second)

        // throw nonevalueexception if socket not accept?????
        cli.getOrThrow().close()
        @Expect(server.localAddress, addr1)

        ser.getOrThrow().close()
        sleep(Duration.second)
        try {
            // still can get 
            server.localAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 1)
    }

    // get localAddress in different periods of tcp serversocket
    @TestCase
    func test_get_address_2(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        @Expect(server.localAddress.toString(), "127.0.0.1:0")

        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        var addr1 = server.localAddress
        spawn {
            startClient2(port.load())
        }
        @Expect(server.localAddress, addr1)

        ser = Option<TcpServerSocket>.Some(server)
        spawn {
            sleep(Duration.second)
            cli.getOrThrow().write(data)
        }
        @Expect(server.localAddress, addr1)

        var socket = server.accept()
        sleep(2 * Duration.second)

        // throw nonevalueexception if socket not accept?????
        cli.getOrThrow().close()
        @Expect(server.localAddress, addr1)

        ser.getOrThrow().close()
        sleep(Duration.second)
        try {
            // still can get 
            server.localAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 1)
    }
}

@Test
class Test_Tcp_Socket_Address {
    public override func beforeEach(): Unit {
        sum = 0
    }

    func startServer1(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        ser = Option<TcpServerSocket>.Some(server)
    }

    // get localAddress in different periods of tcp socket
    @TestCase
    func test_get_address_1(): Unit {
        spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)

        var client = TcpSocket("127.0.0.1", port.load())
        @Expect(client.remoteAddress.toString(), "127.0.0.1:${port.load()}")
        try {
            //----------only this throw exception---------
            client.localAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is not bound")
            sum += 1
        }

        client.connect(timeout: 2 * Duration.second)
        var addr1 = client.remoteAddress
        var addr2 = client.localAddress
        var serversocket = ser.getOrThrow().accept()

        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        cli = Option<TcpSocket>.Some(serversocket)
        spawn {
            cli.getOrThrow().write(data)
        }
        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        client.close()
        sleep(Duration.second)
        try {
            client.remoteAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            client.localAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 3)
    }

    // get localAddress in different periods of tcp socket
    @TestCase
    func test_get_address_2(): Unit {
        spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)

        var addr_00 = IPSocketAddress("127.0.0.1", port.load())
        var client = TcpSocket(addr_00, localAddress: IPSocketAddress(localBindAddress, 0))
        var addr0 = client.localAddress

        client.connect(timeout: 2 * Duration.second)
        var addr1 = client.remoteAddress
        var addr2 = client.localAddress
        // address distributes after connect and changes here
        @Expect(addr0 == addr2, false)

        var serversocket = ser.getOrThrow().accept()
        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        cli = Option<TcpSocket>.Some(serversocket)
        spawn {
            cli.getOrThrow().write(data)
        }
        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(client.remoteAddress, addr1)
        @Expect(client.localAddress, addr2)

        client.close()
        sleep(Duration.second)
        try {
            client.remoteAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            client.localAddress
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 2)
    }
}
