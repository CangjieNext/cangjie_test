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
import stdx.crypto.digest.CryptoException
import std.io.*

@Test
class Test_rsa_decodePem {
    let privateKey = """
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAvTdlNVslQ/uDZOX2oGPyhuTzITFJsjzEM/SpOD+lnGSvrk9E
/0jNdvy12rhDEpDm8JvRvGKQ0S0FaRBvMMLzoxERs4t7AxU8IUuMtsYEkwORCLSn
hPWpd0bnzbO+ssZGRPRq1aM2CyaxDnxwGzbjeO2i3lUV9k7gJ5+ZE/9oFT3Iig4E
awcSMZML+KmS2hDgeMhpdjVhc8+XuDUuMxztI6wPLgts1j89p9DZlGwWy4589DoS
EFXqYbUFvZyGt+xRG65gEmaUQbUmBDYuNC5vU2Y1Hj8KjnupMm1obbaJvMfG/bOf
aAnLl1B36sFCWzw/vvVB/eupuoFEnSpVcm5KHwIDAQABAoIBABMqPzgOSVH/camQ
mVBZj0EWg4HDKkHBYeYZS+KEn9OdZyXypXxt9VGt+wVyUGjbAGkyfyXjneNx+fBQ
V9LKjD7iBbb307fWOMbujgwdNm1lmRUWpzkSYN3R8rylDhWxe4CUeRW2eEzc2GYt
OHWpM5UWDL8UQys1hgK9aZXa8sHj2YZpy+oGSAQ2VvN+AOXUR1vuzLp8tCMcnpw9
jRZ23yu/F5ZkQ7qySF12Y1odAmozX277VsXDIB4NkGnncEbAOTWmJJUqPERrrQuf
GeRNkfxIXnZD8LOSFN6dq8UHl1BbO80tbHC5nriPHm40mapZ/f4voXM/BiClJjQG
HXhzivECgYEA41BH4JTNiABXVP/SjOi9L+H5ZEkB0rfoYQqrQ4Oix6yIFu03mNWs
xuJdX9shPIHILsuP44JNMhN/g8QIjbrmgyh68XEGUwRcA/+hixdasVy3ONXQ5ABj
Z61l6Xc2q5+iFlF0wJzxXa7NWk2m1fsfrvtUcSleq2WNC7YWtRjQj4UCgYEA1RhT
M4Beo3jztL3f4NlLKNRGx7rqBumJM2e6dV4a01+a7rV0zBkFvB9biIOEhty3+RGm
VbH7Of7aUfFA5RTCjBWgaQbFyDHblUeaNZvOfGhI6Vx4EDSrQH1zFGrC9XydeDJU
jxxQEAg4LsNSHgzSlTseoatEXA9BPnzuZCpfWlMCgYBjA747ajXY7uUbpk+Nh3eZ
GuKqN07u/aLgWmhdgUJvnYyuB+h2z2RyQXoQ3f+tPo73Kz5jCIgdrvaVa9eZ/PaZ
3REoiGYL1VNLfpdcYfDkXxGEVUanei/SompI9t++hEtzU0n6+KH+f7z9f+OTQ876
RonyvOV63UJB/rAHdGasjQKBgQCTOcYqG/PG38cIxfKKp7ZM1DS+w73y3qDjOjRR
6J2CEli5ufajGFqk+clEzRDgGFinJXGVXW1kSVbPLG6Ylzo+jKaSSZKWWRQL1DeP
+EC2JVrSmAd/stPqr4G1xnlCIEGvjJ5tbbNHEFa4wEvY5SUM45arPefx7rw2Dxyp
abkNbwKBgBVoRXlnUuVZbcFQxevDys6BRrXFYIHe3IXxGZwNEDnwgqxDOcFwr3Mn
v2PnKDy7JS50PY7iW85avMUhoS66awJdRgUxdNYJBfI8GJXvh+gAzcIhpFhb9rwV
JwEBp9V2Hux9Pte77vujjDlTCqI0AS52+mJjIRO+0p0tjUDFX1fV
-----END RSA PRIVATE KEY-----
"""
    let publicKey = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvTdlNVslQ/uDZOX2oGPy
huTzITFJsjzEM/SpOD+lnGSvrk9E/0jNdvy12rhDEpDm8JvRvGKQ0S0FaRBvMMLz
oxERs4t7AxU8IUuMtsYEkwORCLSnhPWpd0bnzbO+ssZGRPRq1aM2CyaxDnxwGzbj
eO2i3lUV9k7gJ5+ZE/9oFT3Iig4EawcSMZML+KmS2hDgeMhpdjVhc8+XuDUuMxzt
I6wPLgts1j89p9DZlGwWy4589DoSEFXqYbUFvZyGt+xRG65gEmaUQbUmBDYuNC5v
U2Y1Hj8KjnupMm1obbaJvMfG/bOfaAnLl1B36sFCWzw/vvVB/eupuoFEnSpVcm5K
HwIDAQAB
-----END PUBLIC KEY-----
"""

    @TestCase
    func test_rsa_decodePem_01(): Unit {
        let pem = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
        let rsaPri = RSAPrivateKey.decodeFromPem(pem)
        let priPem = rsaPri.encodeToPem()
        @Expect(priPem.encode(), privateKey)
    }

    @TestCase
    func test_rsa_decodePem_02(): Unit {
        let pem = String.fromUtf8(readToEnd(File("./files/rsaPri_encrypt.pem", Read)))
        let rsaPri = RSAPrivateKey.decodeFromPem(pem, password: "1234")
        let priPem = rsaPri.encodeToPem()
        @Expect(priPem.encode(), privateKey)
    }

    @TestCase
    func test_rsa_decodePem_03(): Unit {
        var pem = String.fromUtf8(readToEnd(File("./files/rsaPub.pem", Read)))
        var rsaPub = RSAPublicKey.decodeFromPem(pem)
        var pubPem = rsaPub.encodeToPem()
        @Expect(pubPem.encode(), publicKey)
    }

    @TestCase
    func test_rsa_decodePem_04(): Unit {
        var sum = 0
        try {
            let pem = String.fromUtf8(readToEnd(File("./files/rsaPri_encrypt.pem", Read)))
            RSAPrivateKey.decodeFromPem(pem, password: "")
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Password shouldn't be empty"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_decodePem_05(): Unit {
        var sum = 0
        try {
            let pem = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
            RSAPublicKey.decodeFromPem(pem)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("No PUBLIC KEY entry found in PEM file."))
        }
        @Expect(sum, 1)
    }
}
