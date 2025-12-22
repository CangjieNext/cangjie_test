/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.*
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpcli = Option<TcpSocket>.None
var tlscli = Option<TlsSocket>.None

@Test
class Test_tlsserverconf_01 {
    public override func beforeEach(): Unit {
        sum1 = 0
        sum2 = 0
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
        //set the verififyMode TrustAll of the server.
        spawn {
            startClientHandshake()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        serverConf.verifyMode = TrustAll
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        let result = tlsServer.handshake()
        match (result.version) {
            case V1_2 => sum1 += 1
            case V1_3 => sum1 += 3
            case Unknown => sum1 += 5
            case _ => ()
        }
        @Expect(sum1, 3)
        sleep(Duration.millisecond * 100)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_02(): Unit {
        //set the illegal certificates of the server.
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_1.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        try {
            TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to parse base64 encoded PEM body"))
            sum2 += 1
        }
        @Expect(sum2, 1)
    }

    @TestCase
    func test_03(): Unit {
        //set the expired certificates of the server.
        spawn {
            startClientHandshake_err()
        }
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_2.cer", Read)))
        let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
        var tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()
        port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var tcpServerAccept = tcpServer.accept()
        var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
        try {
            tlsServer.handshake()
        } catch (e: TlsException) {
            @Expect(e.message.contains("The Certificate chain doesn't match the private key"))
            sum2 += 1
        }
        @Expect(sum2, 1)
        sleep(Duration.millisecond * 100)
        tlscli.getOrThrow().close()
        tcpcli.getOrThrow().close()
        tcpServer.close()
        tlsServer.close()
    }

    @TestCase
    func test_04(): Unit {
        //set the DER fromat certificates of the server.
        let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_2.cer", Read)))
        try {
            String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.der", Read)))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid unicode scalar value."))
            sum2 += 1
        }
        @Expect(sum2, 1)
    }
}
