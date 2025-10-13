/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: %run_stdx %n.%suffix %run_args
// (Windows and OHOS)RUN-EXEC: dos2unix "./data/end_rsa_private_key.pem" && dos2unix "./data/enc_pkcs8_end_rsa_private_key.der" &&  %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import std.sync.*
import std.runtime.*
import std.collection.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.{DerBlob, PemEntry, Pem, PrivateKey, CryptoException}
import stdx.crypto.keys.*

var sum = 0
@When[os != "Windows"]
let pemDatatest = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
@When[os == "Windows"]
let pemDatatest = String.fromUtf8(File.readFrom("./data/end_rsa_private_key_win.pem"))

@Test
class Test_tlsprivatekey_pwd_06 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //der format of privatekey with password using encodeToPem() without password and then decode with pwd.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        let pemData1 = derPriKey.encodeToPem()
        @Expect(Pem(pemData1).encode(), pemDatatest)
        let pemPriKey1 = GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:None)
        @Expect(pemPriKey1.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_02(): Unit {
        //der format of privatekey with password using encodeToPem() with pwd None and then decode with pwd.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        let pemData1 = derPriKey.encodeToPem(password: None)
        @Expect(Pem(pemData1).encode(), pemDatatest)
        let pemPriKey1 = GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:None)
        @Expect(pemPriKey1.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_03(): Unit {
        //der format of privatekey with pwd using encodeToPem() with password "".
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        try {
            derPriKey.encodeToPem(password: "")
        } catch (e:CryptoException){
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        //der format of privatekey with pwd using encodeToPem() with password "\0".
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
        try {
            derPriKey.encodeToPem(password: "\0")
        } catch (e:CryptoException){
            @Expect(e.message.contains("Password shouldn't contain zero byte"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_05(): Unit {
        //der format of privatekey with password using encodeToPem() with password "\\" and then decode with correct pwd.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        let pemData1 = derPriKey.encodeToPem(password: "\\")
        let pemPriKey1 = GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:"\\")
        @Expect(pemPriKey1.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_06(): Unit {
        //der format of privatekey with password using encodeToPem() with password "\\" and then decode with error pwd.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        let pemData1 = derPriKey.encodeToPem(password: "\\")
        try {
            GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:"456")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //der format of privatekey with password using encodeToPem() with password "#" and then decode with error pwd.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        let pemData1 = derPriKey.encodeToPem(password: "#")
        try {
            GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:"$")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_08(): Unit {
        //der format of privatekey with password using encodeToPem() with password "abc" and then decode with error pwd.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        let pemData1 = derPriKey.encodeToPem(password: "abc")
        try {
            GeneralPrivateKey.decodeFromPem(Pem(pemData1).encode(), password:"abe")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
