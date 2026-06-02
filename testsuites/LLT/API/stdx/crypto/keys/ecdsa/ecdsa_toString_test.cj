/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import std.fs.*
import std.io.*

@Test
class Test_ecdsa_toString {
    @TestCase
    func test_ecdsa_toString_01(): Unit {
        let pemPri = String.fromUtf8(readToEnd(File("./files/ecPri.pem", Read)))
        let ecPri = ECDSAPrivateKey.decodeFromPem(pemPri)
        @Expect(ecPri.toString(), "ECDSA PRIVATE KEY")
    }

    @TestCase
    func test_ecdsa_toString_02(): Unit {
        let pemPub = String.fromUtf8(readToEnd(File("./files/ecPub.pem", Read)))
        let ecPub = ECDSAPublicKey.decodeFromPem(pemPub)
        @Expect(ecPub.toString(), "ECDSA PUBLIC KEY")
    }
}
