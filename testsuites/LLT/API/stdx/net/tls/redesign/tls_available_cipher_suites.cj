/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import std.net.*
import std.time.*
import std.sync.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.collection.*
import std.fs.*

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket, cipherSuite1_2:?Array<String>, cipherSuite1_3:?Array<String>): String {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    if (let Some(v) <- cipherSuite1_2) {
        serverConf.supportedCipherSuites[V1_2] = v
    }
    if (let Some(v) <- cipherSuite1_3) {
        serverConf.supportedCipherSuites[V1_3] = v
    }
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
            tls.handshake()
            return tls.handshakeResult.getOrThrow().cipherSuite
        }
    }
    ""
}

func runTlsClient(port: UInt16, cipherSuite1_2:?Array<String>, cipherSuite1_3:?Array<String>) : String {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    if (let Some(v) <- cipherSuite1_2) {
        clientConfig.supportedCipherSuites[V1_2] = v
    }
    if (let Some(v) <- cipherSuite1_3) {
        clientConfig.supportedCipherSuites[V1_3] = v
    }

    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
            return client.handshakeResult.getOrThrow().cipherSuite
        }
    }
    ""
}

@Test
class TestTlsVersion {
    @TestCase
    func testTlsVersionDefault(): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, Option<Array<String>>.None, Option<Array<String>>.None)
        }
        let clientCipherSuite: String = runTlsClient(port, Option<Array<String>>.None, Option<Array<String>>.None)
        let serverCipherSuite: String = f.get()
        tcpServer.close()
        @Assert(clientCipherSuite != "")
        @Assert(serverCipherSuite != "")
        @Assert(clientCipherSuite, serverCipherSuite)
        @Assert(isSupporterCiphetSuite(clientCipherSuite))
        @Assert(isSupporterCiphetSuite(serverCipherSuite))
    }
    @TestCase
    func testTlsVersionSet(): Unit {
        let tls_1_2 = ["TLS_RSA_WITH_AES_128_CBC_SHA256", "TLS_DH_RSA_WITH_AES_128_CBC_SHA256",
            "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"]
        let tls_1_3 = ["TLS_AES_128_GCM_SHA256", "TLS_AES_128_CCM_SHA256"]
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, tls_1_2, tls_1_3)
        }
        let clientCipherSuite: String = runTlsClient(port, tls_1_2, tls_1_3)
        let serverCipherSuite: String = f.get()
        tcpServer.close()
        @Assert(clientCipherSuite != "")
        @Assert(serverCipherSuite != "")
        @Assert(clientCipherSuite, serverCipherSuite)
        @Assert(isSupporterCiphetSuite(clientCipherSuite))
        @Assert(isSupporterCiphetSuite(serverCipherSuite))
    }
}

func isSupporterCiphetSuite(suite: String) {
    let suites = CipherSuite.allSupported
    let suiteNames = suites.map({suite => suite.toString()})
    suiteNames.contains(suite)
}
