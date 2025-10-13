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
import std.convert.*
import std.crypto.digest.*
import std.fs.*
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.digest.*
import std.io.*
import std.runtime.*

@Test
class Test_sm2 {
    let privateKey = """
-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqBHM9VAYItBHkwdwIBAQQg6SVUuMqUASOLMf3m
JALuaQaCVzNIjSr+cSxCXYn+5OagCgYIKoEcz1UBgi2hRANCAAR6ZOhlIs1E6LFE
jzQNcsiX+9KZvrq+aweZIoDQptdaO6imJsz+V0G0658Aay2Cd6fgU4tqtILjo4Wb
+GwU1uqI
-----END PRIVATE KEY-----
"""
    let publicKey = """
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEemToZSLNROixRI80DXLIl/vSmb66
vmsHmSKA0KbXWjuopibM/ldBtOufAGstgnen4FOLarSC46OFm/hsFNbqiA==
-----END PUBLIC KEY-----
"""

    @TestCase
    func test_sm2_encrypt_decrypt_fromGo(): Unit {
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKey)
        let str: String = "helloworld"
        let encresult = sm2Pub.encrypt(str.toArray())
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKey)
        let decresult = sm2Pri.decrypt(encresult)
        @Expect(String.fromUtf8(decresult), str)
        let strN: String = ""
        let encNresult = sm2Pub.encrypt(strN.toArray())
        let decNresult = sm2Pri.decrypt(encNresult)
        @Expect(String.fromUtf8(decNresult), strN)
    }

    @TestCase
    func test_sm2_encodeToDer(): Unit {
        var sum = 0
        try {
            let pri01 = SM2PrivateKey()
            let priDerNoEnc = pri01.encodeToDer()
            let file01: File = File("./files/sm2PriNoPa.der", Write)
            file01.write(priDerNoEnc.body)
            file01.close()
            let pub01 = SM2PublicKey(pri01)
            let pubDerNoEnc = pub01.encodeToDer()
            let file2: File = File("./files/sm2PubNoPa.der", Write)
            file2.write(pubDerNoEnc.body)
            file2.close()
            let priDerWithEnc = pri01.encodeToDer(password: "1234")
            let file03: File = File("./files/sm2PriWithPa.der", Write)
            file03.write(priDerWithEnc.body)
            file03.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_sm2_decodeToPem(): Unit {
        var sum = 0
        try {
            let pri01 = SM2PrivateKey()
            let priPemNoEnc = pri01.encodeToPem()
            let file01: File = File("./files/sm2PriNoPa.pem", Write)
            file01.write(priPemNoEnc.encode().toArray())
            file01.close()

            let pub01 = SM2PublicKey(pri01)
            let pubPemNoEnc = pub01.encodeToPem()
            let file2: File = File("./files/sm2PubNoPa.pem", Write)
            file2.write(pubPemNoEnc.encode().toArray())
            file2.close()

            let priPemWithEnc = pri01.encodeToPem(password: "1234")
            let file03: File = File("./files/sm2PriWithPa.pem", Write)
            file03.write(priPemWithEnc.encode().toArray())
            file03.close()
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_sm2_encodeFromDer(): Unit {
        var sum = 0
        let derPub = DerBlob(readToEnd(File("./files/sm2PubNoPa.der", Read)))
        let sm2Pub = SM2PublicKey.decodeDer(derPub)
        let str: String = "helloworld"
        let encresult = sm2Pub.encrypt(str.toArray())

        let derPri = DerBlob(readToEnd(File("./files/sm2PriNoPa.der", Read)))
        let sm2Pri = SM2PrivateKey.decodeDer(derPri)
        let decresult = sm2Pri.decrypt(encresult)
        @Expect(String.fromUtf8(decresult), str)
        try {
            sm2Pri.decrypt([1u8, 2u8, 3u8])
        } catch (e: Exception) {
            @Expect(e.message.contains("Decrypt prepare failed."))
            sum += 1
        }
        try {
            SM2PrivateKey.decodeDer(derPri, password: "1234")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted: wrong tag (168), nested asn1 error (266), nested asn1 error (266)"))
            sum += 1
        }
        let derPriWithPa = DerBlob(readToEnd(File("./files/sm2PriWithPa.der", Read)))
        let sm2PriWithPa = SM2PrivateKey.decodeDer(derPriWithPa, password: "1234")
        @Expect(String.fromUtf8(sm2PriWithPa.decrypt(encresult)), str)

        try {
            SM2PrivateKey.decodeDer(derPriWithPa, password: "123")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted: bad decrypt (100), pkcs12 cipherfinal error (116)"))
            sum += 1
        }
        try {
            SM2PrivateKey.decodeDer(derPriWithPa, password: "")
        } catch (e: Exception) {
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        try {
            SM2PrivateKey.decodeDer(derPriWithPa)
        } catch (e: Exception) {
            @Expect(e.message.contains("Load private key error"))
            sum += 1
        }
        @Expect(sum == 5)
    }

    @TestCase
    func test_sm2_encodeFromPem(): Unit {
        var sum = 0
        let pemPub = String.fromUtf8(readToEnd(File("./files/sm2PubNoPa.pem", Read)))
        let sm2Pub = SM2PublicKey.decodeFromPem(pemPub)
        let str: String = "helloworld"
        let encresult = sm2Pub.encrypt(str.toArray())
        let pemPri = String.fromUtf8(readToEnd(File("./files/sm2PriNoPa.pem", Read)))
        let sm2Pri = SM2PrivateKey.decodeFromPem(pemPri)
        let decresult = sm2Pri.decrypt(encresult)
        @Expect(String.fromUtf8(decresult), str)

        try {
            SM2PrivateKey.decodeFromPem("")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to parse PEM: Pem is empty."))
            sum += 1
        }

        try {
            SM2PrivateKey.decodeFromPem(pemPri, password: "1234")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted: wrong tag (168), nested asn1 error (266), nested asn1 error (266)"))
            sum += 1
        }
        let pemPriWithPa = String.fromUtf8(readToEnd(File("./files/sm2PriWithPa.pem", Read)))
        let sm2PriWithPa = SM2PrivateKey.decodeFromPem(pemPriWithPa, password: "1234")
        @Expect(String.fromUtf8(sm2PriWithPa.decrypt(encresult)), str)
        try {
            SM2PrivateKey.decodeFromPem(pemPriWithPa, password: "123")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted: bad decrypt (100), pkcs12 cipherfinal error (116)"))
            sum += 1
        }
        try {
            SM2PrivateKey.decodeFromPem(pemPriWithPa, password: "")
        } catch (e: Exception) {
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        try {
            SM2PrivateKey.decodeFromPem(pemPriWithPa)
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to load private key, no password specified for encrypted PKCS8 key"))
            sum += 1
        }
        @Expect(sum == 5)
    }

    @TestCase
    func test_sm2_sign(): Unit {
        let pemPri = String.fromUtf8(readToEnd(File("./files/sm2PriNoPa.pem", Read)))
        let sm2Pri = SM2PrivateKey.decodeFromPem(pemPri)
        let str: String = "helloworld"
        let signRe = sm2Pri.sign(str.toArray())
        let pemPub = String.fromUtf8(readToEnd(File("./files/sm2PubNoPa.pem", Read)))
        let sm2Pub = SM2PublicKey.decodeFromPem(pemPub)
        @Expect(sm2Pub.verify(str.toArray(), signRe))

        let strN: String = ""
        let signNRe = sm2Pri.sign(strN.toArray())
        @Expect(sm2Pub.verify(strN.toArray(), signNRe))

        let derPri = DerBlob(readToEnd(File("./files/sm2PriNoPa.der", Read)))
        let sm2Pri02 = SM2PrivateKey.decodeDer(derPri)
        let signRe02 = sm2Pri02.sign(str.toArray())
        let derPub02 = DerBlob(readToEnd(File("./files/sm2PubNoPa.der", Read)))
        let sm2Pub02 = SM2PublicKey.decodeDer(derPub02)
        @Expect(sm2Pub02.verify(str.toArray(), signRe02))
    }
    @TestCase
    func test_sm2_toString(): Unit {
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKey)
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKey)
        @Expect(sm2Pub.toString().contains("SM2 PUBLIC KEY"))
        @Expect(sm2Pri.toString().contains("SM2 PRIVATE KEY"))
    }
}
