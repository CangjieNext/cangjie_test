/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.{net.*, fs.*, io.*}
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestGetlientCertificate {
    @TestCase
    func test(): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            let server = runTlsServer(tcpServer)
            let a = server.clientCertificate
            if (let Some(cer) <- a) {
                let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
                let clientCer = X509Certificate.decodeFromPem(pem)
                @Expect(cer[0].encodeToDer().body.toString() == clientCer[0].encodeToDer().body.toString())
            } else {
                @Expect(false)
            }
            let b = server.peerCertificate
            if (let Some(cer) <- b) {
                let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
                let clientCer = X509Certificate.decodeFromPem(pem)
                @Expect(cer[0].encodeToDer().body.toString() == clientCer[0].encodeToDer().body.toString())
            } else {
                @Expect(false)
            }
        }
        runTlsClient(port)
        f.get()
        tcpServer.close()
    }
}

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket): TlsSocket {
    var serverConf = serverConfig()
    serverConf.supportedAlpnProtocols = ["http/1.1"]
    let socket = server.accept()
    let tlsServer = TlsSocket.server(socket, serverConfig: serverConf)
    tlsServer.handshake()
    return tlsServer
}

func runTlsClient(port: UInt16) {
    var clientCfg = clientConfig()
    clientCfg.alpnProtocolsList = ["http/1.1"]
    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientCfg)) {
            client.handshake()
        }
    }
}

func serverConfig(): TlsServerConfig {
    let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig.clientIdentityRequired = Required
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
    tlsConfig
}

func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem))
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))

    tlsConfig.clientCertificate = (X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.alpnProtocolsList = ["h2"]
    tlsConfig
}
