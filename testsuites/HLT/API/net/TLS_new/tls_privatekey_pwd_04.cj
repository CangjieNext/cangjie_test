/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

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

@Test
class Test_tlsprivatekey_pwd_04 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //der format of privatekey password using correct pwd to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        let derPriKey = GeneralPrivateKey.decodeDer(derData, password:"123")
        @Expect(derPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_02(): Unit {
        //der format of privatekey with password using None to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        try {
            GeneralPrivateKey.decodeDer(derData, password:None)
        }catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, no password specified for encrypted PKCS8 key"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_03(): Unit {
        //der format of privatekey with password using "" to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        //der format of privatekey with password using "\0" to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"\0")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Password shouldn't contain zero byte"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_05(): Unit {
        //der format of privatekey with password using "#$" to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"#$")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_06(): Unit {
        //der format of privatekey with password using "456" to decode.
        let derData = DerBlob(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.der"))
        @Expect(derData.size, 1905)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"456")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //der format of privatekey without password using "456" to decode.
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"456")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_08(): Unit {
        //der format of privatekey without password using "" to decode.
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_09(): Unit {
        //der format of privatekey without password using "\0" to decode.
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"\0")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Password shouldn't contain zero byte"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_10(): Unit {
        //der format of privatekey without password using "#$" to decode.
        let derData = DerBlob(File.readFrom("./data/end_rsa_private_key.der"))
        @Expect(derData.size, 1768)
        try {
            GeneralPrivateKey.decodeDer(derData, password:"#$")
        } catch (e:CryptoException) {
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
