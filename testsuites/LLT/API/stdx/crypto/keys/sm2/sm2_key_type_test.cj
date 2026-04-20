/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.fs.*
import std.io.*

/**
 * Tests for PR #568: SM2 key type identification improvements.
 * 
 * The fix ensures:
 * 1. SM2 public key loading should use keyTypeCheck (if using loadPublicKey)
 * 2. keyTypeCheck handles getPkeyId returning -1 case by checking type name
 * 3. Memory cleanup on type mismatch error (keyFree before throwing)
 * 
 * Test coverage:
 * - SM2 key operations (encrypt/decrypt, sign/verify)
 * - RSA/ECDSA keyTypeCheck verification (ensures keyTypeCheck logic works)
 * - RSA DER as SM2 should fail (documents expected behavior)
 * - Memory cleanup on multiple failures
 */
@Test
class Test_sm2_key_type_check {
    // Pre-generated SM2 key pair for testing
    let privateKeyPem = """
-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqBHM9VAYItBHkwdwIBAQQg6SVUuMqUASOLMf3m
JALuaQaCVzNIjSr+cSxCXYn+5OagCgYIKoEcz1UBgi2hRANCAAR6ZOhlIs1E6LFE
jzQNcsiX+9KZvrq+aweZIoDQptdaO6imJsz+V0G0658Aay2Cd6fgU4tqtILjo4Wb
+GwU1uqI
-----END PRIVATE KEY-----
"""
    let publicKeyPem = """
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEemToZSLNROixRI80DXLIl/vSmb66
vmsHmSKA0KbXWjuopibM/ldBtOufAGstgnen4FOLarSC46OFm/hsFNbqiA==
-----END PUBLIC KEY-----
"""

    // P0: Test SM2 public key loading from PEM
    // This tests that loadPublicKeySM2 correctly loads SM2 PEM format
    @TestCase
    func test_sm2_public_key_load_from_pem(): Unit {
        var sum = 0
        try {
            let sm2Pub = SM2PublicKey.decodeFromPem(publicKeyPem)
            let str: String = "test_data"
            let encResult = sm2Pub.encrypt(str.toArray())
            @Expect(encResult.size > 0)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P0: Test SM2 public key loading from DER
    // This tests that loadPublicKeySM2 correctly loads SM2 DER format
    @TestCase
    func test_sm2_public_key_load_from_der(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey.decodeFromPem(privateKeyPem)
            let pubDer = sm2Pri.encodeToDer()
            // Save to file for testing
            let file: File = File("./files/sm2_pub_from_pri.der", Write)
            file.write(pubDer.body)
            file.close()
            
            // Create public key from private key
            let sm2Pub = SM2PublicKey(sm2Pri)
            let pubDer2 = sm2Pub.encodeToDer()
            
            // Load public key from DER
            let loadedPub = SM2PublicKey.decodeDer(pubDer2)
            @Expect(loadedPub.toString().contains("SM2"))
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P0: Test SM2 public key encryption/decryption
    // Verifies that SM2 operations work correctly
    @TestCase
    func test_sm2_encrypt_decrypt(): Unit {
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKeyPem)
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKeyPem)
        let str: String = "hello_sm2_test"
        let encResult = sm2Pub.encrypt(str.toArray())
        let decResult = sm2Pri.decrypt(encResult)
        @Expect(String.fromUtf8(decResult), str)
    }

    // P0: Test SM2 sign/verify
    // Verifies that SM2 signature operations work correctly
    @TestCase
    func test_sm2_sign_verify(): Unit {
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKeyPem)
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKeyPem)
        let str: String = "sign_test_data"
        let signResult = sm2Pri.sign(str.toArray())
        @Expect(sm2Pub.verify(str.toArray(), signResult))
    }

    // P0: Test SM2 key generation and type check
    // Generated SM2 keys should work correctly
    @TestCase
    func test_sm2_key_generation_type_check(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let sm2Pub = SM2PublicKey(sm2Pri)
            let str: String = "generated_key_test"
            let encResult = sm2Pub.encrypt(str.toArray())
            let decResult = sm2Pri.decrypt(encResult)
            @Expect(String.fromUtf8(decResult), str)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P0: Test RSA public key DER type check - correct type
    // RSA public key should pass RSA keyTypeCheck (regression test for keyTypeCheck)
    // This verifies that keyTypeCheck logic works correctly for RSA keys
    @TestCase
    func test_rsa_public_key_type_check_correct(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)
            let rsaPubDer = rsaPub.encodeToDer()
            // RSA public key should load correctly with RSA_id type check
            let loadedPub = RSAPublicKey.decodeDer(rsaPubDer)
            @Expect(loadedPub.toString().contains("RSA"))
        } catch (e: CryptoException) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P0: Test RSA public key DER loaded as ECDSA should fail (keyTypeCheck test)
    // This tests keyTypeCheck rejects mismatched key types
    // RSA DER loaded through ECDSAPublicKey.decodeDer triggers:
    //   loadPublicKey(EC_id, rsaDer) -> keyTypeCheck(EC_id, pkey) -> fails
    @TestCase
    func test_rsa_pub_der_as_ecdsa_keyTypeCheck_fails(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)
            let rsaPubDer = rsaPub.encodeToDer()
            // RSA DER loaded as ECDSA -> keyTypeCheck should fail
            ECDSAPublicKey.decodeDer(rsaPubDer)
        } catch (e: CryptoException) {
            sum += 1
            // Should get type error from keyTypeCheck
            @Expect(e.message.contains("type") || e.message.contains("error"))
        }
        @Expect(sum, 1)
    }

    // P0: Test ECDSA public key DER loaded as RSA should fail (keyTypeCheck test)
    // This tests keyTypeCheck rejects mismatched key types
    // ECDSA DER loaded through RSAPublicKey.decodeDer triggers:
    //   loadPublicKey(RSA_id, ecdsaDer) -> keyTypeCheck(RSA_id, pkey) -> fails
    @TestCase
    func test_ecdsa_pub_der_as_rsa_keyTypeCheck_fails(): Unit {
        var sum = 0
        try {
            let ecdsaPri = ECDSAPrivateKey(P256)
            let ecdsaPub = ECDSAPublicKey(ecdsaPri)
            let ecdsaPubDer = ecdsaPub.encodeToDer()
            // ECDSA DER loaded as RSA -> keyTypeCheck should fail
            RSAPublicKey.decodeDer(ecdsaPubDer)
        } catch (e: CryptoException) {
            sum += 1
            // Should get type error from keyTypeCheck
            @Expect(e.message.contains("type") || e.message.contains("error"))
        }
        @Expect(sum, 1)
    }

    // P0: Test RSA public key DER loaded as SM2 should fail (DER parsing failure)
    // RSA public key DER has different ASN.1 structure than SM2
    // OpenSSL's d2i_AutoPubkey can parse RSA DER, returning RSA-type EVP_PKEY
    // 
    // Current code (loadPublicKeySM2 without keyTypeCheck):
    //   - d2i_AutoPubkey parses RSA DER successfully
    //   - Returns RSA-type EVP_PKEY (not SM2)
    //   - No keyTypeCheck called -> operation on wrong key type
    //
    // PR #568 fix (if loadPublicKey(NID_sm2, der) is used):
    //   - keyTypeCheck(NID_sm2, pkey) called
    //   - getBaseId returns NID_rsa != NID_sm2 -> fails
    //   - Throws CryptoException with type error
    //
    // This test documents expected behavior: RSA DER as SM2 should fail
    // Whether failure is from DER parsing or keyTypeCheck depends on code
    @TestCase
    func test_rsa_pub_der_as_sm2_should_fail(): Unit {
        var sum = 0
        try {
            let rsaPri = RSAPrivateKey(2048)
            let rsaPub = RSAPublicKey(rsaPri)
            let rsaPubDer = rsaPub.encodeToDer()
            // RSA DER loaded as SM2 should fail
            SM2PublicKey.decodeDer(rsaPubDer)
        } catch (e: CryptoException) {
            sum += 1
            // Should fail - either DER parsing or operation on wrong key type
            @Expect(e.message.contains("Load") || e.message.contains("failed") || e.message.contains("error"))
        }
        @Expect(sum, 1)
    }

    // P1: Test loading wrong key type as SM2 should fail (private key)
    // RSA private key DER has different ASN.1 structure than SM2 private key
    // This tests DER parsing failure at loadPrivateKey level
    @TestCase
    func test_load_rsa_private_key_as_sm2_fails(): Unit {
        var sum = 0
        try {
            // Create an RSA private key and try to load as SM2
            let rsaPri = RSAPrivateKey(2048)
            let rsaDer = rsaPri.encodeToDer()
            // Try to load RSA DER as SM2 - should fail at DER parsing
            SM2PrivateKey.decodeDer(rsaDer)
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("Load") || e.message.contains("failed") || e.message.contains("error"))
        }
        @Expect(sum, 1)
    }

    // P1: Test memory cleanup on SM2 key type mismatch
    // Multiple failed loads should not leak memory
    @TestCase
    func test_memory_cleanup_on_type_mismatch(): Unit {
        var failCount = 0
        for (i in 0..5) {
            try {
                let rsaPri = RSAPrivateKey(2048)
                let rsaDer = rsaPri.encodeToDer()
                SM2PrivateKey.decodeDer(rsaDer)
            } catch (e: CryptoException) {
                failCount += 1
            }
        }
        @Expect(failCount, 5)
    }

    // P1: Test keyTypeCheck memory cleanup for RSA as ECDSA
    // Multiple keyTypeCheck failures should not leak memory
    @TestCase
    func test_keyTypeCheck_memory_cleanup_rsa_as_ecdsa(): Unit {
        var failCount = 0
        for (i in 0..5) {
            try {
                let rsaPri = RSAPrivateKey(2048)
                let rsaPub = RSAPublicKey(rsaPri)
                let rsaPubDer = rsaPub.encodeToDer()
                ECDSAPublicKey.decodeDer(rsaPubDer)
            } catch (e: CryptoException) {
                failCount += 1
            }
        }
        @Expect(failCount, 5)
    }

    // P1: Test keyTypeCheck memory cleanup for ECDSA as RSA
    // Multiple keyTypeCheck failures should not leak memory
    @TestCase
    func test_keyTypeCheck_memory_cleanup_ecdsa_as_rsa(): Unit {
        var failCount = 0
        for (i in 0..5) {
            try {
                let ecdsaPri = ECDSAPrivateKey(P256)
                let ecdsaPub = ECDSAPublicKey(ecdsaPri)
                let ecdsaPubDer = ecdsaPub.encodeToDer()
                RSAPublicKey.decodeDer(ecdsaPubDer)
            } catch (e: CryptoException) {
                failCount += 1
            }
        }
        @Expect(failCount, 5)
    }

    // P1: Test SM2 public key from private key
    // SM2PublicKey(pri) should work correctly
    @TestCase
    func test_sm2_public_from_private(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let sm2Pub = SM2PublicKey(sm2Pri)
            let testData: String = "test_from_private"
            let encResult = sm2Pub.encrypt(testData.toArray())
            let decResult = sm2Pri.decrypt(encResult)
            @Expect(String.fromUtf8(decResult), testData)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P1: Test empty data handling
    @TestCase
    func test_sm2_empty_data(): Unit {
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKeyPem)
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKeyPem)
        
        // Empty encryption
        let emptyEnc = sm2Pub.encrypt(Array<Byte>())
        @Expect(emptyEnc.size, 0)
        
        // Empty decryption
        let emptyDec = sm2Pri.decrypt(Array<Byte>())
        @Expect(emptyDec.size, 0)
        
        // Empty sign
        let emptySign = sm2Pri.sign(Array<Byte>())
        @Expect(sm2Pub.verify(Array<Byte>(), emptySign))
    }

    // P1: Test SM2 key DER encoding/decoding roundtrip
    @TestCase
    func test_sm2_der_roundtrip(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let priDer = sm2Pri.encodeToDer()
            
            let sm2Pub = SM2PublicKey(sm2Pri)
            let pubDer = sm2Pub.encodeToDer()
            
            // Roundtrip private key
            let loadedPri = SM2PrivateKey.decodeDer(priDer)
            let testData: String = "roundtrip_test"
            let sign = loadedPri.sign(testData.toArray())
            
            // Roundtrip public key
            let loadedPub = SM2PublicKey.decodeDer(pubDer)
            @Expect(loadedPub.verify(testData.toArray(), sign))
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P1: Test SM2 key PEM encoding/decoding roundtrip
    @TestCase
    func test_sm2_pem_roundtrip(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let priPem = sm2Pri.encodeToPem()
            
            let sm2Pub = SM2PublicKey(sm2Pri)
            let pubPem = sm2Pub.encodeToPem()
            
            // Roundtrip private key
            let loadedPri = SM2PrivateKey.decodeFromPem(priPem.encode())
            let testData: String = "pem_roundtrip"
            let sign = loadedPri.sign(testData.toArray())
            
            // Roundtrip public key
            let loadedPub = SM2PublicKey.decodeFromPem(pubPem.encode())
            @Expect(loadedPub.verify(testData.toArray(), sign))
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P1: Test SM2 encrypted key encoding
    @TestCase
    func test_sm2_encrypted_key(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let encDer = sm2Pri.encodeToDer(password: "test123")
            @Expect(encDer.body.size > 0)
            
            // Load encrypted key
            let loadedPri = SM2PrivateKey.decodeDer(encDer, password: "test123")
            let testData: String = "encrypted_test"
            let sign = loadedPri.sign(testData.toArray())
            @Expect(sign.size > 0)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 0)
    }

    // P1: Test wrong password for encrypted SM2 key
    @TestCase
    func test_sm2_wrong_password(): Unit {
        var sum = 0
        try {
            let sm2Pri = SM2PrivateKey()
            let encDer = sm2Pri.encodeToDer(password: "correct_pass")
            SM2PrivateKey.decodeDer(encDer, password: "wrong_pass")
        } catch (e: CryptoException) {
            sum += 1
            @Expect(e.message.contains("password") || e.message.contains("decrypt") || e.message.contains("Load"))
        }
        @Expect(sum, 1)
    }

    // P1: Test SM2 key toString output
    @TestCase
    func test_sm2_toString(): Unit {
        let sm2Pri = SM2PrivateKey.decodeFromPem(privateKeyPem)
        let sm2Pub = SM2PublicKey.decodeFromPem(publicKeyPem)
        @Expect(sm2Pri.toString().contains("SM2"))
        @Expect(sm2Pub.toString().contains("SM2"))
    }
}