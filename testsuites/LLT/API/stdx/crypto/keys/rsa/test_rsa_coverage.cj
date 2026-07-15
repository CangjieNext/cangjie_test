/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import stdx.crypto.keys.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import std.crypto.digest.*
import std.io.*
import std.math.numeric.BigInt

func toBytes(s: String): Array<Byte> { unsafe { s.rawData() } }

@Test
public class RsaCoverageTest {
    @TestCase
    func testDerRoundtrip(): Unit {
        let pri = RSAPrivateKey(512)
        let der = pri.encodeToDer()
        let _ = RSAPrivateKey.decodeDer(der)
    }
    @TestCase
    func testPemRoundtrip(): Unit {
        let pri = RSAPrivateKey(512)
        let pem = pri.encodeToPem()
        let _ = RSAPrivateKey.decodeFromPem(pem.encode())
    }
    @TestCase
    func testDerWithPassword(): Unit {
        let pri = RSAPrivateKey(512)
        let der = pri.encodeToDer(password: "testpass")
        let _ = RSAPrivateKey.decodeDer(der, password: "testpass")
    }
    @TestCase
    func testPemWithPassword(): Unit {
        let pri = RSAPrivateKey(512)
        let pem = pri.encodeToPem(password: "pass123")
        let _ = RSAPrivateKey.decodeFromPem(pem.encode(), password: "pass123")
    }
    @TestCase
    func testPublicKeyFromPrivate(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let pubDer = pub.encodeToDer()
        let _ = RSAPublicKey.decodeDer(pubDer)
    }
    @TestCase
    func testPublicKeyPem(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let pem = pub.encodeToPem()
        let _ = RSAPublicKey.decodeFromPem(pem.encode())
    }
    @TestCase
    func testSignPkcs1(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SHA256()
        let md = digest(hash, "test message")
        let sig = pri.sign(hash, md, padType: PKCS1)
        @Expect(pub.verify(hash, md, sig, padType: PKCS1))
    }
    @TestCase
    func testSignPss(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SHA256()
        let md = digest(hash, "test message")
        let sig = pri.sign(hash, md, padType: PSS(PSSOption(0)))
        @Expect(pub.verify(hash, md, sig, padType: PSS(PSSOption(0))))
    }
    @TestCase
    func testSignOaepError(): Unit {
        let pri = RSAPrivateKey(512)
        let hash = SHA256()
        let md = digest(hash, "test")
        try {
            let _ = pri.sign(hash, md, padType: OAEP(OAEPOption(SHA256(), SHA256())))
            @Expect(false)
        } catch (_: CryptoException) {}
    }
    @TestCase
    func testDecryptPssError(): Unit {
        let pri = RSAPrivateKey(512)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        bas1.write(toBytes("test"))
        try {
            pri.decrypt(bas1, bas2, padType: PSS(PSSOption(0)))
            @Expect(false)
        } catch (_: CryptoException) {}
    }
    @TestCase
    func testVerifyWrongSig(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SHA256()
        let md = digest(hash, "test")
        let wrongSig = Array<Byte>(64, repeat: 0)
        @Expect(!pub.verify(hash, md, wrongSig, padType: PKCS1))
    }
    @TestCase
    func testSignSha1(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SHA1()
        let md = digest(hash, "test")
        let sig = pri.sign(hash, md, padType: PKCS1)
        @Expect(pub.verify(hash, md, sig, padType: PKCS1))
    }
    @TestCase
    func testSignSm3(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SM3()
        let md = digest(hash, "test")
        try {
            let sig = pri.sign(hash, md, padType: PKCS1)
            @Expect(pub.verify(hash, md, sig, padType: PKCS1))
        } catch (_: CryptoException) {}
    }
    @TestCase
    func testCustomExponent(): Unit {
        let pri = RSAPrivateKey(512, BigInt(3))
        let pub = RSAPublicKey(pri)
        let _ = pub.encodeToDer()
    }
    @TestCase
    func testEncryptDecryptOAEP(): Unit {
        let pri = RSAPrivateKey(1024)
        let pub = RSAPublicKey(pri)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(toBytes("hello rsa!"))
        let opt = OAEPOption(SHA256(), SHA256())
        pub.encrypt(bas1, bas2, padType: OAEP(opt))
        pri.decrypt(bas2, bas3, padType: OAEP(opt))
        let buf = Array<Byte>(10, repeat: 0)
        bas3.read(buf)
        @Expect(String.fromUtf8(buf) == "hello rsa!")
    }
    @TestCase
    func testEncryptDecryptPkcs1(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(toBytes("hello rsa!"))
        pub.encrypt(bas1, bas2, padType: PKCS1)
        pri.decrypt(bas2, bas3, padType: PKCS1)
        let buf = Array<Byte>(10, repeat: 0)
        bas3.read(buf)
        @Expect(String.fromUtf8(buf) == "hello rsa!")
    }

    // --- wave2: exception / multi-block / OAEP label / wrong pad ---

    @TestCase
    func testBitsTooSmall(): Unit {
        try {
            let _ = RSAPrivateKey(256)
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testBitsTooLarge(): Unit {
        try {
            let _ = RSAPrivateKey(20000)
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testEvenExponent(): Unit {
        try {
            let _ = RSAPrivateKey(512, BigInt(4))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testExponentTooSmall(): Unit {
        try {
            let _ = RSAPrivateKey(512, BigInt(1))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testPssOptionNegative(): Unit {
        try {
            let _ = PSSOption(-1)
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testEncryptWithPssError(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        bas1.write(toBytes("x"))
        try {
            pub.encrypt(bas1, bas2, padType: PSS(PSSOption(0)))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testDecryptWithPssError(): Unit {
        let pri = RSAPrivateKey(512)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        bas1.write(toBytes("x"))
        try {
            pri.decrypt(bas1, bas2, padType: PSS(PSSOption(0)))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testVerifyWithOaepError(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let hash = SHA256()
        let md = digest(hash, "t")
        try {
            let _ = pub.verify(hash, md, Array<Byte>(64, repeat: 0), padType: OAEP(OAEPOption(SHA256(), SHA256())))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testOaepWithLabel(): Unit {
        let pri = RSAPrivateKey(1024)
        let pub = RSAPublicKey(pri)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(toBytes("labeled"))
        let opt = OAEPOption(SHA256(), SHA256(), label: "cov-label")
        pub.encrypt(bas1, bas2, padType: OAEP(opt))
        pri.decrypt(bas2, bas3, padType: OAEP(opt))
        let buf = Array<Byte>(7, repeat: 0)
        bas3.read(buf)
        @Expect(String.fromUtf8(buf) == "labeled")
    }

    @TestCase
    func testOaepKeyTooSmallForHash(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        bas1.write(toBytes("x"))
        // SHA512*2 + 2 > 64 bytes → blockSize < 0
        try {
            pub.encrypt(bas1, bas2, padType: OAEP(OAEPOption(SHA512(), SHA512())))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testPkcs1MultiBlock(): Unit {
        let pri = RSAPrivateKey(512)
        let pub = RSAPublicKey(pri)
        // 512-bit RSA → ~53-byte PKCS1 plaintext blocks; force multi-loop encrypt/decrypt
        let msg = "A" * 120
        let bas1 = ByteBuffer()
        let bas2 = ByteBuffer()
        let bas3 = ByteBuffer()
        bas1.write(toBytes(msg))
        pub.encrypt(bas1, bas2, padType: PKCS1)
        pri.decrypt(bas2, bas3, padType: PKCS1)
        let buf = Array<Byte>(msg.size, repeat: 0)
        bas3.read(buf)
        @Expect(String.fromUtf8(buf) == msg)
    }

    @TestCase
    func testSignSha384Sha512(): Unit {
        let pri = RSAPrivateKey(1024)
        let pub = RSAPublicKey(pri)
        let h384 = SHA384()
        let md384 = digest(h384, "wave2")
        let sig384 = pri.sign(h384, md384, padType: PKCS1)
        @Expect(pub.verify(h384, md384, sig384, padType: PKCS1))
        let h512 = SHA512()
        let md512 = digest(h512, "wave2")
        let sig512 = pri.sign(h512, md512, padType: PKCS1)
        @Expect(pub.verify(h512, md512, sig512, padType: PKCS1))
    }

    @TestCase
    func testPemEncodeNonePassword(): Unit {
        let pri = RSAPrivateKey(512)
        let pem = pri.encodeToPem(password: None)
        let _ = RSAPrivateKey.decodeFromPem(pem.encode(), password: None)
    }

    @TestCase
    func testDerDecodeNonePassword(): Unit {
        let pri = RSAPrivateKey(512)
        let der = pri.encodeToDer()
        let _ = RSAPrivateKey.decodeDer(der, password: None)
    }

    @TestCase
    func testGarbageDerPem(): Unit {
        try {
            let _ = RSAPrivateKey.decodeDer(DerBlob(Array<Byte>(8, repeat: 1)))
            @Expect(false)
        } catch (_: CryptoException) {}
        try {
            let _ = RSAPrivateKey.decodeFromPem("not-a-pem")
            @Expect(false)
        } catch (_: CryptoException) {}
        try {
            let _ = RSAPublicKey.decodeFromPem("also-bad")
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testWrongPasswordDecode(): Unit {
        let pri = RSAPrivateKey(512)
        let der = pri.encodeToDer(password: "right")
        try {
            let _ = RSAPrivateKey.decodeDer(der, password: "wrong")
            @Expect(false)
        } catch (_: CryptoException) {}
        let pem = pri.encodeToPem(password: "right")
        try {
            let _ = RSAPrivateKey.decodeFromPem(pem.encode(), password: "wrong")
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testEmptyPasswordEncode(): Unit {
        let pri = RSAPrivateKey(512)
        try {
            let _ = pri.encodeToDer(password: "")
            @Expect(false)
        } catch (_: CryptoException) {}
        try {
            let _ = pri.encodeToPem(password: "")
            @Expect(false)
        } catch (_: CryptoException) {}
    }
}
