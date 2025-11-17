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
import std.{net.*, fs.*, io.*}
import std.unittest.*
import std.unittest.testmacro.*

// shared session context storing sessions
let sessionContext = TlsSessionContext.fromName("abc")

@Test
class TestGetCertsWhenResumeSession {
    @TestCase[version in [ TlsVersion.V1_2, TlsVersion.V1_3 ]]
    func test(version: TlsVersion): Unit {
        let (tcpServer, port) = runTcpServer()
        let pem = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
        let clientCer = X509Certificate.decodeFromPem(pem)

        let f = spawn {
            for (i in 0..4) {
                // establish a connection on server side
                let server = runTlsServer(tcpServer, version)
                // check cert
                let cert = server.peerCertificate ?? throw Exception("certs from connection number ${i} is empty")
                @Expect(cert[0].encodeToDer().body.toString() == clientCer[0].encodeToDer().body.toString())
                // close the connection
                server.socket.close()
                server.close()
            }
        }

        var session: ?TlsSession = None
        for (i in 0..4) {
            // establish a connection on client side
            session = runTlsClient(port, version, session: session)
            println("connection number ${i}, session: ${session}")
            println("=================================================")
        }

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

func runTlsServer(server: TcpServerSocket, version: TlsVersion): TlsSocket {
    var serverConf = serverConfig()
    serverConf.supportedAlpnProtocols = ["http/1.1"]
    serverConf.minVersion = version
    serverConf.maxVersion = version
    let socket = server.accept()
    let tlsServer = TlsSocket.server(socket, serverConfig: serverConf, sessionContext: sessionContext)
    tlsServer.handshake()
    return tlsServer
}

func runTlsClient(port: UInt16, version: TlsVersion, session!: ?TlsSession = None): ?TlsSession {
    var clientCfg = clientConfig()
    var session_: ?TlsSession = None

    clientCfg.alpnProtocolsList = ["http/1.1"]
    clientCfg.minVersion = version
    clientCfg.maxVersion = version
    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientCfg, session: session)) {
            client.handshake()
            client.read([1, 2, 3])
            session_ = client.session
        }
    }

    return session_
}

func serverConfig(): TlsServerConfig {
    let pem = String.fromUtf8(readToEnd(File("./files/root_ecdsa.cer", Read)))
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig.clientIdentityRequired = Required
    tlsConfig.minVersion = V1_3
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
    tlsConfig.minVersion = V1_3
    tlsConfig
}
