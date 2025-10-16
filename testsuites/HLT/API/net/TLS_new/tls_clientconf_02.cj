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

var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsclientconf_02 {
    let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
    let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
    var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
    public override func beforeEach(): Unit {
        sum1 = 0
        sum2 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    func startServerHandshake_err(): Unit {
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
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
        //set the verififyMode Default of the client and the deault path not exist the root cert.
        spawn {
            startServerHandshake_err()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = Default
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        try {
            tlsClient.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("TLS handshake failed (client)"))
            sum2 += 1
        }
        @Expect(sum2, 1)
        sleep(Duration.millisecond * 200)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //keep the verififyMode Default of the client and the deault path not exist the root cert.
        spawn {
            startServerHandshake_err()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var clientConf = TlsClientConfig()
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        try {
            tlsClient.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("TLS handshake failed (client)"))
            sum2 += 1
        }
        @Expect(sum2, 1)
        sleep(Duration.millisecond * 200)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
