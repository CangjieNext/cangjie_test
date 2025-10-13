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
import stdx.crypto.common.*

@Test
class Test_x509 {
    @TestCase
    func test_pem(): Unit {
        let readPath = "./files/title_pem_test.pem"
        let pem = String.fromUtf8(File.readFrom(readPath))
        let parsedPem = Pem.decode(pem)
        @Assert(parsedPem.toString(),"PRIVATE KEY, CERTIFICATE")
    }

    @TestCase
    func test_root(): Unit {
        let certificates = X509Certificate.systemRootCerts()
        println("The number is: ${certificates.size}")
    }

    @TestCase
    func test_SignatureAlgorithm(): Unit {
        @Expect(SignatureAlgorithm.MD2WithRSA, SignatureAlgorithm.MD2WithRSA)
        @Expect(SignatureAlgorithm.MD2WithRSA != SignatureAlgorithm.ECDSAWithSHA512)
    }
}
