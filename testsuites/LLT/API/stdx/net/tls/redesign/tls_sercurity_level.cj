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

func runTlsServer(server: TcpServerSocket, cipherSuite1_2: ?Array<String>, securityLevel: Int32) {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_rsa.cer")))
    let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_rsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    if (let Some(v) <- cipherSuite1_2) {
        serverConf.supportedCipherSuites[V1_2] = v
    }
    serverConf.securityLevel = securityLevel
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
            tls.handshake()
        }
    }
}

func runTlsClient(port: UInt16) {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
        }
    }
}

@Test
class TestTlsSercurityLevel {
    @TestCase[ciphers in [ [ "DHE-RSA-AES256-SHA256", "DHE-RSA-CHACHA20-POLY1305" ], 
 [ "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384" ] ]]
    func testTlsDHDefault(ciphers: Array<String>): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, ciphers, 2)
        }
        runTlsClient(port)
        f.get()
        tcpServer.close()
    }

    @TestCase[ciphers in [ [ "DHE-RSA-AES256-SHA256", "DHE-RSA-CHACHA20-POLY1305" ], 
 [ "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384" ] ]]
    func testTlsDHFail(ciphers: Array<String>): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            try {
                // cert publicKey length is 3072
                runTlsServer(tcpServer, ciphers, 4)
                @Assert(false)
            } catch (e: TlsException) {
                @Expect(e.message.contains("key too small"))
            }
        }
        try (clientTcp = TcpSocket("127.0.0.1", port)) {
            clientTcp.connect()
        }
        f.get()
        tcpServer.close()
    }
}
