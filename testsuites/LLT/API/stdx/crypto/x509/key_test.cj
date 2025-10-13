/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args
import std.fs.File
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*

var sum = 0

@Test
class Test_key {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_private_key(): Unit {
        let path = "./files/end_rsa_private_key.pem"
        let pem = String.fromUtf8(File.readFrom(path))
        try {
            // decode for pem
            let pkey = GeneralPrivateKey.decodeFromPem(pem)
            pkey.encodeToPem()
            // encode the key to pem using password
            let penback = pkey.encodeToPem(password: "zzzzzxxxxx11111")
            penback.toString()
            if (pem.isEmpty()) {
                println("pem isEmpty")
            }
        } catch (e: X509Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_public_key(): Unit {
        let path = "./files/public_key_pem_test.pem"
        let pem = String.fromUtf8(File.readFrom(path))
        try {
            // decode for pem
            let pkey = GeneralPublicKey.decodeFromPem(pem)
            pkey.toString()
            // encode the public key from der
            let path2 = "./files/end_ecdsa_private_key.der"
            let derForm = File.readFrom(path2)
            let derToKey = GeneralPrivateKey.decodeDer(DerBlob(derForm))
            derToKey.toString()
        } catch (e: X509Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }
}
