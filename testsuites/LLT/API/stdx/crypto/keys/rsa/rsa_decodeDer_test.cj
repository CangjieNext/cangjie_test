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
import stdx.crypto.common.*
import std.io.*

@Test
class Test_rsa_decodeDer {
    @TestCase
    func test_rsa_decodeDer_01(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri.der", Read)))
            RSAPrivateKey.decodeDer(der)
            RSAPrivateKey.decodeDer(der, password: None)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_decodeDer_02(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri_encrypt.der", Read)))
            let rsaPri = RSAPrivateKey.decodeDer(der, password: "1234")
            let priDer = rsaPri.encodeToDer()

            let file: File = File("./rsaPri_dec.der", ReadWrite)
            file.write(priDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_decodeDer_03(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPub.der", Read)))
            let rsaPub = RSAPublicKey.decodeDer(der)
            let priDer = rsaPub.encodeToDer()
            println(priDer.body)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_decodeDer_04(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri_encrypt.der", Read)))
            RSAPrivateKey.decodeDer(der, password: "")
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Password shouldn't be empty"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_decodeDer_05(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri_encrypt.der", Read)))
            RSAPrivateKey.decodeDer(der, password: "1236")
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Failed to load private key"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_decodeDer_06(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri_encrypt.der", Read)))
            RSAPrivateKey.decodeDer(der, password: None)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Load private key error"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_decodeDer_07(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPub.der", Read)))
            RSAPublicKey.decodeDer(der)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Public key type error"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_decodeDer_08(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri_encrypt.der", Read)))
            RSAPublicKey.decodeDer(der)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Load PublicKey error"))
        }
        @Expect(sum, 1)
    }
}
