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
import stdx.crypto.digest.*
import std.crypto.digest.*
import std.fs.*
import std.math.numeric.BigInt
import std.io.*

@Test
class Test_rsa_sign {
    @TestCase
    func test_rsa_sign_01(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "helloworld"
        let sha512Instance = SHA512()
        let md: Array<Byte> = digest(sha512Instance, str)

        let sig = rsaPri.sign(sha512Instance, md, padType: PKCS1)
        @Expect(rsaPub.verify(sha512Instance, md, sig, padType: PKCS1))
    }

    @TestCase
    func test_rsa_sign_02(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "helloworld"
        let sha384Instance = SHA384()
        let md: Array<Byte> = digest(sha384Instance, str)

        let signOpt = PSSOption(32)
        let sig = rsaPri.sign(sha384Instance, md, padType: PSS(signOpt))
        @Expect(rsaPub.verify(sha384Instance, md, sig, padType: PSS(signOpt)))
    }

    @TestCase
    func test_rsa_sign_03(): Unit {
        let pemPri = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
        let rsaPri = RSAPrivateKey.decodeFromPem(pemPri)

        let pemPub = String.fromUtf8(readToEnd(File("./files/rsaPub.pem", Read)))
        let rsaPub = RSAPublicKey.decodeFromPem(pemPub)

        let str: String = "helloworld"
        let sha224Instance = SHA224()
        let md: Array<Byte> = digest(sha224Instance, str)

        let sig = rsaPri.sign(sha224Instance, md, padType: PKCS1)
        @Expect(rsaPub.verify(sha224Instance, md, sig, padType: PKCS1))
    }

    @TestCase
    func test_rsa_sign_04(): Unit {
        var sum = 0
        try {
            let pemPri = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
            let rsaPri = RSAPrivateKey.decodeFromPem(pemPri)

            let pemPub = String.fromUtf8(readToEnd(File("./files/rsaPub.pem", Read)))
            let rsaPub = RSAPublicKey.decodeFromPem(pemPub)

            let str: String = "helloworld"
            let sha512Instance = SHA512()
            let md: Array<Byte> = digest(sha512Instance, str)

            let sha1Instance = SHA1()
            let sig = rsaPri.sign(sha1Instance, md, padType: PKCS1)
            rsaPub.verify(sha512Instance, md, sig, padType: PKCS1)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Sign error"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_sign_05(): Unit {
        let pemPri = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
        let rsaPri = RSAPrivateKey.decodeFromPem(pemPri)

        let pemPub = String.fromUtf8(readToEnd(File("./files/rsaPub.pem", Read)))
        let rsaPub = RSAPublicKey.decodeFromPem(pemPub)

        let str: String = "helloworld"
        let sha512Instance = SHA512()
        let md: Array<Byte> = digest(sha512Instance, str)

        let sha1Instance = SHA1()
        let sig = rsaPri.sign(sha512Instance, md, padType: PKCS1)
        @Expect(!rsaPub.verify(sha1Instance, md, sig, padType: PKCS1))
    }

    @TestCase
    func test_rsa_sign_06(): Unit {
        var sum = 0
        try {
            PSSOption(-1)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Salt length can not less than 0"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_sign_07(): Unit {
        var sum = 0
        try {
            let pemPri = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
            let rsaPri = RSAPrivateKey.decodeFromPem(pemPri)

            let str: String = "helloworld"
            let sha512Instance = SHA512()
            let md: Array<Byte> = digest(sha512Instance, str)

            let opt = OAEPOption(SHA1(), MD5())
            rsaPri.sign(sha512Instance, md, padType: OAEP(opt))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("OAEPOption only use in encrypt or decrypt"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_sign_08(): Unit {
        var sum = 0
        try {
            let pemPri = String.fromUtf8(readToEnd(File("./files/rsaPri.pem", Read)))
            let rsaPri = RSAPrivateKey.decodeFromPem(pemPri)

            let pemPub = String.fromUtf8(readToEnd(File("./files/rsaPub.pem", Read)))
            let rsaPub = RSAPublicKey.decodeFromPem(pemPub)

            let str: String = "helloworld"
            let sha224Instance = SHA224()
            let md: Array<Byte> = digest(sha224Instance, str)

            let signOpt = PSSOption(32)
            let sig = rsaPri.sign(sha224Instance, md, padType: PSS(signOpt))
            let opt = OAEPOption(SHA1(), MD5())
            rsaPub.verify(sha224Instance, md, sig, padType: OAEP(opt))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("OAEPOption only use in encrypt or decrypt"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_sign_09(): Unit {
        let exponentArray = Array<Byte>(9, repeat: 255)
        exponentArray[0] = 0
        let rsaPri = RSAPrivateKey(2048, BigInt(exponentArray) + BigInt(2))
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "helloworld"
        let sha512Instance = SHA512()
        let md: Array<Byte> = digest(sha512Instance, str)

        let sig = rsaPri.sign(sha512Instance, md, padType: PKCS1)
        @Expect(rsaPub.verify(sha512Instance, md, sig, padType: PKCS1))
    }
}
