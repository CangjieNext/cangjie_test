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
import stdx.crypto.digest.CryptoException
import std.math.numeric.BigInt
import std.io.*

@Test
class Test_rsa_encodePem {
    @TestCase
    func test_rsa_encodePem_01(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priPem = rsaPri.encodeToPem()
            let file: File = File("./rsaPri.pem", ReadWrite)
            file.write(priPem.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodePem_02(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priPemEnc = rsaPri.encodeToPem(password: "1234")
            let file: File = File("./rsaPri_encrypt.pem", ReadWrite)
            file.write(priPemEnc.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodePem_03(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priPemNoEnc = rsaPri.encodeToPem(password: None)
            let file: File = File("./rsaPri_noencrypt.pem", ReadWrite)
            file.write(priPemNoEnc.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodePem_04(): Unit {
        var sum = 0
        try {
            var pem = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
            var rsaPri = RSAPrivateKey.decodeFromPem(pem)
            var rsaPub = RSAPublicKey(rsaPri)
            var pubPem = rsaPub.encodeToPem()

            var file: File = File("./rsaPub.pem", ReadWrite)
            file.write(pubPem.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodePem_05(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priPem = rsaPri.encodeToPem(password: "")
            let file: File = File("./rsaPri.pem", ReadWrite)
            file.write(priPem.encode().toArray())
            file.close()
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Password shouldn't be empty"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encodePem_06(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048, BigInt(3))
            let priPem = rsaPri.encodeToPem()
        } catch (e: CryptoException) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodePem_07(): Unit {
        var sum = 0
        try {
            let exponentArray = Array<Byte>(33, repeat: 255)
            exponentArray[0] = 0
            let rsaPri = RSAPrivateKey(2048, BigInt(exponentArray))
            let priPem = rsaPri.encodeToPem()
        } catch (e: CryptoException) {
            sum += 1
        }
        @Expect(sum, 0)
    }
}
