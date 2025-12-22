/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.*
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.io.*

var sum = 0
var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None
let sendSize: Int64 = 2000

@Test
class Test_tlssocket_09 {
    public override func beforeEach(): Unit {
        sum = 0
        sum1 = 0
        sum2 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //the concurrent connections of the two.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tlsServer.handshake()
            var tcpServerAccept1 = tcpServer.accept()
            var tlsServer1 = TlsSocket.server(tcpServerAccept1, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer1.handshake()
        }

        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        sleep(Duration.millisecond * 200)
        var tcpClient1 = TcpSocket("127.0.0.1", port.load())
        tcpClient1.connect()
        var tlsClient1 = TlsSocket.client(tcpClient1, session: None, clientConfig: clientConf)
        tlsClient1.handshake()
        sleep(Duration.millisecond * 100)
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //the concurrent connections of the ten.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), GeneralPrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            for (_ in 0..10) {
                var tcpServerAccept = tcpServer.accept()
                var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
                tlsServer.handshake()
            }
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
        }
        func startClientHandshake(): Unit {
            let pem = String.fromUtf8(readToEnd(File("./data/root_ecdsa.cer", Read)))
            var clientConf = TlsClientConfig()
            clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
            var tcpClient = TcpSocket("127.0.0.1", port.load())
            tcpClient.connect()
            var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
            tlsClient.handshake()
        }

        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..10) {
            var fut = spawn {
                startClientHandshake()
            }
            fList.add(fut)
        }
        for (i in fList) {
            i.get()
        }
        sleep(Duration.millisecond * 100)
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
