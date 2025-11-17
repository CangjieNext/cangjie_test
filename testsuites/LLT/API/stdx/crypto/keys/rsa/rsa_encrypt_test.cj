/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.io.*
import std.crypto.digest.*
import stdx.crypto.digest.CryptoException
import std.math.numeric.BigInt
import std.runtime.*

@Test
class Test_rsa_encrypt {
    @TestCase
    func test_rsa_encrypt_01(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "helloworld"

        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())

        rsaPub.encrypt(bas1, bas2, padType: PKCS1)
        rsaPri.decrypt(bas2, bas3, padType: PKCS1)

        let buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray(), buf)
    }

    @TestCase
    func test_rsa_encrypt_02(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = """
        test long input stream:
        Asymmetric key, also known as a public key cryptosystem,
        is an encryption algorithm that uses two different but related keys:
        a public key and a private key.
        The public key is used to encrypt the data,
        and the private key is used to decrypt the data.
        """
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())

        let encOpt = OAEPOption(SHA1(), SHA256(), label: "helloworld")
        rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        let encOpt2 = OAEPOption(SHA1(), SHA256(), label: "helloworld")
        rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))

        let buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray(), buf)
    }

    @TestCase
    func test_rsa_encrypt_03(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "hello world, hello cangjie"
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())

        let encOpt = OAEPOption(SHA1(), SHA256())
        rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        let encOpt2 = OAEPOption(SHA1(), SHA256())
        rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))

        let buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray(), buf)
    }

    @TestCase
    func test_rsa_encrypt_04(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)

            let str: String = "hello world"
            let bas1 = ByteBuffer()
            let bas2 = ByteBuffer()
            let bas3 = ByteBuffer()
            bas1.write(str.toArray())

            let encOpt = OAEPOption(SHA1(), SHA256(), label: "1")
            rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
            let encOpt2 = OAEPOption(SHA1(), SHA256(), label: "")
            rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))

            let buf = Array<Byte>(str.size, repeat: 0)
            bas3.read(buf)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Decrypt error"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encrypt_05(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)

            let str: String = "hello world"
            let bas1 = ByteBuffer()
            let bas2 = ByteBuffer()
            let bas3 = ByteBuffer()
            bas1.write(str.toArray())

            let encOpt = OAEPOption(SHA1(), SHA256(), label: "1")
            rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
            let encOpt2 = OAEPOption(SHA256(), SHA256(), label: "1")
            rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))

            let buf = Array<Byte>(str.size, repeat: 0)
            bas3.read(buf)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Decrypt error"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encrypt_06(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(512)
            let rsaPub = RSAPublicKey(rsaPri)

            let bas1 = ByteBuffer()
            let bas2 = ByteBuffer()

            let encOpt = PSSOption(32)
            rsaPub.encrypt(bas1, bas2, padType: PSS(encOpt))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("PSSOption only use in sign or verify."))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encrypt_07(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)

            let str: String = "hello world"
            let bas1 = ByteBuffer()
            let bas2 = ByteBuffer()
            let bas3 = ByteBuffer()
            bas1.write(str.toArray())

            let encOpt = OAEPOption(SHA1(), MD5(), label: "1")
            rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
            let encOpt2 = PSSOption(32)
            rsaPri.decrypt(bas2, bas3, padType: PSS(encOpt2))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("PSSOption only use in sign or verify."))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encrypt_08(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(512)
            let rsaPub = RSAPublicKey(rsaPri)

            let str: String = "hello world, hello cangjie"
            let bas1 = ByteBuffer()
            let bas2 = ByteBuffer()
            bas1.write(str.toArray())

            let encOpt = OAEPOption(SHA512(), SHA256())
            rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("RSA_key_size smaller that (2 * hash_size - 2)"))
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_rsa_encrypt_09(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)
        let RSA_SIZE = 256
        let str: String = ""

        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())
        // encrypt empty stream
        rsaPub.encrypt(bas1, bas2, padType: PKCS1)
        var enc = Array<Byte>(RSA_SIZE, repeat: 0)
        let zero = Array<Byte>(RSA_SIZE, repeat: 0)
        bas2.read(enc)
        @Expect(zero != enc)
        // decrypt
        rsaPri.decrypt(bas2, bas3, padType: PKCS1)
        let buf = Array<Byte>(RSA_SIZE, repeat: 0)
        let len = bas3.read(buf)
        @Expect(len, 0)
    }

    @TestCase
    func test_rsa_encrypt_10(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)
        let RSA_SIZE = 256
        let str: String = ""

        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())
        // encrypt empty stream
        let encOpt = OAEPOption(SHA1(), SHA256(), label: "helloworld")
        rsaPub.encrypt(bas1, bas2, padType: OAEP(encOpt))
        var enc = Array<Byte>(RSA_SIZE, repeat: 0)
        let zero = Array<Byte>(RSA_SIZE, repeat: 0)
        bas2.read(enc)
        @Expect(zero != enc)
        // decrypt
        let encOpt2 = OAEPOption(SHA1(), SHA256(), label: "helloworld")
        rsaPri.decrypt(bas2, bas3, padType: OAEP(encOpt2))
        let buf = Array<Byte>(RSA_SIZE, repeat: 0)
        let len = bas3.read(buf)
        @Expect(len, 0)
    }

    @TestCase
    func test_rsa_encrypt_11(): Unit {
        let rsaPri = RSAPrivateKey(2048)
        let rsaPub = RSAPublicKey(rsaPri)

        let str: String = "helloworld"

        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(str.toArray())

        rsaPub.encrypt(bas1, bas2, padType: PKCS1)
        rsaPri.decrypt(bas2, bas3, padType: PKCS1)

        let buf = Array<Byte>(str.size, repeat: 0)
        bas3.read(buf)
        @Expect(str.toArray(), buf)
    }
}
