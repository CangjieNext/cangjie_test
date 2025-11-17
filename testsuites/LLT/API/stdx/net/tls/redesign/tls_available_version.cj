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

func runTlsServer(server: TcpServerSocket, version: TlsVersion): ?TlsVersion {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = PrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    serverConf.verifyMode = TrustAll
    serverConf.minVersion = version
    serverConf.maxVersion = version
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
            tls.handshake()
            return tls.tlsVersion
        }
    }
    return Option<TlsVersion>.None
}

func runTlsClient(port: UInt16, version: TlsVersion): ?TlsVersion {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    clientConfig.minVersion = version
    clientConfig.maxVersion = version

    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
            return client.tlsVersion
        }
    }

    return Option<TlsVersion>.None
}

@Test
class TestTlsVersion {
    @TestCase[x in [ V1_2, V1_3 ]]
    func testTlsVersion(x: TlsVersion): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, x)
        }
        let clientTlsVersion: TlsVersion = runTlsClient(port, x).getOrThrow()
        let serverTlsVersion: TlsVersion = f.get().getOrThrow()
        tcpServer.close()
        @Assert(clientTlsVersion.toString(), serverTlsVersion.toString())
    }
}
