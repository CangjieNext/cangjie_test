/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
//import stdx.net.tls.common.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
//import stdx.crypto.common.*
//import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum = 0
var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsserverconf_08 {
    public override func beforeEach(): Unit {
        sum = 0
        sum1 = 0
        sum2 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }
    func startServerHandshake(): Unit {
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
        serverConf.supportedVersions = [V1_2, V1_3]
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
        tcpser = Option<TcpServerSocket>.Some(tcpServer)
        tlsser = Option<TlsSocket>.Some(tlsServer)
        let result = tlsServer.handshake()
        @Expect(result.session.isNone())
        tlsServer.close()
    }

    @TestCase
    func test_01(): Unit {
        //server not set the session and query.
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
        var lastSession: ?TlsClientSession = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        tlsClient.read(Array<Byte>(3, repeat: 0))
        let clientSession = (result.session.getOrThrow() as TlsClientSession).getOrThrow()
        @Expect((clientSession.toString().contains("TlsClientSession(")))
        lastSession = clientSession
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //server not set the session and query again.
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var lastSession: ?TlsClientSession = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        tlsClient.read(Array<Byte>(3, repeat: 0))
        let clientSession = (result.session.getOrThrow() as TlsClientSession).getOrThrow()
        @Expect(clientSession.toString().contains("TlsClientSession("))
        lastSession = clientSession
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_03(): Unit {
        //server set the session and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            let sessions = TlsServerSession.fromName("zpstest")
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: sessions, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let result = tlsServer.handshake()
            @Expect(result.session.isNone())
            tlsServer.close()
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
        var lastSession: ?TlsClientSession = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: lastSession, clientConfig: clientConf)
        let result = tlsClient.handshake()
        tlsClient.read(Array<Byte>(3, repeat: 0))
        lastSession = (result.session.getOrThrow() as TlsClientSession).getOrThrow()
        @Expect(lastSession.toString().contains("TlsClientSession("))
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //server set the same session and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            let sessions = TlsServerSession.fromName("zpstest")
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: sessions, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let result = tlsServer.handshake()
            @Expect(result.session.isNone())
            tlsServer.close()
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
        var lastSession: ?TlsClientSession = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: lastSession, clientConfig: clientConf)
        let result = tlsClient.handshake()
        tlsClient.read(Array<Byte>(3, repeat: 0))
        lastSession = (result.session.getOrThrow() as TlsClientSession).getOrThrow()
        @Expect(lastSession.toString().contains("TlsClientSession("))
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_05(): Unit {
        //server set the different session and query.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            let sessions = TlsServerSession.fromName("cangjie")
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: sessions, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let result = tlsServer.handshake()
            @Expect(result.session.isNone())
            tlsServer.close()
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
        var lastSession: ?TlsClientSession = None
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: lastSession, clientConfig: clientConf)
        let result = tlsClient.handshake()
        tlsClient.read(Array<Byte>(3, repeat: 0))
        lastSession = (result.session.getOrThrow() as TlsClientSession).getOrThrow()
        println("session is ${lastSession}")
        @Expect(lastSession.toString().contains("TlsClientSession("))
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
