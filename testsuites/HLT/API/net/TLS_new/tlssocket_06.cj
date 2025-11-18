/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
//import stdx.net.tls.common.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
//import stdx.crypto.common.*
//import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
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
class Test_tlssocket_06 {
    public override func beforeEach(): Unit {
        sum = 0
        sum1 = 0
        sum2 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //the server write data and client read the data and compare the value .
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser).map({c => c}), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf2 = Array<UInt8>(sendSize, repeat: 10)
            tlsServer.write(buf2)
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
        sleep(Duration.millisecond * 100)
        var buf1 = Array<UInt8>(sendSize, repeat: 0)
        var res = 0
        var n = 0
        while (res < sendSize) {
            var readLen1 = tlsClient.read(buf1)
            if (readLen1 > 0) {
                res += readLen1
                for (i in 0..readLen1) {
                    n += Int64(buf1[i])
                }
            } else {
                break
            }
        }
        @Expect(res, sendSize)
        @Expect(n, 10 * sendSize)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //the client write data and server read the data and compare the value.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            sleep(Duration.millisecond * 100)
            var buf2 = Array<UInt8>(sendSize, repeat: 0)
            var res = 0
            var n = 0
            while (res < sendSize) {
                var readLen2 = tlsServer.read(buf2)
                if (readLen2 > 0) {
                    res += readLen2
                    for (i in 0..readLen2) {
                        n += Int64(buf2[i])
                    }
                } else {
                    break
                }
            }
            @Expect(res, sendSize)
            @Expect(n, 10 * sendSize)
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
        var buf1 = Array<UInt8>(sendSize, repeat: 10)
        tlsClient.write(buf1)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_03(): Unit {
        //the server write  10 groups data and client read the 10 groups data and compare the value .
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf2 = Array<UInt8>(sendSize, repeat: 255)
            for (i in 0..10) {
                tlsServer.write(buf2)
            }
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
        sleep(Duration.millisecond * 100)
        var buf1 = Array<UInt8>(sendSize, repeat: 0)
        var res = 0
        var n = 0
        while (res < 10 * sendSize) {
            var readLen1 = tlsClient.read(buf1)
            if (readLen1 > 0) {
                res += readLen1
                for (i in 0..readLen1) {
                    n += Int64(buf1[i])
                }
            } else {
                break
            }
        }
        @Expect(res, 10 * sendSize)
        @Expect(n, 10 * 255 * sendSize)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //the client write 10 groups data and server read the 10 groups data and compare the value.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            sleep(Duration.millisecond * 100)
            var buf2 = Array<UInt8>(sendSize, repeat: 0)
            var res = 0
            var n = 0
            while (res < 10 * sendSize) {
                var readLen2 = tlsServer.read(buf2)
                if (readLen2 > 0) {
                    res += readLen2
                    for (i in 0..readLen2) {
                        n += Int64(buf2[i])
                    }
                } else {
                    break
                }
            }
            @Expect(res, 10 * sendSize)
            @Expect(n, 10 * 255 * sendSize)
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
        var buf1 = Array<UInt8>(sendSize, repeat: 255)
        for (i in 0..10) {
            tlsClient.write(buf1)
        }
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_05(): Unit {
        //the client and server write/read data mutual and compare the value.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf2 = Array<UInt8>(sendSize, repeat: 10)
            for (i in 0..10) {
                tlsServer.write(buf2)
            }
            sleep(Duration.millisecond * 100)
            var res = 0
            var n = 0
            while (res < 10 * sendSize) {
                var readLen2 = tlsServer.read(buf2)
                if (readLen2 > 0) {
                    res += readLen2
                    for (i in 0..readLen2) {
                        n += Int64(buf2[i])
                    }
                } else {
                    break
                }
            }
            @Expect(res, 10 * sendSize)
            @Expect(n, 10 * 255 * sendSize)
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
        var buf1 = Array<UInt8>(sendSize, repeat: 255)
        for (i in 0..10) {
            tlsClient.write(buf1)
        }
        sleep(Duration.millisecond * 100)
        var res1 = 0
        var n1 = 0
        while (res1 < 10 * sendSize) {
            var readLen1 = tlsClient.read(buf1)
            if (readLen1 > 0) {
                res1 += readLen1
                for (i in 0..readLen1) {
                    n1 += Int64(buf1[i])
                }
            } else {
                break
            }
        }
        @Expect(res1, 10 * sendSize)
        @Expect(n1, 10 * 10 * sendSize)

        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_06(): Unit {
        //the client write and server read data twice and compare the value.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf3 = Array<UInt8>(sendSize, repeat: 0)
            sleep(Duration.millisecond * 100)
            var res = 0
            var n = 0
            while (res < 10 * sendSize) {
                var readLen2 = tlsServer.read(buf3)
                if (readLen2 > 0) {
                    res += readLen2
                    for (i in 0..readLen2) {
                        n += Int64(buf3[i])
                    }
                } else {
                    break
                }
            }
            @Expect(res, 10 * sendSize)
            @Expect(n, 10 * 15 * sendSize)
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
        var buf1 = Array<UInt8>(sendSize, repeat: 10)
        var buf2 = Array<UInt8>(sendSize, repeat: 20)
        for (i in 0..5) {
            tlsClient.write(buf1)
        }
        for (i in 0..5) {
            tlsClient.write(buf2)
        }
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_07(): Unit {
        //the server write and client read data twice and compare the value.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser), PrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf1 = Array<UInt8>(sendSize, repeat: 10)
            var buf2 = Array<UInt8>(sendSize, repeat: 20)
            for (i in 0..5) {
                tlsServer.write(buf1)
            }
            for (i in 0..5) {
                tlsServer.write(buf2)
            }
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
        var buf3 = Array<UInt8>(sendSize, repeat: 0)
        sleep(Duration.millisecond * 100)
        var res1 = 0
        var n1 = 0
        while (res1 < 10 * sendSize) {
            var readLen1 = tlsClient.read(buf3)
            if (readLen1 > 0) {
                res1 += readLen1
                for (i in 0..readLen1) {
                    n1 += Int64(buf3[i])
                }
            } else {
                break
            }
        }
        @Expect(res1, 10 * sendSize)
        @Expect(n1, 10 * 15 * sendSize)

        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
