/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.crypto.*
import stdx.crypto.common.*
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.runtime.*
import std.io.*

var sum = 0
var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None
var bound = AtomicUInt16(0)
let sendSize: Int64 = 2000
var datatime1 = DateTime.of(year: 2023, month: January, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
var datatime2 = DateTime.of(year: 2033, month: January, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
var x509name = X509Name(
    countryName: "CN",
    provinceName: "GD",
    localityName: "SZ",
    organizationName: "COM",
    organizationalUnitName: "NSP",
    commonName: "CLIENT",
    email: "youremail@qq.com"
)
var certinfo = X509CertificateInfo(
    serialNumber: SerialNumber(length: 20),
    notBefore: datatime1,
    notAfter: datatime2,
    subject: x509name,
    dnsNames: ["oss.PMS.com"],
    emailAddresses: ["youremail@qq.com"],
    IPAddresses: [[1, 1, 1, 1]]
)

func open_cert(readPath: String): X509Certificate {
    let pem = String.fromUtf8(File.readFrom(readPath))
    let certificates = X509Certificate.decodeFromPem(pem)
    @Expect(certificates.size != 0, true)
    certificates[0]
}

func open_prikey(readPath: String): PrivateKey {
    let pem = String.fromUtf8(File.readFrom(readPath))
    let priKey = GeneralPrivateKey.decodeFromPem(pem)
    priKey
}

func open_pubkey(readPath: String): PublicKey {
    let pem = String.fromUtf8(File.readFrom(readPath))
    let pubKey = GeneralPublicKey.decodeFromPem(pem)
    pubKey
}

var parentPath: String = "./data/RootCACert.pem"
var privateKeyPath: String = "./data/RootCAKey.pem"
var publicKeyPath: String = "./data/EndEntity_public.key"
let x509certcreat = X509Certificate(
    certinfo,
    parent: open_cert(parentPath),
    publicKey: open_pubkey(publicKeyPath),
    privateKey: open_prikey(privateKeyPath),
    signatureAlgorithm: SHA256WithRSA
)

@Test
class Test_x509_cert_handshake_05 {
    @TestCase
    func test_01(): Unit {
        //the server write data and client read the data.
        func startServerHandshake(): Unit {
            let keypemser = String.fromUtf8(readToEnd(File("./data/EndEntity.key", Read)))
            var serverConf = TlsServerConfig([x509certcreat], GeneralPrivateKey.decodeFromPem(keypemser))
            var tcpServer = TcpServerSocket(bindAt: 0)
            tcpServer.bind()
            port.store((tcpServer.localAddress as IPSocketAddress)?.port ?? 0)
            bound.fetchAdd(1)
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
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        let pem = String.fromUtf8(readToEnd(File("./data/RootCACert.pem", Read)))
        var clientConf = TlsClientConfig()
        clientConf.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
        var tcpClient = TcpSocket("127.0.0.1", port.load())
        tcpClient.connect()
        var tlsClient = TlsSocket.client(tcpClient, session: None, clientConfig: clientConf)
        tlsClient.handshake()
        var buf1 = Array<UInt8>(sendSize, repeat: 0)
        let readLen1 = tlsClient.read(buf1)
        @Expect(readLen1, sendSize)
        sleep(Duration.millisecond * 1000)
        tlsClient.close()
        tcpClient.close()
        tlsser.getOrThrow().close()
        tcpser.getOrThrow().close()
    }
}
