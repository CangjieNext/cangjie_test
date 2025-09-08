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
class Test_ecdsa_encodeDer {
    @TestCase
    func test_ecdsa_encodeDer_01(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            let priDer = ecPri.encodeToDer()

            let file: File = File("./ecPri.der", ReadWrite)
            file.write(priDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodeDer_02(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            let priDerEnc = ecPri.encodeToDer(password: "1234")
            let file: File = File("./ecPri_encrypt.der", ReadWrite)
            file.write(priDerEnc.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodeDer_03(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            ecPri.encodeToDer(password: None)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodeDer_04(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPri.der", Read)))
            let ecPri = ECDSAPrivateKey.decodeDer(der)

            let ecPub = ECDSAPublicKey(ecPri)
            let pubDer = ecPub.encodeToDer()

            let file: File = File("./ecPub.der", ReadWrite)
            file.write(pubDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodeDer_05(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            ecPri.encodeToDer(password: "")
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Password shouldn't be empty"))
        }
        @Expect(sum, 1)
    }
}
