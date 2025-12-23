/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.io.*
import std.crypto.digest.*
import std.math.numeric.*
import std.math.*

@Test
class Test_key_rsa_methods_028 {
    @TestCase
    func test_key_rsa_sign_01(): Unit {
        var rsaPri = RSAPrivateKey(512, BigInt("5"))
        var str: String = "cangjie-helloworld"
        var md5Instance = MD5()
        var md: Array<Byte> = digest(md5Instance, str)
        @Expect(rsaPri.sign(md5Instance, md, padType: PKCS1).size, 64)
    }

    @TestCase
    func test_key_rsa_sign_02(): Unit {
        var rsaPri = RSAPrivateKey(512, BigInt("5"))
        var str: String = "cangjie-helloworld"
        var md5Instance = MD5()
        var md: Array<Byte> = digest(md5Instance, str)
        @Expect(rsaPri.sign(md5Instance, md, padType: PSS(PSSOption(0))).size, 64)
    }

    @TestCase
    func test_key_rsa_sign_03(): Unit {
        var rsaPri = RSAPrivateKey(512, BigInt("5"))
        var str: String = "cangjie-helloworld"
        var md5Instance = MD5()
        var md: Array<Byte> = digest(md5Instance, str)
        try {
            rsaPri.sign(md5Instance, md, padType: (OAEP(OAEPOption(SHA1(), SHA224(), label: "cangjie-helloworld"))))
            @Expect(true)
        } catch (e: CryptoException) {
            @Expect(e.message, "OAEPOption only use in encrypt or decrypt.")
        }
    }

    @TestCase
    func test_key_rsa_decrypt_encrypt_04(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var str: String = "hello world, hello cangjie"
        var bas1 = ByteBuffer()
        var bas2 = ByteBuffer()
        var bas3 = ByteBuffer()
        bas1.write(str.toArray())
        rsaPub.encrypt(bas1, bas2, padType: PKCS1)
        rsaPri.decrypt(bas2, bas3, padType: PKCS1)
        var buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray(), buf)
    }

    @TestCase
    func test_key_rsa_decrypt_encrypt_05(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var str: String = "hello world, hello cangjie"
        var bas1 = ByteBuffer()
        var bas2 = ByteBuffer()
        var bas3 = ByteBuffer()
        bas1.write(str.toArray())
        var encOpt = OAEPOption(SHA384(), SHA512(), label: "cangjieworld")
        rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        var decOpt = OAEPOption(SHA384(), SHA384(), label: "cangjieworld")
        try {
            rsaPri.decrypt(bas2, bas3, padType: OAEP(decOpt))
            @Expect(false)
        } catch (e: CryptoException) {
            @Expect(e.message,"Decrypt error.")
        }
    }

    @TestCase
    func test_key_rsa_decrypt_encrypt_06(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var str: String = "hello world, hello cangjie"
        var bas1 = ByteBuffer()
        var bas2 = ByteBuffer()
        var bas3 = ByteBuffer()
        bas1.write(str.toArray())
        try {
            rsaPub.encrypt(bas1, bas2, padType: PSS(PSSOption(0)))
            @Expect(true)
        } catch (e: CryptoException) {
            @Expect(e.message, "PSSOption only use in sign or verify.")
        }
        try {
            rsaPri.decrypt(bas2, bas3, padType: PSS(PSSOption(1)))
            @Expect(true)
        } catch (e: CryptoException) {
            @Expect(e.message, "PSSOption only use in sign or verify.")
        }
    }

    @TestCase
    func test_key_rsa_verify_07(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
        var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: "cangjie#123")
        var rsaPubfromPem = RSAPublicKey(rsaPrifromPem)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = rsaPrifromPem.sign(sha512Instance, md, padType: PKCS1)
        @Expect(rsaPub.verify(sha512Instance, md, sig, padType: PKCS1), true)
    }

    @TestCase
    func test_key_rsa_verify_08(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
        var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: "cangjie#123")
        var rsaPubfromPem = RSAPublicKey(rsaPrifromPem)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = rsaPrifromPem.sign(sha512Instance, md, padType: PKCS1)
        @Expect(rsaPub.verify(sha512Instance, md, sig, padType: PSS(PSSOption(100))), false)
    }

    @TestCase
    func test_key_rsa_verify_09(): Unit {
        var rsaPri = RSAPrivateKey(1024, BigInt("5"))
        var rsaPub = RSAPublicKey(rsaPri)

        var rsaPriPem = rsaPri.encodeToPem(password: Option.Some("cangjie#123"))
        var rsaPrifromPem = RSAPrivateKey.decodeFromPem(rsaPriPem.encode(), password: "cangjie#123")
        var rsaPubfromPem = RSAPublicKey(rsaPrifromPem)

        var str: String = "helloworld"
        var sha512Instance = SHA512()
        var md: Array<Byte> = digest(sha512Instance, str)

        var sig = rsaPrifromPem.sign(sha512Instance, md, padType: PKCS1)
        try {
            rsaPub.verify(sha512Instance, md, sig,
                padType: (OAEP(OAEPOption(SHA1(), SHA224(), label: "cangjie-helloworld"))))
            @Expect(true)
        } catch (e: CryptoException) {
            @Expect(e.message, "OAEPOption only use in encrypt or decrypt.")
        }
    }
}
