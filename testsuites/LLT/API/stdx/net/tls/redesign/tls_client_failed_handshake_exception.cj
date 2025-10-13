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
// ASSERT: scan Server throws TlsException
// ASSERT: scan Client throws TlsException

import std.net.*
import std.time.*
import std.sync.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.fs.*
import std.collection.*
import std.io.*

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket) {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
    serverConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    try (tcp = server.accept()) {
        try (tls = TlsSocket.server(tcp, serverConfig: serverConf)) {
            try {
                tls.handshake()
            } catch (e: TlsException) {
                println("Server throws TlsException")
            }
        }
    }
}

func runTlsClient(port: UInt16) {
    let clientConfig = TlsClientConfig() // wrong certificate => handshake exception

    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            try {
                client.handshake()
            } catch (e: TlsException) {
                println("Client throws TlsException")
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
