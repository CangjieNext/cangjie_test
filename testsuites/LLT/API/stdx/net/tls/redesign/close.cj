/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.fs.*

@Test
class TlsCloseTest {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = PrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    var clientConf = TlsClientConfig()
    var server: Future<TcpServerSocket> = spawn {TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))}

    protected override func beforeEach() {
        serverConf.verifyMode = TrustAll
        clientConf.verifyMode = TrustAll
        startServer()
    }

    protected override func afterEach() {
        server.get().close()
    }

    @TestCase
    func smoke(): Unit {
        connect {
            tls =>
            println("ok, ${tls}")
            @Assert(tls.isClosed() == false)
        }
    }

    @TestCase
    func unconnected(): Unit {
        let s = tlsSocket(socket())
        @Assert(s.isClosed() == false)
        s.close()
        @Assert(s.isClosed() == true)
    }

    @TestCase
    func closeAfterHandshake(): Unit {
        connect {
            s =>
            @Assert(s.isClosed() == false)
            s.close()
            @Assert(s.isClosed() == true)
        }
    }

    @TestCase
    func readSelfClosed(): Unit {
        connect {
            s =>
            @Assert(s.isClosed() == false)
            @Assert(s.read(buffer()) == 0)
            @Assert(s.read(buffer()) == 0)
            @Assert(s.isClosed() == false)
        }
    }

    @TestCase
    func readClosed(): Unit {
        connect {
            s =>
            s.close()
            assertFailsWith<TlsException> {
                s.read(Array<Byte>(10, repeat: 0))
            }
        }
    }

    @TestCase
    func writeClosed(): Unit {
        connect {
            s =>
            s.close()
            assertFailsWith<TlsException> {
                s.write(buffer())
            }
        }
    }

    @TestCase
    func handshakeClosed(): Unit {
        connect {
            s =>
            s.close()
            assertFailsWith<TlsException> {
                s.handshake()
            }
        }
    }

    @TestCase
    func handshakeSelfClosed(): Unit {
        connect {
            s =>
            @Assert(s.read(buffer()) == 0)
            @Assert(s.isClosed() == false)

            assertFailsWith<TlsException> {
                s.handshake()
            }
        }
    }

    @TestCase
    func writeUnconnected(): Unit {
        try (socket = socket(), tls = tlsSocket(socket)) {
            assertFailsWith<TlsException> {
                tls.write(buffer())
            }
        }
    }

    @TestCase
    func readUnconnected(): Unit {
        try (socket = socket(), tls = tlsSocket(socket)) {
            assertFailsWith<TlsException> {
                tls.read(buffer())
            }
        }
    }

    @TestCase
    func doubleHandshake(): Unit {
        connect {
            s => assertFailsWith<TlsException> {
                s.handshake()
            }
        }
    }

    @TestCase
    func doubleClose(): Unit {
        connect {
            s => s.close()
        } // there is one more close() in try/finally
    }

    @TestCase
    func closeSelfClosed(): Unit {
        connect {
            s =>
            @Assert(s.read(buffer()) == 0)
            @Assert(s.isClosed() == false)
            @Assert(s.read(buffer()) == 0)
            @Assert(s.isClosed() == false)

            s.close()
            @Assert(s.isClosed() == true)
        }
    }

    private static func buffer(): Array<Byte> {
        Array<Byte>(10, repeat: 0)
    }

    private func socket(): TcpSocket {
        TcpSocket(server.get().localAddress)
    }

    private func tlsSocket(s: StreamingSocket): TlsSocket {
        TlsSocket.client(s, clientConfig: clientConf)
    }

    private func connect(block: (TlsSocket) -> Unit): Unit {
        try (socket = socket(), tls = tlsSocket(socket)) {
            socket.connect()
            tls.handshake()
            block(tls)
        }
    }

    private func startServer() {
        this.server = spawn {
            let server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
            try {
                server.bind()
            } catch (e: Exception) {
                server.close();
                throw e
            }
            spawn {
                acceptLoop(server)
            }
            server
        }
    }

    private func acceptLoop(server: TcpServerSocket): Unit {
        while (true) {
            let client = try {
                server.accept()
            } catch (_) {
                server.close();
                return
            }
            spawn {
                try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
                    tls.handshake()
                } finally {
                    client.close()
                }
            }
        }
    }

    private func assertFailsWith<T>(block: () -> Unit): Unit where T <: Exception {
        var failed = true
        try {
            block()
            failed = false
        } catch (e: Exception) {
            if (e is T) {
                return
            }
            throw e
        }
        if (!failed) {
            throw Exception("Expected to fail but the block passed successfully")
        }
    }
}
