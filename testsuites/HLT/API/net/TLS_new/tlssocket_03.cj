/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class Test_tlssocketconf_03 {
    public override func beforeEach(): Unit {
        sum = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //the server set the certificate, the server query and query the peer certificate.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            let pemSer = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
            serverConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pemSer).map({c => c}))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let result = tlsServer.handshake()
            @Expect(tlsServer.certificate == X509Certificate.decodeFromPem(pemser).map({c => c}))
            @Expect(result.peerCertificate.isEmpty())
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem1 = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem1).map({c => c}))
        let pem = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        @Expect(tlsClient.certificate.isEmpty())
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //the client set the certificate, the server and client query certificate mutual.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            let pemSer = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
            serverConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pemSer).map({c => c}))
            serverConf.clientIdentityRequired = Required
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let result = tlsServer.handshake()
            @Expect(tlsServer.certificate == X509Certificate.decodeFromPem(pemser))
            let pem1 = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            @Expect((result.peerCertificate[0] as X509Certificate).getOrThrow().encodeToDer().body.toString(),
	        X509Certificate.decodeFromPem(pem1)[0].encodeToDer().body.toString())
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem1 = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem1).map({c => c}))
        let pem = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./data/end_rsa_private_key.pem", Read)))
        clientConf.certificate = (X509Certificate.decodeFromPem(pem).map({c => c}), GeneralPrivateKey.decodeFromPem(keyPem))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        let result = tlsClient.handshake()
        let pemser1 = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        @Expect(tlsClient.certificate == X509Certificate.decodeFromPem(pem))
        @Expect((result.peerCertificate[0] as X509Certificate).getOrThrow().encodeToDer().body.toString(), X509Certificate.decodeFromPem(pemser1)[0].encodeToDer().body.toString())
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
