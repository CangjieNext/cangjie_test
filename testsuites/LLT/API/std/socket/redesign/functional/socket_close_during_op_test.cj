/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package socket1

internal import std.net.*
internal import std.unittest.*
internal import std.time.*
internal import std.sync.*

@Test
class Test {
    @TestCase
    func closeAccept(): Unit {
        let closed = AtomicBool(false)
        try (s = TcpServerSocket(bindAt: 0)) {
            s.bind()

            spawn {
                sleep(Duration.second)
                closed.store(true)
                s.close()
            }

            try {
                s.accept()
            } catch (_: SocketException) {
                @Expect(closed.load() == true)
            }
        }
    }

    @TestCase
    func closeConnect(): Unit {
        let closed = AtomicBool(false)
        // this is very fragile because we need SYN packets to be filtered
        // so connect request should "stuck" because of missing ACK
        // that can't be achieved by using local server
        try (s = TcpSocket("1.1.2.3", 42695)) {
            spawn {
                sleep(Duration.second)
                closed.store(true)
                s.close()
            }

            try {
                s.connect()
            } catch (_: SocketException) {
                @Expect(closed.load() == true)
            }
        }
    }

    @TestCase
    func closeRead(): Unit {
        let closed = AtomicBool(false)
        try (server = TcpServerSocket(bindAt: 0)) {
            server.bind()

            try (s = TcpSocket(server.localAddress)) {
                s.connect()

                spawn {
                    sleep(Duration.second)
                    closed.store(true)
                    s.close()
                }

                let bytesRead = s.read([0, 0, 0, 0])
                @Expect(bytesRead == 0)
                @Expect(closed.load() == true)
            }
        }
    }

    @TestCase
    func closeReceive(): Unit {
        let closed = AtomicBool(false)
        try (s = UdpSocket(bindAt: 0)) {
            s.bind()

            spawn {
                sleep(Duration.second)
                closed.store(true)
                s.close()
            }

            try {
                s.receiveFrom([0, 0, 0, 0])
                throw Exception("Shouldn't receive anything")
            } catch (_: SocketException) {
                @Expect(closed.load() == true)
            }
        }
    }

    @TestCase
    func closeWrite(): Unit {
        let closed = AtomicBool(false)
        let counting = AtomicInt64(0)
        try (server = TcpServerSocket(bindAt: 0)) {
            server.bind()

            try (s = TcpSocket(server.localAddress)) {
                s.sendBufferSize = 4096
                s.receiveBufferSize = 4096
                s.connect()

                spawn {
                    var before: Int64 = 0
                    do {
                        before = counting.load()
                        sleep(Duration.second)
                    } while (before != counting.load()) // it should stop changing

                    // so we know that the loop is stuck
                    closed.store(true)
                    s.close()
                }

                let buffer = Array<Byte>(8192, repeat: 0)
                try {
                    while (true) {
                        counting.fetchAdd(1)
                        s.write(buffer)
                    }
                } catch (_: SocketException) {
                    @Expect(closed.load() == true)
                }
            }
        }
    }
}
