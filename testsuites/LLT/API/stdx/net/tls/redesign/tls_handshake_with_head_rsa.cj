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

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import std.process.*

var sum = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsserverconf_03 {
    public override func beforeEach(): Unit {
        sum = 0
        port = AtomicUInt16(0)
        Process.current.setEnv("SSL_CERT_FILE", Process.current.workingDirectory.toString() + "/files/ca_taibai.crt")
    }

    @TestCase
    func test_rsa_private_key(): Unit {
        //set the verifyMode default of the server.
        func startServerHandshake(): Unit {
            let pem0 = String.fromUtf8(readToEnd(File("./files/apiserver.crt", Read)))
            let pem02 = String.fromUtf8(readToEnd(File("./files/apiserver.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
            serverConf.verifyMode = Default
            serverConf.clientIdentityRequired = Required
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            try {
                tlsServer.handshake()
            } catch (e: Exception) {
                println("server: " + e.message)
                @Assert(false)
            }
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        let pemCA = String.fromUtf8(readToEnd(File("./files/apica.crt", Read)))
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pemCA).map({c => c}))
        let pem1 = String.fromUtf8(readToEnd(File("./files/client_taibai.crt", Read)))
        let pem12 = String.fromUtf8(readToEnd(File("./files/client_taibai.pem", Read)))
        clientConf.certificate = (X509Certificate.decodeFromPem(pem1).map({c => c}), GeneralPrivateKey.decodeFromPem(pem12))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        try {
            tlsClient.handshake()
        } catch (e: Exception) {
            println("client:" + e.message)
            @Assert(false)
        }
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
