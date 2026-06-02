/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*

@Test
class Test_ecdsa_sign {
    func test_ecdsa_sign_successfully(curve: Curve, d: Digest): Unit {
        var sum = 0
        let ecPri = ECDSAPrivateKey(curve)
        let ecPub = ECDSAPublicKey(ecPri)

        let str: String = "helloworld"
        let digestInstance = d
        let md: Array<Byte> = digest(digestInstance, str)

        let sig = ecPri.sign(md)
        if (ecPub.verify(md, sig)) {
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_ecdsa_sign_01(): Unit {
        test_ecdsa_sign_successfully(P224, SHA512())
    }

    @TestCase
    func test_ecdsa_sign_02(): Unit {
        test_ecdsa_sign_successfully(P384, MD5())
    }

    @TestCase
    func test_ecdsa_sign_03(): Unit {
        test_ecdsa_sign_successfully(P256, MD5())
    }

    @TestCase
    func test_ecdsa_sign_04(): Unit {
        var sum = 0
        let ecPri = ECDSAPrivateKey(P521)
        let ecPub = ECDSAPublicKey(ecPri)

        let str: String = "helloworld"
        let md5Instance = MD5()
        let md: Array<Byte> = digest(md5Instance, str)

        let sha512Instance = SHA512()
        let md512: Array<Byte> = digest(sha512Instance, str)

        let sig = ecPri.sign(md)
        if (ecPub.verify(md512, sig)) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_ecdsa_sign_05(): Unit {
        test_ecdsa_sign_successfully(BP256, MD5())
    }

    @TestCase
    func test_ecdsa_sign_06(): Unit {
        test_ecdsa_sign_successfully(BP320, SHA1())
    }

    @TestCase
    func test_ecdsa_sign_07(): Unit {
        test_ecdsa_sign_successfully(BP384, SHA224())
    }

    @TestCase
    func test_ecdsa_sign_08(): Unit {
        test_ecdsa_sign_successfully(BP512, SHA384())
    }
}
