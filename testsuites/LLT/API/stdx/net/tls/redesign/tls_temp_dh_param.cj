/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import std.net.*
import std.time.*
import std.sync.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.collection.*
import std.fs.*

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func runTlsServer(server: TcpServerSocket, cipherSuite1_2: ?Array<String>, dh: ?DHParameters) {
    let serverCert = X509Certificate.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_rsa.cer")))
    let pkey = PrivateKey.decodeFromPem(String.fromUtf8(File.readFrom("./files/end_rsa_private_key.pem")))
    var serverConf = TlsServerConfig(serverCert, pkey)
    if (let Some(v) <- cipherSuite1_2) {
        serverConf.cipherSuitesV1_2 = v
    }
    serverConf.dhParameters = dh
    serverConf.securityLevel = 0
    serverConf.minVersion = V1_2
    serverConf.maxVersion = V1_2
    try (client = server.accept()) {
        try (tls = TlsSocket.server(client, serverConfig: serverConf)) {
            tls.handshake()
        }
    }
}

func runTlsClient(port: UInt16) {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    clientConfig.securityLevel = 0
    clientConfig.cipherSuitesV1_2 = ["DHE-RSA-AES256-SHA256", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"]
    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
        }
    }
}

@Test
class TestTlsDH {
    @TestCase[ciphers in [ [ "DHE-RSA-AES256-SHA256", "DHE-RSA-CHACHA20-POLY1305" ],
 [ "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384" ] ]
]
    func testTlsDHDefault(ciphers: Array<String>): Unit {
        let (tcpServer, port) = runTcpServer()
        let f = spawn {
            runTlsServer(tcpServer, ciphers, Option<DHParameters>.None)
        }
        runTlsClient(port)
        f.get()
        tcpServer.close()
    }

    @TestCase[ciphers in [ [ "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256" ],
 [ "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384" ] ]]
    func testTlsDHTemp(ciphers: Array<String>): Unit {
        let (tcpServer, port) = runTcpServer()
        let pemString = """
-----BEGIN DH PARAMETERS-----
MIICCAKCAgEAiKhNDBVs1y9KEyybCDCmQdNmFhLAQ3znopl40E8idcAIG9NyDVcI
XLOtsXwHWbZNF+2b7Mz/+aOcLURsPZTcnME/1jb2g0tWI2OQI6PvaPPGWBVK4hrr
ekdb7YfAge0qG3ajrIdQAcqbvvRDL3cj1+7cYtUFgZvTWxBC2k6hqP3qa4nZsWaQ
rlaNZ995fahXGjMCW968zabwAS9uV9vkTF1/BLB+QIxg20F7HuXuTEiMaC5jD3ZP
366HAjki2R+oFubBFqhCsjxgn3DIVYsEIa0l0LZKSO38W/1SlrmZEum5UIeSHbft
Z9S3gSjUE583kSBlMCLpe2VSgUuVV/+I3yIy8PM9yQajdlMcN3GJ0Mbgi59fvc1j
jxW0YQtCWipay2wKuY0ioahh7EHFmr4IXMiqVFH18p8UM9AwT2Zt7j9a4Tmt8AGe
in0wen1nJvCViP9lXl1rD0g54yiL0yrx+PuIQWIZC44xy/2d+PXGZETG15XPPR5z
qRtGPfD/ul+R3d7O1khU7IyP51a0/X6/KtGAuH9xq/gpFOYkihfgJI2JObx0I7Uq
hO0wAt29/EVTsPSA+s52UAQDNsmLO6l/N+4VaKCClYpI80pIaRdjq8krzlY9HRmW
P4+4EkB+G/2N5zz4vKsGCwBhpUC109TBSQIQiA1p9pUhRr22J05+4yMCAQU=
-----END DH PARAMETERS-----
"""
        let derDH = DHParameters.decodeFromPem(pemString)
        let f = spawn {
            runTlsServer(tcpServer, ciphers, derDH)
        }
        runTlsClient(port)
        f.get()
        tcpServer.close()
    }
}
