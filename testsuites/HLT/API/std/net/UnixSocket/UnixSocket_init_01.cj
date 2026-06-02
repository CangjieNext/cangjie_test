/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE and Linux) EXEC: %compiler %cmp_opt %f -o %output --test
// (CJNATIVE and Linux) RUN-EXEC: %run %run_opt %output %run_args

import std.net.*
import std.time.*
import std.sync.*
import std.posix.*
import std.unittest.*

@Test
class Test_Unix_Socket {
    @Skip
    @TestCase
    func Test_Unix_Socket_init_01() {
        let adress = ""
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)
        unlink("/tmp/client.sock")

        try (socket = UnixSocket(adress, localPath: "/tmp/client.sock")) {
            socket.connect()
            sleep(500 * Duration.millisecond)
        }
    }

    @TestCase
    func Test_Unix_Socket_init_02() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)
        unlink("/tmp/client.sock")

        try (socket = UnixSocket(adress, localPath: "/tmp/client.sock")) {
            socket.connect()
            sleep(500 * Duration.millisecond)
        }
    }

    @TestCase
    func Test_Unix_Socket_init_03() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)
        unlink("/tmp/client.sock")

        var socket = UnixSocket(adress, localPath: "/tmp/client.sock")
        socket.connect()
        sleep(500 * Duration.millisecond)
        spawn {
            let serverSocket = UnixServerSocket(bindAt: adress)
            try {
                serverSocket.bind()
                sleep(500 * Duration.millisecond)
            } catch (e: SocketException) {
                @Expect(e.message.contains(" Address already in use"))
            }
        }
    }

    @TestCase
    func Test_Unix_Socket_init_04() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)

        var socket = UnixSocket(adress, localPath: "/tmp/client.sock")
        try {
            socket.connect()
            sleep(500 * Duration.millisecond)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use"))
        }
    }

    @TestCase
    func Test_Unix_Socket_init_05() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "")
        }
        sleep(500 * Duration.millisecond)

        var socket = UnixSocket(adress)
        socket.connect()

        sleep(500 * Duration.millisecond)
    }
    @TestCase
    func Test_Unix_Socket_init_06() {
        spawn {
            unlink("/tmp/server.sock")
            try (serverSocket = UnixServerSocket(bindAt: "/tmp/server.sock")) {
                serverSocket.bind()
                try (client = serverSocket.accept()) {
                }
            }
        }
        sleep(500 * Duration.millisecond)
        unlink("")
        try (socket = UnixSocket("/tmp/server.sock", localPath: "")) {
            socket.connect()
            sleep(500 * Duration.millisecond)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("No such file or directory"))
        }
    }

    @TestCase
    func Test_Unix_Socket_init2_01() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)
        unlink("/tmp/client.sock")

        try (socket = UnixSocket(UnixSocketAddress(adress), localAddress: UnixSocketAddress("/tmp/client.sock"))) {
            socket.connect()
            sleep(500 * Duration.millisecond)
        }
    }

    @TestCase
    func Test_Unix_Socket_init2_02() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)
        unlink("/tmp/client.sock")

        var socket = UnixSocket(UnixSocketAddress(adress), localAddress: UnixSocketAddress("/tmp/client.sock"))
        socket.connect()
        sleep(500 * Duration.millisecond)
        spawn {
            let serverSocket = UnixServerSocket(bindAt: adress)
            try {
                serverSocket.bind()
                sleep(500 * Duration.millisecond)
            } catch (e: SocketException) {
                @Expect(e.message.contains("Address already in use"))
            }
        }
    }

    @TestCase
    func Test_Unix_Socket_init2_03() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "/tmp/client.sock")
        }
        sleep(500 * Duration.millisecond)

        var socket = UnixSocket(UnixSocketAddress(adress), localAddress: UnixSocketAddress("/tmp/client.sock"))
        try {
            socket.connect()
            sleep(500 * Duration.millisecond)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use"))
        }
    }

    @TestCase
    func Test_Unix_Socket_init2_04() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "")
        }
        sleep(500 * Duration.millisecond)

        var socket = UnixSocket(UnixSocketAddress(adress))
        socket.connect()

        sleep(500 * Duration.millisecond)
    }
}
