/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.collection.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.{DerBlob, PemEntry, Pem, PrivateKey, CryptoException}
import stdx.crypto.keys.*
import std.io.*

var sum = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None
let sendSize: Int64 = 2000
var bound = AtomicUInt16(0)

@Test
class Test_tlsprivatekey_pwd_11 {
    public override func beforeEach(): Unit {
        sum = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //private-key with correct password to handshake.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_256_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                GeneralPrivateKey.decodeFromPem(keypemser, password: "1234"))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        sleep(Duration.millisecond * 500)
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        sleep(Duration.millisecond * 100)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_02(): Unit {
        //private-key with error password to handshake.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_256_end_rsa_private_key.pem", Read)))
            try {
                TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                    GeneralPrivateKey.decodeFromPem(keypemser, password: "123"))
            } catch (e: CryptoException) {
                @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
                sum += 1
            }
            @Expect(sum, 1)
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            bound.fetchAdd(1)
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
        }
        spawn {
            startServerHandshake()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
    }

    @TestCase
    func test_03(): Unit {
        //private-key with correct password to handshake and read/write the data.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_128_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                GeneralPrivateKey.decodeFromPem(keypemser, password: "5678"))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            var buf2 = Array<UInt8>(sendSize, repeat: 10)
            tlsServer.write(buf2)
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 600)
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        sleep(Duration.millisecond * 500)
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
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //private-key with correct password to handshake and read/write the data.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_256_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                GeneralPrivateKey.decodeFromPem(keypemser, password: "1234"))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
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
        sleep(Duration.millisecond * 600)
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        sleep(Duration.millisecond * 500)
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        sleep(Duration.millisecond * 100)
        var buf1 = Array<UInt8>(sendSize, repeat: 10)
        sleep(Duration.millisecond * 500)
        tlsClient.write(buf1)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_05(): Unit {
        //private-key with correct password to handshake and read/write the data mutual.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_128_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                GeneralPrivateKey.decodeFromPem(keypemser, password: "5678"))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, session: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
            sleep(Duration.millisecond * 100)
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
        sleep(Duration.millisecond * 600)
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        sleep(Duration.millisecond * 500)
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        sleep(Duration.millisecond * 100)
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
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
