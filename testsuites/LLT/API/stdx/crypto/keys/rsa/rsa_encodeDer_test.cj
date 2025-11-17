/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (not CJNATIVE) LEVEL:2
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.digest.CryptoException
import std.io.*

@Test
class Test_rsa_encodeDer {
    @TestCase
    func test_rsa_encodeDer_01(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priDer = rsaPri.encodeToDer()
            let file: File = File("./rsaPri.der", ReadWrite)
            file.write(priDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodeDer_02(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priDerEnc = rsaPri.encodeToDer(password: "1234")
            let file: File = File("./rsaPri_encrypt.der", ReadWrite)
            file.write(priDerEnc.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodeDer_03(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priDerNoEnc = rsaPri.encodeToDer(password: None)
            let file: File = File("./rsaPri_noencrypt.der", ReadWrite)
            file.write(priDerNoEnc.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodeDer_04(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/rsaPri.der", Read)))
            let rsaPri = RSAPrivateKey.decodeDer(der)
            let rsaPub = RSAPublicKey(rsaPri)
            let pubDer = rsaPub.encodeToDer()

            let file: File = File("./rsaPub.der", ReadWrite)
            file.write(pubDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_rsa_encodeDer_05(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let priDer = rsaPri.encodeToDer(password: "")
            let file1: File = File("./rsaPri.der", ReadWrite)
            file1.write(priDer.body)
            file1.close()
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Password shouldn't be empty"))
        }
        @Expect(sum, 1)
    }
}
