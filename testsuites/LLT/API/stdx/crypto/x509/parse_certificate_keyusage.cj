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

import std.fs.*
import stdx.crypto.x509.*

@Test
class Test_X509_cert_keyusage {
    private func test_get_keyusage(file: String): String {
        let pemData = String.fromUtf8(File.readFrom(file))
        let pemx509 = X509Certificate.decodeFromPem(pemData)
        pemx509[0].keyUsage.toString()
    }

    @TestCase
    func test_pemformat_keyusage_01(): Unit {
        @Expect(test_get_keyusage("./files/root_rsa.cer"), "CRLSign, CertSign")
    }

    @TestCase
    func test_pemformat_keyusage_02(): Unit {
        @Expect(test_get_keyusage("./files/end_ecdsa.cer"), "")
    }

    @TestCase
    func test_pemformat_keyusage_03(): Unit {
        @Expect(test_get_keyusage("./files/test.crt"), "DataEncipherment, KeyEncipherment, NonRepudiation, DigitalSignature")
    }

    @TestCase
    func test_pemformat_extkeyusage_01(): Unit {
        let keyusageStr = [
            "AnyKey",
            "ServerAuth",
            "ClientAuth",
            "EmailProtection",
            "CodeSigning",
            "OCSPSigning",
            "TimeStamping"
        ]

        var keyusage = ExtKeyUsage(Array<UInt16>())
        var expect = ""
        @Expect(keyusage.toString(), expect)

        for (i in 0..10) {
            keyusage = ExtKeyUsage([UInt16(i)])
            expect = if (i < keyusageStr.size) {
                keyusageStr[i]
            } else {
                keyusageStr[0]
            }
            @Expect(keyusage.toString(), expect)
        }
    }
}
