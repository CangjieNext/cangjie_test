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

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

var sum = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsclientconf_05 {
    public override func beforeEach(): Unit {
        sum = 0
        port = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //client domain set None.
        func startServerHandshake(): Unit {
            let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
            let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
            var serverConf = TlsServerConfig(serverCert, pkey)
            serverConf.verifyMode = TrustAll
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = TrustAll
        clientConf.serverName = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        println(tlsClient.handshakeResult.getOrThrow().serverName)
        @Expect(tlsClient.handshakeResult.getOrThrow().serverName, "")
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //client domain set blank string.
        func startServerHandshake(): Unit {
            let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
            let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
            var serverConf = TlsServerConfig(serverCert, pkey)
            serverConf.verifyMode = TrustAll
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = TrustAll
        clientConf.serverName = ""
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        @Expect(tlsClient.handshakeResult.getOrThrow().serverName, "")
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_03(): Unit {
        //client domain set correct domain.
        func startServerHandshake(): Unit {
            let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
            let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
            var serverConf = TlsServerConfig(serverCert, pkey)
            serverConf.verifyMode = TrustAll
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = TrustAll
        clientConf.serverName = "www.example.com"
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        @Expect(tlsClient.handshakeResult.getOrThrow().serverName, "www.example.com")
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //client domain set illegal domain.
        func startServerHandshake(): Unit {
            let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
            let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
            var serverConf = TlsServerConfig(serverCert, pkey)
            serverConf.verifyMode = TrustAll
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = TrustAll
        try {
            clientConf.serverName = "\0"
        } catch(e:IllegalArgumentException){
            @Expect(e.message.contains("contain null character"))
            sum += 1
        }
        @Expect(sum, 1)
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        @Expect(tlsClient.handshakeResult.getOrThrow().serverName, "")
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
