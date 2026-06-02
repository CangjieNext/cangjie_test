/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import std.io.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.net.http.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*

@Test
class Test_CustomVerify {
    @TestCase
    func testClientCustomVerifySuccess(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let server = ServerBuilder()
            .addr("0.0.0.0")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("OK")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            true
        })
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func testClientCustomVerifyFail(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let server = ServerBuilder()
            .addr("0.0.0.0")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("OK")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            false
        })
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        @ExpectThrows[TlsException](client.get(url))
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func testServerCustomVerifyWithoutClientCertificate(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Disabled
        serverTlsConfig.verifyMode = CustomVerify({_ => false})
        let server = ServerBuilder()
            .addr("0.0.0.0")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("OK")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => true})
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func testServerCustomVerifyWithClientCertificate(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        serverTlsConfig.clientIdentityRequired = TlsClientIdentificationMode.Required
        serverTlsConfig.verifyMode = CustomVerify({_ => true})
        let server = ServerBuilder()
            .addr("0.0.0.0")
            .port(0)
            .tlsConfig(serverTlsConfig)
            .build()
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("OK")
        })

        let clientCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let clientPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.certificate = (X509Certificate.decodeFromPem(clientCertificate).map({c => c}),
            GeneralPrivateKey.decodeFromPem(clientPrivateKey))
        clientTlsConfig.verifyMode = CustomVerify({_ => true})
        let client = ClientBuilder().tlsConfig(clientTlsConfig).build()

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 100)
        }
        sleep(Duration.millisecond * 100)
        let url = "https://127.0.0.1:${server.port}/"
        client.get(url)
        sleep(Duration.millisecond * 100)
        client.close()
        server.close()
    }

    @TestCase
    func testTlsCustomVerify(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        let serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        let tlsServerFut = spawn {
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverTlsConfig)
            tlsServer.handshake()
            tlsServer
        }
        sleep(Duration.millisecond * 100)
        let port = (tcpServer.localAddress as IPSocketAddress).getOrThrow().port
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            true
        })
        var tcpClient = TcpSocket("127.0.0.1", port)
        tcpClient.connect()
        let tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientTlsConfig)
        tlsClient.handshake()

        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsServerFut.get().close()
        tcpServer.close()
    }

    @TestCase
    func testTlsCustomVerifyFail(): Unit {
        let serverCertificate = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverPrivateKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        let serverTlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCertificate),
            GeneralPrivateKey.decodeFromPem(serverPrivateKey))
        let tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        let tlsServerFut = spawn {
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverTlsConfig)
            @ExpectThrows[TlsException](tlsServer.handshake())
            tlsServer
        }
        sleep(Duration.millisecond * 100)
        let port = (tcpServer.localAddress as IPSocketAddress).getOrThrow().port
        var clientTlsConfig = TlsClientConfig()
        clientTlsConfig.verifyMode = CustomVerify({certs =>
            @Expect(certs.size, 1)
            false
        })
        var tcpClient = TcpSocket("127.0.0.1", port)
        tcpClient.connect()
        let tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientTlsConfig)
        @ExpectThrows[TlsException](tlsClient.handshake())

        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsServerFut.get().close()
        tcpServer.close()
    }
}
