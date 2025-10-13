/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum = 0
var sum1 = 1
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None
var tcpcli = Option<TcpSocket>.None
var tlscli = Option<TlsSocket>.None

@Test
class Test_tlsserverconf_06 {
    public override func beforeEach(): Unit {
        sum = 0
        sum1 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }
    func startClientHandshake(): Unit {
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tcpcli = Option<TcpSocket>.Some(tcpClient)
        tlscli = Option<TlsSocket>.Some(tlsClient)
        tlsClient.handshake()
    }
    func startClientHandshake_err(): Unit {
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tcpcli = Option<TcpSocket>.Some(tcpClient)
        tlscli = Option<TlsSocket>.Some(tlsClient)
        try {
            tlsClient.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("TLS handshake failed (client)"))
            sum1 += 1
        }
        @Expect(sum1, 1)
    }

    @TestCase
    func test_01(): Unit {
        //server set the cipherSuites default.
        spawn {
            startClientHandshake()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem" , Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        var tcpServer = TcpServerSocket(bindAt:0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        let result = tlsServer.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_02(): Unit {
        //server  cipherSuitesV1_2  and cipherSuitesV1_3 set the illegal characters.
        spawn {
            startClientHandshake()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem" , Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        var tcpServer = TcpServerSocket(bindAt:0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        let result = tlsServer.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 100)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_03(): Unit {
        //server cipherSuitesV1_2 set the illegal characters.
        spawn {
            startClientHandshake_err()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        serverConf.supportedCipherSuites[V1_2] = ["h2"]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        try {
            tlsServer.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("Failed to set cipher suites"))
            sum += 1
        }
        @Expect(sum, 1)
        sleep(Duration.millisecond * 1000)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_04(): Unit {
        //server cipherSuitesV1_3 set the illegal characters.
        spawn {
            startClientHandshake_err()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        serverConf.supportedCipherSuites[V1_3] = ["h3"]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        try {
            tlsServer.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("Failed to set cipher suites"))
            sum += 1
        }
        @Expect(sum, 1)
        sleep(Duration.millisecond * 1000)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_05(): Unit {
        //server cipherSuitesV1_2 and cipherSuitesV1_3 set the reverse characters.
        spawn {
            startClientHandshake_err()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        serverConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_NULL_SHA256"]
        serverConf.supportedCipherSuites[V1_3] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        try {
            tlsServer.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("TLS handshake failed"))
            sum += 1
        }
        @Expect(sum, 1)
        sleep(Duration.millisecond * 1000)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_06(): Unit {
        //server cipherSuitesV1_2 set the correct characters.
        spawn {
            startClientHandshake()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        serverConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        tcpser = Option<TcpServerSocket>.Some(tcpServer)
        tlsser = Option<TlsSocket>.Some(tlsServer)
        let result = tlsServer.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 1000)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_07(): Unit {
        //server cipherSuitesV1_3 set the correct characters.
        spawn {
            startClientHandshake()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        serverConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        tcpser = Option<TcpServerSocket>.Some(tcpServer)
        tlsser = Option<TlsSocket>.Some(tlsServer)
        let result = tlsServer.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 1000)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_08(): Unit {
        //server and client set legal cipherSuitesV1_2 and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            serverConf.supportedVersions = [V1_2, V1_3]
            serverConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_09(): Unit {
        //server and client set legal cipherSuitesV1_3 and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            serverConf.supportedVersions = [V1_2, V1_3]
            serverConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_10(): Unit {
        //server set the legal cipherSuitesV1_3 and client set legal cipherSuitesV1_2 and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            serverConf.supportedVersions = [V1_2, V1_3]
            serverConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_11(): Unit {
        //server set the legal cipherSuitesV1_2 and client set legal cipherSuitesV1_3 and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            serverConf.supportedVersions = [V1_2, V1_3]
            serverConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_12(): Unit {
        //server and client set the correct cipherSuitesV1_2 and cipherSuitesV1_3.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            serverConf.supportedVersions = [V1_2, V1_3]
            serverConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
            serverConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        clientConf.supportedCipherSuites[V1_3] = ["TLS_AES_256_GCM_SHA384"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
