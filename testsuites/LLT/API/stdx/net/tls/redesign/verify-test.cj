/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import std.{sync.*, time.*}

@Test
class ClientIdentificationModesTest {
    private static let TIMEOUT = Duration.second * 10
    private let server = TestServer()
    private var cfg = serverConfig()

    @TestCase
    func testIdentityRequiredVerified(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Required

        when(clientCert: CERT, expect: ShouldAcceptWithCertificate)
        when(clientCert: None, expect: ShouldFail)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldFail)
    }

    @TestCase
    func testIdentityRequiredTrustedAll(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Required
        cfg.verifyMode = TrustAll

        when(clientCert: CERT, expect: ShouldAcceptWithCertificate)
        when(clientCert: None, expect: ShouldFail)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldAcceptWithCertificate)
    }

    @TestCase
    func testIdentityOptionalVerified(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Optional

        when(clientCert: CERT, expect: ShouldAcceptWithCertificate)
        when(clientCert: None, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldFail)
    }

    @TestCase
    func testIdentityOptionalTrustAll(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Optional
        cfg.verifyMode = TrustAll

        when(clientCert: CERT, expect: ShouldAcceptWithCertificate)
        when(clientCert: None, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldAcceptWithCertificate)
    }

    @TestCase
    func testIdentityDisabled(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Disabled

        when(clientCert: CERT, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: None, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldAcceptAndNoCertificate)
    }

    @TestCase
    func testIdentityDisabledAndTrustAll(): Unit {
        cfg = serverConfig()
        cfg.clientIdentityRequired = Disabled
        cfg.verifyMode = TrustAll

        // it should be the same
        when(clientCert: CERT, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: None, expect: ShouldAcceptAndNoCertificate)
        when(clientCert: IRRELEVANT_CERT, expect: ShouldAcceptAndNoCertificate)
    }

    private func when(clientCert!: ?X509Certificate, expect!: HandshakeExpect): Unit {
        match ((expect, clientCert)) {
            case (ShouldAcceptWithCertificate, None) => throw Exception(
                "Wrong test-case: we expect it to succeed with certificate but ClientCert is None")
            case _ => ()
        }
        var client = clientConfig()
        match (clientCert) {
            case Some(cert) where cert == CERT => client.certificate = ([CERT], PKEY)
            case Some(cert) where cert == IRRELEVANT_CERT => client.certificate = ([cert], IRRELEVANT_PKEY)
            case None => ()
            case _ => throw Exception("unexpected cert")
        }
        connect(client)

        match (expect) {
            case ShouldFail => server.acceptShouldNotPassHandshake(cfg)
            case ShouldAcceptAndNoCertificate => server.acceptRequireNoCerticate(cfg)
            case ShouldAcceptWithCertificate => server.acceptRequireCerticate(cfg, expectedCert: clientCert.getOrThrow())
        }
    }

    private func connect(cfg: TlsClientConfig): Future<Unit> {
        spawn {
            try (socket = TcpSocket("127.0.0.1", server.port)) {
                socket.connect(timeout: TIMEOUT)
                try (tls = TlsSocket.client(socket, clientConfig: cfg)) {
                    tls.handshake(timeout: TIMEOUT * 2)
                }
            }
        }
    }

    static let ROOT_CA = X509Certificate.decodeFromPem(
        """
    -----BEGIN CERTIFICATE-----
    MIICNzCCAd2gAwIBAgIUabcEHZg5WhGzHWtMIEgQsnjLUY4wCgYIKoZIzj0EAwIw
    cTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoGA1UE
    CgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcNAQkB
    FhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDIyNDA4NTcwMVoXDTMzMDIyMTA4NTcw
    MVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG
    A1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN
    AQkBFhB5b3VyZW1haWxAcXEuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE
    usJH2auIkLirV2xv3h6J1hALqEWYrEAthfn3QAysy3hG70wzwnFAh/b4vu6+IYHJ
    MwC0yKKywliroW17mBIzRqNTMFEwHQYDVR0OBBYEFCMNa0YR2aTTeCKenh/lduuV
    /EtiMB8GA1UdIwQYMBaAFCMNa0YR2aTTeCKenh/lduuV/EtiMA8GA1UdEwEB/wQF
    MAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIgcbHwpCaGa4F8U9tUIQDamNR00d8w6ack
    9K/fdXN/AzMCIQDNHUoqFjmFf2l2uRlzvL699Q9Wot2ovFTwrqIdbVr6Rg==
    -----END CERTIFICATE-----
    """)

    static let CERT = X509Certificate.decodeFromPem(
        """
    -----BEGIN CERTIFICATE-----
    MIICATCCAaigAwIBAgIUHDXVZkj2Htu3Hz53zkqmje5FmUMwCgYIKoZIzj0EAwIw
    cTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoGA1UE
    CgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcNAQkB
    FhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDIyNDA4NTcyOFoXDTMzMDIyMTA4NTcy
    OFowdTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG
    A1UECgwDQ09NMQwwCgYDVQQLDANOU1AxDzANBgNVBAMMBkNMSUVOVDEfMB0GCSqG
    SIb3DQEJARYQeW91cmVtYWlsQHFxLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEH
    A0IABEmQ/csyLGMZMD83djB6hWaBrLM73WhOANMrcXIFZKS2k/oE/GBVjI73Bbgg
    C0n1a1N0sjXcTJkC3AChF1xwGYqjGjAYMBYGA1UdEQQPMA2CC29zcy5QTVMuY29t
    MAoGCCqGSM49BAMCA0cAMEQCIAioP1f6rNBweW0kkS14mP62DFm7GBwNVnQ/IpLq
    38MTAiAHZ39G1sk6h/QTnYhVw0gjtmzyClihXPl46OzMsiJEQA==
    -----END CERTIFICATE-----
    """)[0]

    static let PKEY = GeneralPrivateKey.decodeFromPem(
        """
    -----BEGIN PRIVATE KEY-----
    MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgKHxExgSBGx9qe2ru
    TV8ostj/RoxpODtnDuanfShJUtyhRANCAARJkP3LMixjGTA/N3YweoVmgayzO91o
    TgDTK3FyBWSktpP6BPxgVYyO9wW4IAtJ9WtTdLI13EyZAtwAoRdccBmK
    -----END PRIVATE KEY-----
    """)

    static let IRRELEVANT_CERT = X509Certificate.decodeFromPem(
        """
    -----BEGIN CERTIFICATE-----
    MIIBxjCCAW2gAwIBAgIUG9552NeWJcS7JRejm36LwEgbpsIwCgYIKoZIzj0EAwIw
    OTELMAkGA1UEBhMCQ04xDDAKBgNVBAgMA2FhYTELMAkGA1UEBwwCYmIxDzANBgNV
    BAoMBkh1YXdlaTAeFw0yMzA4MDMxMjAyMzhaFw0zMzA3MzExMjAyMzhaMDkxCzAJ
    BgNVBAYTAkNOMQwwCgYDVQQIDANhYWExCzAJBgNVBAcMAmJiMQ8wDQYDVQQKDAZI
    dWF3ZWkwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQAn5b7QDYFBp+m8rlLoT7x
    yqRw5BCHVI6rc+KnzrpUMm97YhVtL9n9mz7sG4QMY/MPSeL/VgGYXCIRIuhTY4OC
    o1MwUTAdBgNVHQ4EFgQU8gBlWSr+Dos2vEjjqYB3RaxH8qowHwYDVR0jBBgwFoAU
    8gBlWSr+Dos2vEjjqYB3RaxH8qowDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQD
    AgNHADBEAiBUVKjIhMaq9mISrdWLIKzR3+mL5/3EbPY3NOM6sZxEXAIgaKLqPRW8
    BnhvZdBXiKKqJYZ0175gV2aEtu1EJSGqrcs=
    -----END CERTIFICATE-----
    """)[0]

    static let IRRELEVANT_PKEY = GeneralPrivateKey.decodeFromPem(
        """
    -----BEGIN EC PRIVATE KEY-----
    MHcCAQEEIN6DnXOM8LyWZlk44MUaS+oo3yGhQBOBKznjSCtY7KEvoAoGCCqGSM49
    AwEHoUQDQgAEAJ+W+0A2BQafpvK5S6E+8cqkcOQQh1SOq3Pip866VDJve2IVbS/Z
    /Zs+7BuEDGPzD0ni/1YBmFwiESLoU2ODgg==
    -----END EC PRIVATE KEY-----
    """)

    private static func serverConfig(): TlsServerConfig {
        var cfg = TlsServerConfig([CERT], PKEY)
        cfg.verifyMode = CustomCA(ROOT_CA.map({c => c}))
        return cfg
    }

    private static func clientConfig(): TlsClientConfig {
        var cfg = TlsClientConfig()
        cfg.verifyMode = CustomCA(ROOT_CA.map({c => c}))
        return cfg
    }
}

class TestServer {
    private static let TIMEOUT = Duration.second * 10
    private let server = TcpServerSocket(bindAt: 0)

    prop port: UInt16 {
        get() {
            (server.localAddress as IPSocketAddress)?.port ?? 0
        }
    }

    init() {
        server.bind()
    }

    func acceptRequireCerticate(cfg: TlsServerConfig,
        expectedCert!: X509Certificate = ClientIdentificationModesTest.CERT) {
        try (accepted = server.accept(timeout: TIMEOUT)) {
            try (tls = TlsSocket.server(accepted, serverConfig: cfg)) {
                tls.handshake(timeout: TIMEOUT)

                let c = (tls.handshakeResult?.peerCertificate).getOrThrow()[0]

                @Expect((c as X509Certificate).getOrThrow() == expectedCert)
            }
        }
    }

    func acceptRequireNoCerticate(cfg: TlsServerConfig) {
        try (accepted = server.accept(timeout: TIMEOUT)) {
            try (tls = TlsSocket.server(accepted, serverConfig: cfg)) {
                tls.handshake(timeout: TIMEOUT)

                if (let Some(certs) <- tls.handshakeResult?.peerCertificate && !certs.isEmpty()) {
                    @Expect(false)
                }
            }
        }
    }

    func acceptShouldNotPassHandshake(cfg: TlsServerConfig) {
        try (accepted = server.accept(timeout: TIMEOUT)) {
            try (tls = TlsSocket.server(accepted, serverConfig: cfg)) {
                try {
                    tls.handshake(timeout: TIMEOUT)
                    @Expect(false)
                } catch (_: TlsException) {
                    // expected
                }
            }
        }
    }
}

enum HandshakeExpect {
    | ShouldFail
    | ShouldAcceptAndNoCertificate
    | ShouldAcceptWithCertificate
}
