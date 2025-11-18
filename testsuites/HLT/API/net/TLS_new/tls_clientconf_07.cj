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
//import stdx.net.tls.common.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsclientconf_07 {
    public override func beforeEach(): Unit {
        sum1 = 0
        sum2 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    func startServerHandshake(): Unit {
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
        tcpser = Option<TcpServerSocket>.Some(tcpServer)
        tlsser = Option<TlsSocket>.Some(tlsServer)
        tlsServer.handshake()
    }

    func startServerHandshake_err(): Unit {
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
        tcpser = Option<TcpServerSocket>.Some(tcpServer)
        tlsser = Option<TlsSocket>.Some(tlsServer)
        try {
            tlsServer.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("TLS handshake failed (server)"))
            sum1 += 1
        }
        @Expect(sum1, 1)
    }
    @TestCase
    func test_01(): Unit {
        //client cipherSuitesV1_2  and cipherSuitesV1_3 set the default.
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //client cipherSuitesV1_2 and cipherSuitesV1_3 set the illegal characters.
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_03():Unit{
        //client cipherSuitesV1_2  and cipherSuitesV1_3 set the illegal characters.
        spawn{
            startServerHandshake_err()
        }
        while(!bound.compareAndSwap(1, 0)) {sleep(Duration.millisecond)}
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_2] = ["h1"]
        clientConf.supportedCipherSuites[V1_3] = ["h2"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        try {
            tlsClient.handshake()
        } catch(e: TlsException) {
            @Expect(e.message.contains("Failed to set cipher suites of TLS1.2"))
            sum2 += 1
        }
        @Expect(sum2, 1)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //client cipherSuitesV1_2  and cipherSuitesV1_3 set the reverse characters.
        spawn {
            startServerHandshake_err()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_2, V1_3]
        clientConf.supportedCipherSuites[V1_2] = ["TLS_AES_256_GCM_SHA384"]
        clientConf.supportedCipherSuites[V1_3] = ["TLS_RSA_WITH_NULL_SHA256"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        try {
            tlsClient.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("Failed to set cipher suites of TLS1.2"))
            sum2 += 1
        }
        @Expect(sum2, 1)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_05(): Unit {
        //client cipherSuitesV1_2  set the correct characters.
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedCipherSuites[V1_2] = ["TLS_RSA_WITH_AES_128_CBC_SHA256"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(result.cipherSuite, "TLS_AES_256_GCM_SHA384")
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_06(): Unit {
        //client cipherSuitesV1_3 set the correct characters.
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConf.supportedVersions = [V1_3]
        clientConf.supportedCipherSuites[V1_3] = ["TLS_AES_128_GCM_SHA256", "TLS_CHACHA20_POLY1305_SHA256", "TLS_AES_128_CCM_8_SHA256"]
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        sleep(Duration.millisecond * 1000)
        @Expect(result.cipherSuite, "TLS_AES_128_GCM_SHA256")
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
