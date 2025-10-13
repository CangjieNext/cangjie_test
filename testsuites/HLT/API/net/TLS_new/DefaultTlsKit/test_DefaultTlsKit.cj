/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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
class Test_DefaultTlsKit {
    var port = AtomicUInt16(0)
    var bound = AtomicUInt16(0)
    let defaultTlsKit = DefaultTlsKit()

    public override func beforeEach(): Unit {
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //the server set the certificate, the server query and query the peer certificate.
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
            var tlsServerConnection = defaultTlsKit.getTlsServer(tcpServerAccept, serverConf, session: None)
            let tlsHandshakeResult = tlsServerConnection.handshake(timeout: Duration.second * 3)
            sleep(Duration.millisecond * 1000)
            match (tlsHandshakeResult.version) {
                case V1_3 => ()
                case _ => @Expect(false)
            }
            @Expect(tlsHandshakeResult.cipherSuite, "TLS_AES_256_GCM_SHA384")
            @Expect(tlsHandshakeResult.peerCertificate.size, 0)
            @Expect(tlsHandshakeResult.session.isNone())
            @Expect(tlsHandshakeResult.alpnProtocol, "")
            @Expect(tlsHandshakeResult.serverName, "example.com")
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem1 = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        let keypemser1 = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
        let pemSer1 = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem1) |> map {i: Certificate => i} |> collectArray)
        clientConf.certificate = (X509Certificate.decodeFromPem(pemSer1) |> map {i: Certificate => i} |> collectArray,
            GeneralPrivateKey.decodeFromPem(keypemser1))
        clientConf.supportedAlpnProtocols = ["http/2", "http/1.1", "h2"]
        clientConf.serverName = "example.com"
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClientConnection = defaultTlsKit.getTlsClient(tcpClient, clientConf, session: None)
        let tlsHandshakeResult = tlsClientConnection.handshake(timeout: Duration.second * 3)
        sleep(Duration.millisecond * 1000)
        match (tlsHandshakeResult.version) {
            case V1_3 => ()
            case _ => @Expect(false)
        }
        @Expect(tlsHandshakeResult.cipherSuite, "TLS_AES_256_GCM_SHA384")
        @Expect(tlsHandshakeResult.peerCertificate.size, 2)
        @Expect(tlsHandshakeResult.session.isNone())
        @Expect(tlsHandshakeResult.alpnProtocol, "")
        @Expect(tlsHandshakeResult.serverName, "example.com")
        tcpClient.close()
    }
}
