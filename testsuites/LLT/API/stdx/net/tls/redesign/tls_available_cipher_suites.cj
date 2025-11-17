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
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.collection.*
import std.fs.*

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket, cipherSuite1_2:?Array<String>, cipherSuite1_3:?Array<String>): ?CipherSuite {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = PrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    if (let Some(v) <- cipherSuite1_2) {
        serverConf.cipherSuitesV1_2 = v
    }
    if (let Some(v) <- cipherSuite1_3) {
        serverConf.cipherSuitesV1_3 = v
    }
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
            tls.handshake()
            return tls.cipherSuite
        }
    }
    Option<CipherSuite>.None
}

func runTlsClient(port: UInt16, cipherSuite1_2:?Array<String>, cipherSuite1_3:?Array<String>) : ?CipherSuite {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    if (let Some(v) <- cipherSuite1_2) {
        clientConfig.cipherSuitesV1_2 = v
    }
    if (let Some(v) <- cipherSuite1_3) {
        clientConfig.cipherSuitesV1_3 = v
    }

    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
            return client.cipherSuite
        }
    }
    Option<CipherSuite>.None
}

@Test
class TestTlsVersion {
    @TestCase
    func testTlsVersionDefault(): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, Option<Array<String>>.None, Option<Array<String>>.None)
        }
        let clientCipherSuite: CipherSuite = runTlsClient(port, Option<Array<String>>.None, Option<Array<String>>.None).getOrThrow()
        let serverCipherSuite: CipherSuite = f.get().getOrThrow()
        tcpServer.close()
        @Assert(clientCipherSuite.toString(), serverCipherSuite.toString())
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
        let clientCipherSuite: CipherSuite = runTlsClient(port, tls_1_2, tls_1_3).getOrThrow()
        let serverCipherSuite: CipherSuite = f.get().getOrThrow()
        tcpServer.close()
        @Assert(clientCipherSuite.toString(), serverCipherSuite.toString())
        @Assert(isSupporterCiphetSuite(clientCipherSuite))
        @Assert(isSupporterCiphetSuite(serverCipherSuite))
    }
}

func isSupporterCiphetSuite(suite: CipherSuite) {
    let suites = CipherSuite.allSupported
    suites.contains(suite)
}
