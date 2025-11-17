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
import std.sync.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.unittest.*
import std.unittest.testmacro.*
import stdx.crypto.digest.HashType

let SIGNATURE_ALGORITHMS = [
    SignatureScheme(ECDSA_SECP384R1_SHA384),
    SignatureAndHashAlgorithm(ECDSA, HashType.SHA224),
    SignatureScheme(ED25519),
    SignatureScheme(ED448),
    SignatureScheme(RSA_PSS_PSS_SHA384)
]

// TLS extension byte representation
let EXPECTED: Array<Byte> = [
    0x00,
    0x0d, // Type: signature_algorithms (13)
    0x00,
    0x0c, // Length: 12
    0x00,
    0x0a, // Signature Hash Algorithms Length: 10
    0x05,
    0x03, // Signature Algorithm: ecdsa_secp384r1_sha384 (0x0503)
    0x03,
    0x03, // Signature Algorithm: SHA224 ECDSA (0x0303)
    0x08,
    0x07, // Signature Algorithm: ed25519 (0x0807)
    0x08,
    0x08, // Signature Algorithm: ed448 (0x0808)
    0x08,
    0x0a // Signature Algorithm: rsa_pss_pss_sha384 (0x080a)
]

func runTcpServer(): (TcpServerSocket, UInt16) {
    let server = TcpServerSocket(bindAt: 0)
    server.bind()
    let port = (server.localAddress as IPSocketAddress)?.port ?? 0

    return (server, port)
}

func readClientHello(tcpServer: TcpServerSocket): ?Array<Byte> {
    try (client = tcpServer.accept()) {
        let buf = Array<Byte>(65636, repeat: 0)

        let readed = client.read(buf)

        let clientHello = buf[..readed]

        return clientHello
    }

    return None
}

func runTlsClient(port: UInt16) {
    var clientConfig = TlsClientConfig()
    clientConfig.verifyMode = TrustAll
    clientConfig.signatureAlgorithms = SIGNATURE_ALGORITHMS

    try (clientTcp = TcpSocket("127.0.0.1", port)) {
        clientTcp.connect()
        try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
            client.handshake()
        } catch (e: TlsException) {
            // Expected exception because the server interrupts handshake
        }
    }
}

@Test
class TlsSignatureAlgorithmsTest {
    @TestCase
    func sigalgs_are_set_in_client_config(): Unit {
        var clientConfig = TlsClientConfig()
        clientConfig.verifyMode = TrustAll
        clientConfig.signatureAlgorithms = SIGNATURE_ALGORITHMS

        if (let Some(sigalgs) <- clientConfig.signatureAlgorithms) {
            @Assert(sigalgs.size, 5)
            @PowerAssert(sigalgs.toString() == "[ecdsa_secp384r1_sha384, ECDSA+SHA224, ed25519, ed448, rsa_pss_pss_sha384]")
        } else {
            @Assert(false)
        }
    }

    @TestCase
    func client_hello_should_contain_specified_sigalgs(): Unit {
        let (tcpServer, port) = runTcpServer()
        spawn {
            runTlsClient(port)
        }

        let clientHello = readClientHello(tcpServer)
        tcpServer.close()
        if (let Some(clientHello) <- clientHello) {
            if (clientHello.contain(EXPECTED)) {
                @Assert(true)
                return
            }
        }
        @Assert(false)
    }
    @TestCase
    func client_hello_should_contain_specified_not_supported_sigalgs(): Unit {
        var clientConfig = TlsClientConfig()
        clientConfig.verifyMode = TrustAll
        clientConfig.signatureAlgorithms = [SignatureAndHashAlgorithm(ECDSA, HashType.MD5)]
        var num = 0
        let (tcpServer, port) = runTcpServer()
        try (clientTcp = TcpSocket("127.0.0.1", port)) {
            clientTcp.connect()
            try (client = TlsSocket.client(clientTcp, clientConfig: clientConfig)) {
                client.handshake()
            } catch (e: TlsException) {
                num++
                @Expect(e.message, "Failed to set client signature algorithms, hash type is not supported.")
            }
        }
        @Expect(num, 1)
    }
}

extend<T> Array<T> where T <: Equatable<T> {
    public func contain(other: Array<T>): Bool {
        if (other.size > this.size) {
            return false
        }

        for (i in 0..this.size) {
            var matchFromI = true
            for (j in 0..other.size) {
                if (i + j >= this.size || other[j] != this[i + j]) {
                    matchFromI = false
                    break
                }
            }

            if (matchFromI) {
                return true
            }
        }

        return false
    }
}
