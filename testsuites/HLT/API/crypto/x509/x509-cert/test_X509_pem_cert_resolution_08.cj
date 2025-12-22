/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*

var sum = 0

@Test
class Test_X509_pem_cert_resolution_08 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    let pemData = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
    let pemx509 = X509Certificate.decodeFromPem(pemData)
    let pemData1 = String.fromUtf8(File.readFrom("./data/root_rsa.cer"))
    let pemx509_1 = X509Certificate.decodeFromPem(pemData1)
    let pemData2 = String.fromUtf8(File.readFrom("./data/end_ecdsa.cer"))
    let pemx509_2 = X509Certificate.decodeFromPem(pemData2)

    @TestCase
    func test_pemformat_compare_01(): Unit {
        @Expect(pemx509[0] == pemx509_1[0])
        @Expect(pemx509[0] != pemx509_2[0])
    }

    @TestCase
    func test_pemformat_systemrootcerts_02(): Unit {
        let pemData = String.fromUtf8(File.readFrom("./data/root_ca.pem"))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        let root1 = X509Certificate.systemRootCerts()
        for (pem in root1) {
            if (pemx509.contains(pem)) {
                continue
            } else {
                println("error")
                break
            }
        }
        for (pem1 in pemx509) {
            if (root1.contains(pem1)) {
                continue
            } else {
                println("error")
                break
            }
        }
    }
}
