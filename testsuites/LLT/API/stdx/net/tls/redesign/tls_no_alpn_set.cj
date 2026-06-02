/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %output %f
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args
// ASSERT: scan No alpn name on server
// ASSERT: scan No alpn name on client

import std.net.*
import std.time.*
import std.sync.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.collection.*

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket) {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa.cer")))
    let pkey = GeneralPrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_ecdsa_private_key.pem")))
    var serverConfig = TlsServerConfig(serverCert, pkey)
    serverConfig.verifyMode = TrustAll
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConfig)) {
            tls.handshake()
            let alpnProtocol = tls.handshakeResult.getOrThrow().alpnProtocol
            if (alpnProtocol == "") {
                println("No alpn name on server")
            } else {
                println("Unexpected alpn name on server: ${alpnProtocol}")
            }
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
            let alpnProtocol = client.handshakeResult.getOrThrow().alpnProtocol
            if (alpnProtocol == "") {
                println("No alpn name on client")
            } else {
                println("Unexpected alpn name on client: ${alpnProtocol}")
            }
        }
    }
}

main(): Int64 {
    let (tcpServer, port) = runTcpServer()
    let f = spawn {
        runTlsServer(tcpServer)
    }
    runTlsClient(port)
    f.get()
    tcpServer.close()

    return 0
}
