/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 // EXEC:  %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import stdx.crypto.digest.*
import stdx.encoding.hex.*
import std.time.*
import std.convert.*
import std.crypto.digest.*

@Test
class HMACTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message == expectMessage) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: init、write、finish reset Combined use for digest encryption
     * Test API:
     * public init(key: Array<Byte>, algorithm: HashType)
     */
    @TestCase
    func testInit(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "cangjie".toArray()
        HMAC(key, algorithm)
        HMAC(key, {=> MD5()})
        @Expect(true)
    }

    @TestCase
    func testHashTypeOperator(): Unit {
        @Expect(HashType.SHA512, HashType.SHA512)
        @Expect(HashType.SHA512 != HashType.SM3)
    }

    @TestCase
    func testInvlidInit(): Unit {
        var caseException01: ?Exception = None
        try {
            var key: Array<UInt8> = "cangjie".toArray()
            HMAC(key, {=>TextDigest01()} )
        } catch (e: CryptoException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvlidInit_01",
            caseException01,
            "This hash is not supported."
        )
        var caseException02: ?Exception = None
        try {
            var algorithm: HashType = HashType.SHA512
            var key: Array<UInt8> = "".toArray()
            HMAC(key, algorithm)
        } catch (e: CryptoException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvlidInit_02",
            caseException02,
            "The key cannot be empty."
        )
        var caseException03: ?Exception = None
        try {
            var key: Array<UInt8> = "".toArray()
            HMAC(key, {=> SHA512()})
        } catch (e: CryptoException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvlidInit_02",
            caseException03,
            "The key cannot be empty."
        )
    }

    /*
     * Test API:
     * public prop size: Int64
     * public prop blockSize: Int64
     */
    @TestCase
    func testSizeAndBlockSize(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "cangjie".toArray()
        var hmac = HMAC(key, algorithm)
        @Expect(hmac.size, 64)
        @Expect(hmac.blockSize, 128)
    }

    /*
     * Test API:
     * public func write(buffer: Array<Byte>): Unit
     * public func finish(): Array<Byte>
     */
    @TestCase
    func testWriteAndFinish(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "cangjie".toArray()
        var data1: Array<UInt8> = "123".toArray()
        var data2: Array<UInt8> = "456".toArray()
        var data3: Array<UInt8> = "789".toArray()
        var hmac1 = HMAC(key, algorithm)
        hmac1.write(data1)
        hmac1.write(data2)
        hmac1.write(data3)
        var md1: Array<Byte> = hmac1.finish()
        @Expect(md1.size, 64)
        @Expect(toHexString(md1), "2bafeb53b60a119d38793a886c7744f5027d7eaa3702351e75e4ff9bf255e3ce296bf41f80adda2861e81bd8efc52219df821852d84a17fb625e3965ebf2fdd9")
        @Expect(true)

        var hmac2 = HMAC(key, algorithm)
        var md2: Array<Byte> = hmac2.finish()
        @Expect(md2.size, 64)
        @Expect(toHexString(md2), "9f2db16a60e93df5bbe22021b81018281f122c21e5d871a699953bce91fd7e59e1f0f0efd04bf5eadaafdaf8372aa6297bf3b2a51fc8f86c3e25caca0f15b5fa")
        @Expect(true)

        var hmac3 = HMAC(key, algorithm)
        hmac3.write("123456789".toArray())
        var md3: Array<Byte> = hmac3.finish()
        @Expect(md3.size, 64)
        @Expect(toHexString(md3), toHexString(md1))
        @Expect(true)
    }

    /*
     * Test API:
     * public func write(buffer: Array<Byte>): Unit
     * public func finish(): Array<Byte>
     */
    @TestCase
    func testInvlidWriteAndFinish(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "cangjie".toArray()
        var data1: Array<UInt8> = "123".toArray()
        var caseException01: ?Exception = None
        try {
            var hmac1 = HMAC(key, algorithm)
            hmac1.write(data1)
            hmac1.finish()
            hmac1.write(data1)
        } catch (e: CryptoException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvlidWriteAndFinish_01",
            caseException01,
            "HMAC write failed, digest calculation has been completed."
        )
        var caseException02: ?Exception = None
        try {
            var hmac2 = HMAC(key, algorithm)
            hmac2.write(data1)
            hmac2.finish()
            hmac2.finish()
        } catch (e: CryptoException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvlidWriteAndFinish_02",
            caseException02,
            "HMAC finish failed, digest calculation has been completed."
        )

        var caseException03: ?Exception = None
        try {
            var hmac3 = HMAC(key, algorithm)
            hmac3.write([])
        } catch (e: CryptoException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvlidWriteAndFinish_03",
            caseException03,
            "The data cannot be empty."
        )
    }

    /*
     * Test API:
     * public func reset(): Unit
     */
    @TestCase
    func testReset(): Unit {
        var algorithm: HashType = HashType.SHA512
        var key: Array<UInt8> = "cangjie".toArray()
        var data1: Array<UInt8> = "123".toArray()
        var data2: Array<UInt8> = "456".toArray()
        var data3: Array<UInt8> = "789".toArray()
        var hmac1 = HMAC(key, algorithm)
        hmac1.write(data1)
        hmac1.write(data2)
        hmac1.write(data3)
        hmac1.reset()
        hmac1.write(data3)
        hmac1.write(data2)
        hmac1.write(data1)
        var hmac2 = HMAC(key, algorithm)
        hmac2.write("789456123".toArray())
        @Expect(hmac1.finish(), hmac2.finish())
        hmac1.reset()
        hmac2.reset()
        @Expect(hmac1.finish(), hmac2.finish())
        hmac1.reset()
        hmac2.reset()
        hmac1.write(data1)
        hmac2.write(data1)
        @Expect(hmac1.finish(), hmac2.finish())
    }

    /*
     * Test API:
     * public static func equal(mac1: Array<Byte>, mac2: Array<Byte>): Bool
     */
    @TestCase
    func testEqualt(): Unit {
        var mac: Array<Byte> = [43, 175, 235, 83, 182, 10, 17, 157, 56, 121, 58, 136, 108, 119, 68, 245, 2, 125, 126,
        170, 55, 2, 53, 30, 117, 228, 255, 155, 242, 85, 227, 206, 41, 107, 244, 31, 128, 173, 218, 40, 97, 232, 27,
        216, 239, 197, 34, 25, 223, 130, 24, 82, 216, 74, 23, 251, 98, 94, 57, 101, 235, 242, 253, 217]
        var mac1: Array<Byte> = [43, 175, 235, 83, 182, 10, 17, 157, 56, 121, 58, 136, 108, 119, 68, 245, 2, 125, 126,
        170, 55, 2, 53, 30, 117, 228, 255, 155, 242, 85, 227, 206, 41, 107, 244, 31, 128, 173, 218, 40, 97, 232, 27,
        216, 239, 197, 34, 25, 223, 130, 24, 82, 216, 74, 23, 251, 98, 94, 57, 101, 235, 242, 253, 217]
        var mac2: Array<Byte> = [44, 175, 235, 83, 182, 10, 17, 157, 56, 121, 58, 136, 108, 119, 68, 245, 2, 125, 126,
        170, 55, 2, 53, 30, 117, 228, 255, 155, 242, 85, 227, 206, 41, 107, 244, 31, 128, 173, 218, 40, 97, 232, 27,
        216, 239, 197, 34, 25, 223, 130, 24, 82, 216, 74, 23, 251, 98, 94, 57, 101, 235, 242, 253, 217]
        var mac3: Array<Byte> = [43, 175]
        @Expect(HMAC.equal(mac1,mac))
        @Expect(!HMAC.equal(mac2,mac))
        @Expect(!HMAC.equal(mac3,mac))
    }
    /*
     * Test HashType API:
     * public func toString(): String
     */
    @TestCase
    func testHashType(): Unit {
        @Expect(HashType.SHA512.toString(), "SHA512")
        @Expect(HashType.SHA384.toString(), "SHA384")
        @Expect(HashType.SHA256.toString(), "SHA256")
        @Expect(HashType.SHA224.toString(), "SHA224")
        @Expect(HashType.MD5.toString(), "MD5")
    }
}
class TextDigest01 <: Digest {
    public init() {
    }
    public prop size: Int64 {
        get() {
            return 10
        }
    }
    public prop blockSize: Int64 {
        get() {
            return 20
        }
    }
    public prop algorithm: String {
        get() {
            return "TextDigest01"
        }
    }
    public func write(buffer: Array<Byte>): Unit {
    }

    public func finish(): Array<Byte> {
        []
    }
    public func finish(to!: Array<Byte>): Unit {

    }

    public func reset(): Unit {
    }
}