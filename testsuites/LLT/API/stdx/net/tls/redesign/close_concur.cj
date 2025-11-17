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

import std.{net.*, unittest.*, unittest.testmacro.*, sync.*, io.*, time.*, fs.*}
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*

@Test
class TlsBehaviourTest {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = PrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    var clientConf = TlsClientConfig()
    var serverAddress = AtomicOptionReference<SocketAddress>(None)
    protected func beforeEach() {
        serverConf.verifyMode = TrustAll
        clientConf.verifyMode = TrustAll
    }
    @TestCase
    func smoke(): Unit {
        let server = startServer()
        connect(server.localAddress) {_ =>}
    }

    @TestCase
    func writeReadSequential(): Unit {
        let server = startServer()

        connect(server.localAddress) {
            stream =>
            let reader = StringReader(stream)

            for (i in 1..10) {
                let text = "abc ${i} def"
                stream.write("${text}\n".toArray())
                @Expect(reader.readln() == text)
            }
        }
    }

    @TestCase
    func closeDuringRead(): Unit {
        let server = startServer()

        connect(server.localAddress) {
            stream =>
            spawn {
                sleep(Duration.second)
                stream.close()
            }

            let e = assertFailsWith<Exception> {
                stream.read(buffer())
            }

            // it could be different depending on the underlying implementation
            // and timings
            @Expect(e is TlsException || e is SocketException)
        }
    }

    @TestCase
    func closeBeforeRead(): Unit {
        let server = startServer()

        connect(server.localAddress) {
            stream =>
            stream.close()
            assertFailsWith<TlsException> {
                stream.read(buffer())
            }
        }
    }

    @TestCase
    func closeDuringWrite(): Unit {
        let server = startServer()

        connect(server.localAddress) {
            stream =>
            spawn {
                sleep(Duration.second)
                stream.close()
            }

            stream.write("sleep\n".toArray())
            @AssertThrows[SocketException | TlsException]({
                let buffer = buffer(size: 1*1024*1024)
                do {
                    stream.write(buffer)
                } while (true)
            })
        }
    }

    @TestCase
    func closeBeforeWrite(): Unit {
        let server = startServer()

        connect(server.localAddress) {
            stream =>
            stream.close()
            assertFailsWith<TlsException> {
                stream.write(buffer())
            }
        }
    }

    @TestCase
    func closeDuringHandshake(): Unit {
        let server = startServer(doHandshake: false) // so server will freeze at handshake

        connectWithoutHandshake(server.localAddress) {
            stream =>
            spawn {
                sleep(Duration.second)
                stream.close()
            }

            assertFailsWith<TlsException> {
                stream.handshake()
            }
        }
    }

    @TestCase
    func closeBeforeHandshake(): Unit {
        let server = startServer(doHandshake: false) // so server will freeze at handshake

        connectWithoutHandshake(server.localAddress) {
            stream =>
            stream.close()
            assertFailsWith<TlsException> {
                stream.handshake()
            }
        }
    }

    private func connect(address: SocketAddress, block: (TlsSocket) -> Unit): Unit {
        connectWithoutHandshake(address) {
            tls =>
            tls.handshake()
            block(tls)
        }
    }

    private func connectWithoutHandshake(address: SocketAddress, block: (TlsSocket) -> Unit): Unit {
        try (socket = TcpSocket(address)) {
            socket.connect()
            try (stream = TlsSocket.client(socket, clientConfig: clientConf)) {
                block(stream)
            }
        }
    }

    private func startServer(doHandshake!: Bool = true): ServerSocket {
        let server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        try {
            server.bind()
        } catch (e: Exception) {
            server.close()
            throw e
        }

        spawn {
            serverLoop(server, doHandshake)
        }

        return server
    }

    private func serverLoop(server: ServerSocket, doHandshake: Bool) {
        do {
            let incoming = try {
                server.accept()
            } catch (_) {
                break
            }
            spawn {
                try {
                    if (doHandshake) {
                        handleClient(incoming)
                    } else {
                        sleep(Duration.second * 2)
                    }
                } finally {
                    incoming.close()
                }
            }
        } while (true)
    }

    private func handleClient(socket: StreamingSocket) {
        try (stream = TlsSocket.server(socket, serverConfig: serverConf)) {
            stream.handshake()

            let reader = StringReader(stream)
            while (let Some(line) <- reader.readln()) {
                println(line)
                stream.write((line + "\n").toArray())
                if (line == "sleep") {
                    sleep(Duration.second * 10)
                }
            }
        }
    }

    private func buffer(size!: Int64 = 10): Array<Byte> {
        Array<Byte>(size, repeat: 0)
    }

    private func assertFailsWith<T>(block: () -> Unit): T where T <: Exception {
        try {
            block()
        } catch (cause: Exception) {
            match (cause) {
                case expected: T => return expected
                case _ => throw cause
            }
        }

        throw Exception("Expected to fail but the block passed successfully")
    }
}
