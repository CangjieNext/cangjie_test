/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.net.tls.*
//import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.PrivateKey
import stdx.crypto.keys.*
import std.{net.*, fs.*,}
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

// shared session context storing sessions
let sessionContext = TlsServerSession.fromName("abc")

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket, version: TlsVersion): TlsSocket {
    var serverConf = serverConfig()
    serverConf.supportedAlpnProtocols = ["http/1.1"]
    serverConf.supportedVersions = [version]
    let socket = server.accept()
    let tlsServer = TlsSocket.server(socket, serverConfig: serverConf, session: sessionContext)
    tlsServer.handshake()
    return tlsServer
}

func runTlsClient(port: UInt16, version: TlsVersion, session!: ?TlsClientSession = None): ?TlsClientSession {
    var clientCfg = clientConfig()
    var session_: ?TlsClientSession = None

    clientCfg.supportedAlpnProtocols = ["http/1.1"]
    clientCfg.supportedVersions = [version]
    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientCfg, session: session)) {
            let result = client.handshake()
            client.read([1, 2, 3])
            session_ = match (result.session) {
                case Some(s) => (s as TlsClientSession).getOrThrow()
                case None => None
            }
        }
    }

    return session_
}

func serverConfig(): TlsServerConfig {
    let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
    let pem0 = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig.clientIdentityRequired = Required
    tlsConfig.supportedVersions = [V1_3]
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig
}

func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    let pem0 = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))

    tlsConfig.certificate = (X509Certificate.decodeFromPem(pem0).map({c => c}), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig.supportedVersions = [V1_3]
    tlsConfig
}

@Test
class Test_tls_session_resume_01 {
    @TestCase[version in [ TlsVersion.V1_2, TlsVersion.V1_3 ]]
    func test(version: TlsVersion): Unit {
        let (tcpServer, port) = runTcpServer()
        let pem = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
        let clientCer = X509Certificate.decodeFromPem(pem)

        let f = spawn {
            for (i in 0..4) {
                // establish a connection on server side
                let server = runTlsServer(tcpServer, version)
                // check cert
                let cert = server.handshakeResult.getOrThrow().peerCertificate
                if (cert.isEmpty()) {
                    throw Exception("certs from connection number ${i} is empty")
                }
                @Expect((cert[0] as X509Certificate).getOrThrow().encodeToDer().body.toString() == clientCer[0].encodeToDer().body.toString())
                // close the connection
                server.socket.close()
                server.close()
            }
        }

        var session: ?TlsClientSession = None
        for (i in 0..4) {
            // establish a connection on client side
            session = runTlsClient(port, version, session: session)
        }

        f.get()
        tcpServer.close()
    }
}
