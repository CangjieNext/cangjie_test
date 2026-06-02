/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*

@Test
class PrivateKeyEncryptionTest {
    @TestCase[k in random()]
    func garbagePlainInput(k: Array<Byte>): Unit {
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeDer(DerBlob(k))
        }
    }

    @TestCase[k in random()]
    func garbageEncryptedInput(k: Array<Byte>): Unit {
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeDer(DerBlob(k), password: "ok")
        }
    }

    @TestCase
    func plainPrivateKey(): Unit {
        checkKey(GeneralPrivateKey.decodeFromPem(PLAIN_PRIVATE_KEY))
    }

    @TestCase
    func encryptedPrivateKeyWithoutPassword(): Unit {
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeFromPem(ENCRYPTED_PRIVATE_KEY)
        }
    }

    @TestCase
    func encryptedPrivateKeyEmptyPassword(): Unit {
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeFromPem(ENCRYPTED_PRIVATE_KEY, password: "")
        }
    }

    @TestCase[pass in random()]
    func encryptedPrivateKeyWrongPassword(pass: String): Unit {
        if (pass == "123") {
            return
        } // skip the correct one
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeFromPem(ENCRYPTED_PRIVATE_KEY, password: pass)
        }
    }

    @TestCase
    func encryptedPrivateKeyCorrectPassword(): Unit {
        checkKey(GeneralPrivateKey.decodeFromPem(ENCRYPTED_PRIVATE_KEY, password: "123"))
    }

    @TestCase
    func encryptPrivateKey(): Unit {
        let key = GeneralPrivateKey.decodeFromPem(PLAIN_PRIVATE_KEY)

        let encrypted = key.encodeToPem(password: "456")

        @Expect(encrypted.label == PemEntry.LABEL_ENCRYPTED_PRIVATE_KEY)
        @Expect(encrypted.body.getOrThrow() != key.encodeToDer())

        assertFailsWith<CryptoException> {
            // we can't just decode it without password: it's actually encrypted
            GeneralPrivateKey.decodeDer(encrypted.body.getOrThrow())
        }
        assertFailsWith<CryptoException> {
            // we can't use wrong password to decode it
            GeneralPrivateKey.decodeDer(encrypted.body.getOrThrow(), password: "123")
        }

        let decrypted = GeneralPrivateKey.decodeDer(encrypted.body.getOrThrow(), password: "456")
        @Expect(decrypted.encodeToDer() == key.encodeToDer())
    }

    @TestCase
    func encryptPrivateKeyToDer(): Unit {
        let key = GeneralPrivateKey.decodeFromPem(PLAIN_PRIVATE_KEY)

        let encrypted = key.encodeToDer(password: "456")

        @Expect(encrypted != key.encodeToDer())

        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeDer(encrypted)
        }
        assertFailsWith<CryptoException> {
            GeneralPrivateKey.decodeDer(encrypted, password: "123")
        }

        let decrypted = GeneralPrivateKey.decodeDer(encrypted, password: "456")
        @Expect(decrypted.encodeToDer() == key.encodeToDer())
    }

    @TestCase
    func encryptPrivateKeyEmptyPassword(): Unit {
        let key = GeneralPrivateKey.decodeFromPem(PLAIN_PRIVATE_KEY)

        assertFailsWith<CryptoException> {
            key.encodeToDer(password: "")
        }
    }

    private func checkKey(key: PrivateKey): Unit {
        GeneralPrivateKey.decodeDer(key.encodeToDer())

        @Expect(key.toString() == "PrivateKey(185 bytes, EC 384 bits)")
        @Expect(key.encodeToPem().encode() == PLAIN_PRIVATE_KEY.replace("    ", ""))
    }

    private static func assertFailsWith<T>(block: () -> Unit): T where T <: Exception {
        try {
            block()
            @Assert("This block expected to fail but it did succeed" == "")
            throw Exception("This block expected to fail but iut did succeed")
        } catch (expected: T) {
            return expected
        }
    }

    // the same key plain and encrypted form
    private static let PLAIN_PRIVATE_KEY = """
    -----BEGIN PRIVATE KEY-----
    MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDCiuYwiEZpbCvdZgaYt
    YVz9crBcEo86QjnozHGF0oOhU2F8oH9BDl/vrySAoAEwoqKhZANiAARcSFyoZHo/
    1SpJrSUEcFC/ROVkL0canskjUuwWCXP4o6GbcjtiZoMg32KRY6TjebpQbz86+7HP
    2kWliYUPsymFGREx+WsR8692/6gCZKbQAGS64dEkO79X89z+4VgPVrk=
    -----END PRIVATE KEY-----
    """

    private static let ENCRYPTED_PRIVATE_KEY = """
    -----BEGIN ENCRYPTED PRIVATE KEY-----
    MIIBHDBXBgkqhkiG9w0BBQ0wSjApBgkqhkiG9w0BBQwwHAQIMtMUlVoUfKcCAggA
    MAwGCCqGSIb3DQIJBQAwHQYJYIZIAWUDBAEqBBATaECbkEv3Y2WWiyc3BnzXBIHA
    NayZGXnj4ejVMUjOMcsJ+/rb55cNq+AqJ4u+j7j9c81ZHsJZK1V8y0HAxPIbLzw/
    ECUXGpdOTA3RV96rUifKNq5KfpAFBAKLVRneUEuPpH5ihw2YHCEA2Y2uaojg2MkR
    EJjKXmIGGKe47VFEl2B5r7pxSFJ6L48y9SDyt90XKui/8Kphj443P6aZd8iuxTD2
    0Cbq/1bWwM0KHUcV8qjh/S5y+ydLmn5jenzjWTfnU93Bgjjnb801nsCi/BXNv4Up
    -----END ENCRYPTED PRIVATE KEY-----
    """
}
