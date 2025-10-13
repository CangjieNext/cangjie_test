/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.collection.*
import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.sync.*
import std.io.*

@Test
class Test_TlsHandshakeResult {
    var port = AtomicUInt16(0)
    var bound = AtomicUInt16(0)
    var tcpser = Option<TcpServerSocket>.None
    var tlsser = Option<TlsSocket>.None

    public override func beforeEach(): Unit {
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_tlsHandshakeResult(): Unit {
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                GeneralPrivateKey.decodeFromPem(keypemser))
            let pemSer = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
            serverConf.verifyMode = CustomCA(
                X509Certificate.decodeFromPem(pemSer) |> map {i: Certificate => i} |> collectArray)

            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            @Expect(tlsServer.handshakeResult.isNone())
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            let tlsHandshakeResult = tlsServer.handshake()
            sleep(Duration.millisecond * 1000)
            match (tlsHandshakeResult.version) {
                case V1_3 => ()
                case _ => @Expect(false)
            }
            @Expect(tlsHandshakeResult.cipherSuite, "TLS_AES_256_GCM_SHA384")
            @Expect(tlsHandshakeResult.peerCertificate.size, 0)
            @Expect(tlsHandshakeResult.session.isNone())
            @Expect(tlsHandshakeResult.alpnProtocol, "")
            @Expect(tlsHandshakeResult.serverName, "")
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem1 = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem1) |> map {i: Certificate => i} |> collectArray)
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        @Expect(tlsClient.handshakeResult.isNone())
        let tlsHandshakeResult = tlsClient.handshake()
        sleep(Duration.millisecond * 1000)
        match (tlsHandshakeResult.version) {
            case V1_3 => ()
            case _ => @Expect(false)
        }
        @Expect(tlsHandshakeResult.cipherSuite, "TLS_AES_256_GCM_SHA384")
        @Expect(tlsHandshakeResult.peerCertificate.size, 2)
        @Expect(tlsHandshakeResult.peerCertificate[0] is X509Certificate)
        @Expect((tlsHandshakeResult.peerCertificate[1] as X509Certificate).getOrThrow().encodeToDer().body.toString(), X509Certificate.decodeFromPem(pem1)[0].encodeToDer().body.toString())
        @Expect(tlsHandshakeResult.peerCertificate[1] is X509Certificate)
        @Expect(tlsHandshakeResult.session.isNone())
        @Expect(tlsHandshakeResult.alpnProtocol, "")
        @Expect(tlsHandshakeResult.serverName, "")
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
