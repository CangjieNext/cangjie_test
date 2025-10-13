/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.CryptoException
import std.io.*

@Test
class Test_ecdsa_decodePem {
    let privateKey = """
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIPH5yOjykFQxUeHWLUp6+NrmrI64jb1PqBkW9+jZE1nboAoGCCqGSM49
AwEHoUQDQgAEv2fu7bvqnM0tbQNGguw2qNOq9QtWnq37KD8I6Ibeng1GiSzgmegk
B3Gjq8RLlIsYVDAAqHdohDExAI98tV7+Ng==
-----END EC PRIVATE KEY-----
"""
    let publicKey = """
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEVDNRctvxL9uNRmqtwm5Y6Z/60wNU
77KHR4aIIqT+qvEaVnKfCHb4FdZxF8LZGJluONODZsuUv4+1/YDxrTfGEA==
-----END PUBLIC KEY-----
"""

    @TestCase
    func test_ecdsa_decodePem_01(): Unit {
        let pem = String.fromUtf8(readToEnd(File("./files/ecPri.pem", Read)))
        let ecPri = ECDSAPrivateKey.decodeFromPem(pem)
        let priPem = ecPri.encodeToPem()
        @Expect(priPem.encode(), privateKey)
    }

    @TestCase
    func test_ecdsa_decodePem_02(): Unit {
        let pem = String.fromUtf8(readToEnd(File("./files/ecPri_encrypt.pem", Read)))
        let ecPri = ECDSAPrivateKey.decodeFromPem(pem, password: "1234")
        let priPem = ecPri.encodeToPem()
        @Expect(priPem.encode(), privateKey)
    }

    @TestCase
    func test_ecdsa_decodePem_03(): Unit {
        let pem = String.fromUtf8(readToEnd(File("./files/ecPub.pem", Read)))
        let ecPub = ECDSAPublicKey.decodeFromPem(pem)
        let pubPem = ecPub.encodeToPem()
        @Expect(pubPem.encode(), publicKey)
    }

    @TestCase
    func test_ecdsa_decodePem_04(): Unit {
        var sum = 0
        try {
            let pem = String.fromUtf8(readToEnd(File("./files/ec_err.pem", Read)))
            ECDSAPrivateKey.decodeFromPem(pem, password: None)
        } catch (e: CryptoException) {
            sum += 1
            println(e.message)
            @Expect(e.message.contains("No supported private key entry found in PEM"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_ecdsa_decodePem_05(): Unit {
        var sum = 0
        try {
            let pem = String.fromUtf8(readToEnd(File("./files/ec_err.pem", Read)))
            ECDSAPublicKey.decodeFromPem(pem)
        } catch (e: CryptoException) {
            sum += 1
            println(e.message)
            @Expect(e.message.contains("No PUBLIC KEY entry found in PEM file."))
        }
        @Expect(sum, 1)
    }
}
