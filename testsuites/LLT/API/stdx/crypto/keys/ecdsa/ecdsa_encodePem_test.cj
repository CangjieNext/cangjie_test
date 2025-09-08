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

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.io.*

@Test
class Test_ecdsa_encodePem {
    @TestCase
    func test_ecdsa_encodePem_01(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            let priPem = ecPri.encodeToPem()
            let file: File = File("./ecPri.pem", ReadWrite)
            file.write(priPem.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodePem_02(): Unit {
        var sum = 0
        try {
            let ecPri = ECDSAPrivateKey(P256)
            let priPemEnc = ecPri.encodeToPem(password: "1234")
            let file: File = File("./ecPri_encrypt.pem", ReadWrite)
            file.write(priPemEnc.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_encodePem_03(): Unit {
        var sum = 0
        try {
            let der = DerBlob(readToEnd(File("./files/ecPri.der", Read)))
            let ecPri = ECDSAPrivateKey.decodeDer(der)

            let ecPub = ECDSAPublicKey(ecPri)
            let pubPem = ecPub.encodeToPem()

            let file: File = File("./ecPub.pem", ReadWrite)
            file.write(pubPem.encode().toArray())
            file.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }
}
