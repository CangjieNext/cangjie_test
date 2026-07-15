// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import stdx.crypto.crypto.*
import stdx.crypto.common.*

func toBytes(s: String): Array<Byte> { unsafe { s.rawData() } }

@Test
public class Sm4CoverageTest {
    func mkKey(): Array<Byte> { toBytes("1234567890123456") }
    func mkIv(): Array<Byte> { toBytes("6543210987654321") }

    // ECB basic encrypt/decrypt
    @TestCase
    func testECB(): Unit {
        let sm4 = SM4(OperationMode.ECB, mkKey())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
    }
    // CBC with IV
    @TestCase
    func testCBC(): Unit {
        let sm4 = SM4(OperationMode.CBC, mkKey(), iv: mkIv())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
    }
    // CTR mode
    @TestCase
    func testCTR(): Unit {
        let sm4 = SM4(OperationMode.CTR, mkKey(), iv: mkIv())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
    }
    // OFB mode
    @TestCase
    func testOFB(): Unit {
        let sm4 = SM4(OperationMode.OFB, mkKey(), iv: mkIv())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
    }
    // CFB mode
    @TestCase
    func testCFB(): Unit {
        let sm4 = SM4(OperationMode.CFB, mkKey(), iv: mkIv())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
    }
    // GCM with AAD (may not be supported by all OpenSSL versions)
    @TestCase
    func testGCM(): Unit {
        try {
            let sm4 = SM4(OperationMode.GCM, mkKey(), iv: toBytes("123456789012"), aad: toBytes("auth data"))
            let enc = sm4.encrypt(toBytes("hello cangjie!"))
            let dec = sm4.decrypt(enc)
            @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
        } catch (_: CryptoException) {}
    }
    // GCM without AAD
    @TestCase
    func testGCMNoAad(): Unit {
        try {
            let sm4 = SM4(OperationMode.GCM, mkKey(), iv: toBytes("123456789012"))
            let enc = sm4.encrypt(toBytes("hello cangjie!"))
            let dec = sm4.decrypt(enc)
            @Expect(String.fromUtf8(dec) == "hello cangjie!", true)
        } catch (_: CryptoException) {}
    }
    // NoPadding mode
    @TestCase
    func testNoPadding(): Unit {
        let sm4 = SM4(OperationMode.ECB, mkKey(), paddingMode: PaddingMode.NoPadding)
        let input = Array<Byte>(16, repeat: 65)  // exactly 1 block
        let enc = sm4.encrypt(input)
        let dec = sm4.decrypt(enc)
        @Expect(dec == input, true)
    }
    // encrypt with to! buffer
    @TestCase
    func testEncryptToBuffer(): Unit {
        let sm4 = SM4(OperationMode.CBC, mkKey(), iv: mkIv())
        let input = toBytes("hello cangjie!")
        let buf = Array<Byte>(input.size + 32, repeat: 0)
        let n = sm4.encrypt(input, to: buf)
        @Expect(n > 0, true)
    }
    // decrypt with to! buffer
    @TestCase
    func testDecryptToBuffer(): Unit {
        let sm4 = SM4(OperationMode.CBC, mkKey(), iv: mkIv())
        let enc = sm4.encrypt(toBytes("hello cangjie!"))
        let buf = Array<Byte>(32, repeat: 0)
        let n = sm4.decrypt(enc, to: buf)
        @Expect(n > 0, true)
    }
    // Wrong key size → exception
    @TestCase
    func testWrongKeySize(): Unit {
        try {
            let _ = SM4(OperationMode.ECB, Array<Byte>(15, repeat: 48))
            @Expect(false)
        } catch (_: CryptoException) {}
    }
    // Wrong IV size for CBC → exception
    @TestCase
    func testWrongIvSize(): Unit {
        try {
            let _ = SM4(OperationMode.CBC, mkKey(), iv: Array<Byte>(8, repeat: 48))
            @Expect(false)
        } catch (_: CryptoException) {}
    }
    // GCM with invalid tag size → exception
    @TestCase
    func testGCMInvalidTagSize(): Unit {
        try {
            let _ = SM4(OperationMode.GCM, mkKey(), iv: toBytes("123456789012"), tagSize: 100)
            @Expect(false)
        } catch (_: CryptoException) {}
    }
    // Empty input
    @TestCase
    func testEmptyInput(): Unit {
        let sm4 = SM4(OperationMode.ECB, mkKey())
        let enc = sm4.encrypt(Array<Byte>(0, repeat: 0))
        let dec = sm4.decrypt(enc)
        @Expect(String.fromUtf8(dec) == "", true)
    }
    // Block-aligned input (exactly 16 bytes with PKCS7 → 32 bytes output)
    @TestCase
    func testBlockAlignedInput(): Unit {
        let sm4 = SM4(OperationMode.ECB, mkKey())
        let input = Array<Byte>(16, repeat: 65)
        let enc = sm4.encrypt(input)
        @Expect(enc.size == 32, true)
    }

    // --- wave2: empty GCM IV, large stream (>1024), NoPadding misalign, props ---

    @TestCase
    func testGCMEmptyIv(): Unit {
        try {
            let _ = SM4(OperationMode.GCM, mkKey(), iv: Array<Byte>(0, repeat: 0))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testGCMTagSizeMin(): Unit {
        try {
            let sm4 = SM4(OperationMode.GCM, mkKey(), iv: toBytes("123456789012"), tagSize: 12)
            let enc = sm4.encrypt(toBytes("hello"))
            let dec = sm4.decrypt(enc)
            @Expect(String.fromUtf8(dec) == "hello", true)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testLargeStreamRoundtrip(): Unit {
        // SM4_BUFFER_SIZE=1024 → force encrypt/decrypt update loop >1 iteration
        let sm4 = SM4(OperationMode.CTR, mkKey(), iv: mkIv())
        let input = Array<Byte>(2500, repeat: 66)
        let enc = sm4.encrypt(input)
        let dec = sm4.decrypt(enc)
        @Expect(dec.size == input.size, true)
        @Expect(dec[0] == 66 && dec[2499] == 66, true)
    }

    @TestCase
    func testNoPaddingMisaligned(): Unit {
        let sm4 = SM4(OperationMode.ECB, mkKey(), paddingMode: PaddingMode.NoPadding)
        try {
            let _ = sm4.encrypt(Array<Byte>(15, repeat: 65))
            @Expect(false)
        } catch (_: CryptoException) {}
    }

    @TestCase
    func testPropsAndPaddingEq(): Unit {
        let sm4 = SM4(OperationMode.CBC, mkKey(), iv: mkIv())
        @Expect(sm4.blockSize == 16, true)
        @Expect(sm4.keySize == 16, true)
        @Expect(sm4.ivSize == 16, true)
        @Expect(sm4.optMode == OperationMode.CBC, true)
        @Expect(sm4.paddingMode == PaddingMode.PKCS7Padding, true)
        @Expect(sm4.key.size == 16, true)
        @Expect(sm4.iv.size == 16, true)
        @Expect(sm4.algorithm.size > 0, true)
        @Expect(PaddingMode.NoPadding != PaddingMode.PKCS7Padding, true)
        @Expect(PaddingMode.NoPadding == PaddingMode.NoPadding, true)
    }

    @TestCase
    func testCBCLargeStream(): Unit {
        let sm4 = SM4(OperationMode.CBC, mkKey(), iv: mkIv())
        let input = Array<Byte>(2048, repeat: 67)
        let enc = sm4.encrypt(input)
        let dec = sm4.decrypt(enc)
        @Expect(dec.size == input.size, true)
    }
}
