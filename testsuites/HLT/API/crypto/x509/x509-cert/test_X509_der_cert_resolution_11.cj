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
import stdx.crypto.common.*
import stdx.crypto.keys.*

var sum = 0

@Test
class Test_X509_der_cert_resolution_11 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    let derData = DerBlob(File.readFrom("./data/end_rsa.der"))
    let derx509 = X509Certificate.decodeFromDer(derData)
    let derData1 = DerBlob(File.readFrom("./data/end_rsa.der"))
    let derx509_1 = X509Certificate.decodeFromDer(derData1)
    let derData2 = DerBlob(File.readFrom("./data/root_ecdsa.der"))
    let derx509_2 = X509Certificate.decodeFromDer(derData2)

    @TestCase
    func test_pemformat_compare_01(): Unit {
        @Expect(derx509 == derx509_1)
        @Expect(derx509 != derx509_2)
    }
}
