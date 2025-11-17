/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.net.tls.*

var sum = 0

@Test
class Test_der_verify_publicKey_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase[x in [ "./files/root_ecdsa_1.text", "./files/root_rsa_public_key.pem",
 "./files/end_rsa_garble.der", "./files/end_rsa_private_key.der" ]]
    func test_verify_publicKey(x: String): Unit {
        let derData = DerBlob(File.readFrom(x))
        try {
            let derpub = PublicKey.decodeDer(derData)
            @Assert(false)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load public key"))
        }
    }

    @TestCase
    func test_verify_publicKey_succ(): Unit {
        let pemString = """
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC92ZpL7nsPInwG91s5h738HI8V
JNU0cX2nA7+cMfyhPXAIuBDpufsUv21OoFs2TdHEdQyxUWwVQ8ooyQU8cTsneeOX
U5e0e7xiCJDzG2QnUXBl+0au82OAP7GDhGuj5Sm4Oz/G8B+zY75SWPmcFx3jTVF3
kCYpM+BXs2u9knxRgwIDAQAB
-----END PUBLIC KEY-----
"""
        let derpub = PublicKey.decodeFromPem(pemString)
    }

    @TestCase
    func test_verify_publicKey_empty(): Unit {
        let derData = DerBlob(Array<Byte>())
        try {
            let derpub = PublicKey.decodeDer(derData)
            @Assert(false)
        } catch (e: X509Exception) {
        }
    }
}
