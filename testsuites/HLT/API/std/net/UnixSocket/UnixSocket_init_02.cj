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

@Test
class Test_Unix_Socket {
    @TestCase
    func Test_Unix_Socket_init_01() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            try (serverSocket = UnixServerSocket(bindAt: adress)) {
                serverSocket.bind()
                try (client = serverSocket.accept()) {
                    @Expect(client.remoteAddress.toString(), "\0client")
                }
            }
        }
        sleep(500 * Duration.millisecond)

        try (socket = UnixSocket(adress, localPath: "\0client")) {
            socket.connect()
        }

        spawn {
            try (serverSocket = UnixServerSocket(bindAt: adress)) {
                serverSocket.bind()
            } catch (e: SocketException) {
                @Expect(e.message.contains("Address already in use"))
            }
        }
        sleep(500 * Duration.millisecond)
    }

    @TestCase
    func Test_Unix_Socket_init_02() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            try (serverSocket = UnixServerSocket(bindAt: adress)) {
                serverSocket.bind()
                try (client = serverSocket.accept()) {
                    @Expect(client.remoteAddress.toString(), "\0clientt")
                }
            }
        }
        spawn {
            unlink("/tmp/server2.sock")
            try (serverSocketnew = UnixServerSocket(bindAt: "/tmp/server2.sock")) {
                serverSocketnew.bind()
                try (clientnew = serverSocketnew.accept()) {
                    @Expect(clientnew.remoteAddress.toString(), "\0sockett")
                }
            }
        }
        sleep(500 * Duration.millisecond)
        try (socket = UnixSocket(adress, localPath: "\0clientt")) {
            socket.connect()
            sleep(500 * Duration.millisecond)
        }

        try (socket2 = UnixSocket("/tmp/server2.sock", localPath: "\0sockett")) {
            socket2.connect()
            sleep(500 * Duration.millisecond)
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
            @Expect(client.remoteAddress.toString(), "\0clientttt")
        }
        sleep(500 * Duration.millisecond)

        try (socket = UnixSocket(UnixSocketAddress(adress), localAddress: UnixSocketAddress("\0clientttt"))) {
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
            @Expect(client.remoteAddress.toString(), "\0client")
        }
        sleep(500 * Duration.millisecond)

        try (socket = UnixSocket(UnixSocketAddress(adress), localAddress: UnixSocketAddress("\0client"))) {
            socket.connect()
        }

        spawn {
            let serverSocket = UnixServerSocket(bindAt: adress)
            try {
                serverSocket.bind()
            } catch (e: SocketException) {
                @Expect(e.message.contains("Address already in use"))
            }
        }

        sleep(500 * Duration.millisecond)
    }

    @TestCase
    func Test_Unix_Socket_init2_03() {
        let adress = "/tmp/server.sock"
        spawn {
            unlink(adress)
            unlink("/tmp/server2.sock")
            let serverSocket = UnixServerSocket(bindAt: adress)
            serverSocket.bind()
            let client = serverSocket.accept()
            @Expect(client.remoteAddress.toString(), "\0client")
            let serverSocketnew = UnixServerSocket(bindAt: "/tmp/server2.sock")
            serverSocketnew.bind()
            let clientnew = serverSocketnew.accept()
            @Expect(clientnew.remoteAddress.toString(), "\0socket")
        }
        sleep(500 * Duration.millisecond)

        var socket = UnixSocket(adress, localPath: "\0client")
        socket.connect()
        sleep(500 * Duration.millisecond)
        try {
            var socket1 = UnixSocket(UnixSocketAddress("/tmp/server1.sock"), localAddress: UnixSocketAddress("\0client"))
            socket1.connect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use"))
        }

        var socket2 = UnixSocket(UnixSocketAddress("/tmp/server2.sock"), localAddress: UnixSocketAddress("\0socket"))
        socket2.connect()
        sleep(500 * Duration.millisecond)
    }
}
