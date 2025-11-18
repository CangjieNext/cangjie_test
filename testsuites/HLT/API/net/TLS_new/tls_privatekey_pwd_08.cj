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
import std.sync.*
import std.time.*
import std.runtime.*
import std.collection.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.x509.{DerBlob, PemEntry, Pem, PrivateKey, X509Exception}
import stdx.crypto.keys.*
import std.io.*

var sum = 0
var sum1 = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None
let sendSize: Int64 = 2000
var bound = AtomicUInt16(0)

@Test
class Test_tlsprivatekey_pwd_08 {
    public override func beforeEach(): Unit {
        sum = 0
        sum1 = 0
        port = AtomicUInt16(0)
        bound = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //private-key with correct password to handshake with the single authentication.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                PrivateKey.decodeFromPem(keypemser, password: "456"))
            serverConf.clientIdentityRequired = Disabled
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
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
        //private-key with correct password to handshake with the optional authentication.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                PrivateKey.decodeFromPem(keypemser, password: "456"))
            serverConf.clientIdentityRequired = Optional
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
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
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_03(): Unit {
        //private-key with correct password to handshake with the optional authentication.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                PrivateKey.decodeFromPem(keypemser, password: "456"))
            serverConf.clientIdentityRequired = Optional
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
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
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }

    @TestCase
    func test_04(): Unit {
        //private-key with correct password to handshake with the two-way authentication using correct pwd.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                PrivateKey.decodeFromPem(keypemser, password: "456"))
            let pemSer = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
            serverConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pemSer).map({c => c}))
            serverConf.clientIdentityRequired = Required
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            tlsServer.handshake()
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 600)
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        let pem1 = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
        clientConf.certificate = (X509Certificate.decodeFromPem(pem1).map({c => c}), 
        PrivateKey.decodeFromPem(keyPem, password: "456"))
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
    func test_05(): Unit {
        //private-key with correct password to handshake with the two-way authentication using error pwd.
        func startServerHandshake(): Unit {
            let pemser = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
            let keypemser = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pemser),
                PrivateKey.decodeFromPem(keypemser, password: "456"))
            let pemSer = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
            serverConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pemSer).map({c => c}))
            serverConf.clientIdentityRequired = Required
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            var tcpServerAccept = tcpServer.accept()
            var tlsServer = TlsSocket.server(tcpServerAccept, sessionContext: None, serverConfig: serverConf)
            tcpser = Option<TcpServerSocket>.Some(tcpServer)
            tlsser = Option<TlsSocket>.Some(tlsServer)
            try {
                tlsServer.handshake()
            } catch (e:X509Exception) {
                @Expect(e.message.contains("TLS handshake failed (server)"))
                sum1 += 1
            }
            @Expect(sum1, 1)
        }
        spawn {
            startServerHandshake()
        }
        sleep(Duration.millisecond * 600)
        let pem = String.fromUtf8(readToEnd(File("./data/root_rsa.cer", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        let pem1 = String.fromUtf8(readToEnd(File("./data/end_rsa.cer", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./data/enc_pkcs8_end_rsa_private_key.pem", Read)))
        try {
            clientConf.certificate = (X509Certificate.decodeFromPem(pem1).map({c => c}),
	        PrivateKey.decodeFromPem(keyPem, password: "#$%"))
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
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
}
