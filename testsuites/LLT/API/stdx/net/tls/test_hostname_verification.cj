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
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*

@Test
class Test_HostnameVerification {
    @TestCase
    func testHostnameVerificationWithMismatch(): Unit {
        let serverCert = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        let serverConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCert),
            GeneralPrivateKey.decodeFromPem(serverKey))

        let tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()

        spawn {
            let conn = tcpServer.accept()
            let tlsConn = TlsSocket.server(conn, serverConfig: serverConfig)
            try {
                tlsConn.handshake()
            } catch (e: Exception) {
                // Expected to fail due to hostname mismatch
            }
            tlsConn.close()
            conn.close()
        }

        sleep(Duration.millisecond * 100)
        let port = (tcpServer.localAddress as IPSocketAddress).getOrThrow().port

        var tcpClient = TcpSocket("127.0.0.1", port)
        tcpClient.connect()

        var clientConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
        clientConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConfig.serverName = "wrong.hostname.com"

        let tlsClient = TlsSocket.client(tcpClient, clientConfig: clientConfig)

        var failed = false
        try {
            tlsClient.handshake()
        } catch (e: Exception) {
            failed = true
        }

        tlsClient.close()
        tcpClient.close()
        tcpServer.close()

        @Expect(failed, true)
    }

    @TestCase
    func testHostnameVerificationWithMatch(): Unit {
        let serverCert = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        let serverConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCert),
            GeneralPrivateKey.decodeFromPem(serverKey))

        let tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()

        spawn {
            let conn = tcpServer.accept()
            let tlsConn = TlsSocket.server(conn, serverConfig: serverConfig)
            try {
                tlsConn.handshake()
                tlsConn.close()
            } catch (e: Exception) {
                // Unexpected
            }
            conn.close()
        }

        sleep(Duration.millisecond * 100)
        let port = (tcpServer.localAddress as IPSocketAddress).getOrThrow().port

        var tcpClient = TcpSocket("127.0.0.1", port)
        tcpClient.connect()

        var clientConfig = TlsClientConfig()
        let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
        clientConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        clientConfig.serverName = "oss.PMS.com"

        let tlsClient = TlsSocket.client(tcpClient, clientConfig: clientConfig)

        var success = false
        try {
            tlsClient.handshake()
            success = true
        } catch (e: Exception) {
            // Unexpected failure
        }

        tlsClient.close()
        tcpClient.close()
        tcpServer.close()

        @Expect(success, true)
    }

    @TestCase
    func testHostnameVerificationWithTrustAll(): Unit {
        let serverCert = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let serverKey = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        let serverConfig = TlsServerConfig(X509Certificate.decodeFromPem(serverCert),
            GeneralPrivateKey.decodeFromPem(serverKey))

        let tcpServer = TcpServerSocket(bindAt: 0)
        tcpServer.bind()

        spawn {
            let conn = tcpServer.accept()
            let tlsConn = TlsSocket.server(conn, serverConfig: serverConfig)
            try {
                tlsConn.handshake()
                tlsConn.close()
            } catch (e: Exception) {
                // Unexpected
            }
            conn.close()
        }

        sleep(Duration.millisecond * 100)
        let port = (tcpServer.localAddress as IPSocketAddress).getOrThrow().port

        var tcpClient = TcpSocket("127.0.0.1", port)
        tcpClient.connect()

        var clientConfig = TlsClientConfig()
        clientConfig.verifyMode = TrustAll
        clientConfig.serverName = "wrong.hostname.com"

        let tlsClient = TlsSocket.client(tcpClient, clientConfig: clientConfig)

        var success = false
        try {
            tlsClient.handshake()
            success = true
        } catch (e: Exception) {
            // Unexpected failure
        }

        tlsClient.close()
        tcpClient.close()
        tcpServer.close()

        @Expect(success, true)
    }
}
