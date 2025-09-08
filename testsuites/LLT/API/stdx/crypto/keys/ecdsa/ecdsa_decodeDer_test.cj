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
import std.runtime.*

@Test
class Test_ecdsa_decodeDer {
    @TestCase
    func test_ecdsa_decodeDer_01(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPri.der", Read)))
            ECDSAPrivateKey.decodeDer(der)
            ECDSAPrivateKey.decodeDer(der, password: None)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_decodeDer_02(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPri_encrypt.der", Read)))
            let ecPri = ECDSAPrivateKey.decodeDer(der, password: "1234")

            let priDer = ecPri.encodeToDer()
            let file: File = File("./ecPri_dec.der", ReadWrite)
            file.write(priDer.body)
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_decodeDer_03(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPub.der", Read)))
            let ecPub = ECDSAPublicKey.decodeDer(der)
            ecPub.encodeToDer()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_decodeDer_04(): Unit {
        var sum = 0
        try {
            var der = DerBlob(readToEnd(File("./files/blank.der", Read)))
            ECDSAPrivateKey.decodeDer(der, password: "1")
        } catch (e: CryptoException) {
            sum += 1
            println(e.message)
            @Expect(e.message.contains("Predicate failed: length > 0"))
        }
        @Expect(sum, 1)
    }
}
