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
import stdx.crypto.x509.{X509Certificate, PrivateKey, X509Exception}

var sum = 0 

@Test
class Test_tlsprivatekey_pwd_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        //pem format of privatekey without password.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let pemPriKey = PrivateKey.decodeFromPem(pemData)
        @Expect(pemPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_02(): Unit {
        //pem format of privatekey without password using None.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        let pemPriKey = PrivateKey.decodeFromPem(pemData, password:None)
        @Expect(pemPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_03(): Unit {
        //pem format of privatekey without password using "".
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"")
        } catch (e:X509Exception) {
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        //pem format of privatekey without password using "\0".
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"\0")
        } catch (e:X509Exception) {
            @Expect(e.message.contains("Password shouldn't contain zero byte"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_05(): Unit {
        //pem format of privatekey without password using error String.
        let pemData = String.fromUtf8(File.readFrom("./data/end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"#$%abc123")
        } catch (e:X509Exception) {
            @Expect(e.message.contains("Failed to load private key"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_06(): Unit {
        //pem format of privatekey with password using correct password.
        let pemData = String.fromUtf8(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        let pemPriKey = PrivateKey.decodeFromPem(pemData, password:"456")
        @Expect(pemPriKey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_07(): Unit {
        //pem format of privatekey with password using error password.
        let pemData = String.fromUtf8(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"123")
        } catch (e:X509Exception){
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum , 1)
    }

    @TestCase
    func test_08(): Unit {
        //pem format of privatekey with password using "".
        let pemData = String.fromUtf8(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"")
        } catch (e:X509Exception){
            @Expect(e.message.contains("Password shouldn't be empty"))
            sum += 1
        }
        @Expect(sum , 1)
    }

    @TestCase
    func test_09(): Unit {
        //pem format of privatekey with password using "\0".
        let pemData = String.fromUtf8(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"\0")
        } catch (e:X509Exception){
            @Expect(e.message.contains("Password shouldn't contain zero byte"))
            sum += 1
        }
        @Expect(sum , 1)
    }

    @TestCase
    func test_10(): Unit {
        //pem format of privatekey with password using "\0".
        let pemData = String.fromUtf8(File.readFrom("./data/enc_pkcs8_end_rsa_private_key.pem"))
        try {
            PrivateKey.decodeFromPem(pemData, password:"#$abc123")
        } catch (e:X509Exception){
            @Expect(e.message.contains("Failed to load private key, the password is incorrect or the key is corrupted"))
            sum += 1
        }
        @Expect(sum , 1)
    }
}
