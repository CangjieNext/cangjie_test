/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.binary.*
import std.unittest.*
import std.unittest.testmacro.*

type TestTypeCombineTuple = (Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, Float16, Float32, Float64, Array<Byte>, 
    Bool, Bool, Array<Bool>)

@Test
public class TestEndianConvert {
    let testTypeCombineTuple: TestTypeCombineTuple = (0x01, 0x0203, 0x04050607, 0x08090a0b0c0d0e0f, 0x10, 0x1112,
        0x13141516, 0x1718191a1b1c1d1e, Float16.fromBits(0x1f20), Float32.fromBits(0x21222324), Float64.fromBits(
            0x25262728292a2b2c), [0x2d, 0x2e, 0x2f, 0x30], true, false, [true, false, true, false])

    var big: Array<Byte> = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
        31,
        32,
        33,
        34,
        35,
        36,
        37,
        38,
        39,
        40,
        41,
        42,
        43,
        44,
        45,
        46,
        47,
        48,
        1,
        0,
        1,
        0,
        1,
        0
    ]
    var little: Array<Byte> = [
        1,
        3,
        2,
        7,
        6,
        5,
        4,
        15,
        14,
        13,
        12,
        11,
        10,
        9,
        8,
        16,
        18,
        17,
        22,
        21,
        20,
        19,
        30,
        29,
        28,
        27,
        26,
        25,
        24,
        23,
        32,
        31,
        36,
        35,
        34,
        33,
        44,
        43,
        42,
        41,
        40,
        39,
        38,
        37,
        45,
        46,
        47,
        48,
        1,
        0,
        1,
        0,
        1,
        0
    ]

    var source: Array<Byte> = [1, 2, 3, 4, 5, 6, 7, 8]
    var result: Array<Int32> = [0x01020304, 0x05060708]
    var buffer = Array<Byte>(8, {i => 0})

    @TestCase
    func testFromBits(): Unit {
        var v1 = Float64.fromBits(0x4029000000000000)
        @Expect(v1,12.5f64)

        var v2 = Float32.fromBits(0x41480000)
        @Expect(v2,12.5f32)

        var v3 = Float16.fromBits(0x1f20)
        @Expect(v3,0.006958f16)
    }

    @TestCase
    func testToBits(): Unit {
        @Expect((0.006958f16).toBits(), 0x1f20)
        @Expect((12.5f32).toBits(), 0x41480000)
        @Expect((12.5f64).toBits(), 0x4029000000000000)
    }

    @TestCase
    func testWriteBigEndian(): Unit {
        var rp = 0
        var wn = 0
        wn = testTypeCombineTuple[0].writeBigEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[1].writeBigEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[2].writeBigEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[3].writeBigEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[4].writeBigEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[5].writeBigEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[6].writeBigEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[7].writeBigEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[8].writeBigEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[9].writeBigEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[10].writeBigEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        @Expect(testTypeCombineTuple[11] == big[rp..rp+4])
        rp += 4

        wn = testTypeCombineTuple[12].writeBigEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], big[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[13].writeBigEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], big[rp..rp+wn])
    }

    @TestCase
    func testReadBigEndian(): Unit {
        var rp = 0
        @Expect(testTypeCombineTuple[0] == Int8.readBigEndian(big[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[1] == Int16.readBigEndian(big[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[2] == Int32.readBigEndian(big[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[3] == Int64.readBigEndian(big[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[4] == UInt8.readBigEndian(big[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[5] == UInt16.readBigEndian(big[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[6] == UInt32.readBigEndian(big[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[7] == UInt64.readBigEndian(big[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[8] == Float16.readBigEndian(big[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[9] == Float32.readBigEndian(big[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[10] == Float64.readBigEndian(big[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[11] == little[rp..rp+4])
        rp += 4
        @Expect(testTypeCombineTuple[12] == Bool.readBigEndian(big[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[13] == Bool.readBigEndian(big[rp..]))
    }

    @TestCase
    func testWriteLittleEndian(): Unit {
        var rp = 0
        var wn = 0

        wn = testTypeCombineTuple[0].writeLittleEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[1].writeLittleEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[2].writeLittleEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[3].writeLittleEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[4].writeLittleEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[5].writeLittleEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[6].writeLittleEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[7].writeLittleEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[8].writeLittleEndian(buffer)
        @Expect(wn, 2)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[9].writeLittleEndian(buffer)
        @Expect(wn, 4)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[10].writeLittleEndian(buffer)
        @Expect(wn, 8)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        @Expect(testTypeCombineTuple[11] == little[rp..rp+4])
        rp += 4

        wn = testTypeCombineTuple[12].writeLittleEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], little[rp..rp+wn])
        rp += wn

        wn = testTypeCombineTuple[13].writeLittleEndian(buffer)
        @Expect(wn, 1)
        @Expect(buffer[..wn], little[rp..rp+wn])
    }

    @TestCase
    func testReadLittleEndian(): Unit {
        var rp = 0
        @Expect(testTypeCombineTuple[0] == Int8.readLittleEndian(little[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[1] == Int16.readLittleEndian(little[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[2] == Int32.readLittleEndian(little[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[3] == Int64.readLittleEndian(little[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[4] == UInt8.readLittleEndian(little[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[5] == UInt16.readLittleEndian(little[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[6] == UInt32.readLittleEndian(little[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[7] == UInt64.readLittleEndian(little[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[8] == Float16.readLittleEndian(little[rp..]))
        rp += 2
        @Expect(testTypeCombineTuple[9] == Float32.readLittleEndian(little[rp..]))
        rp += 4
        @Expect(testTypeCombineTuple[10] == Float64.readLittleEndian(little[rp..]))
        rp += 8
        @Expect(testTypeCombineTuple[11] == little[rp..rp+4])
        rp += 4
        @Expect(testTypeCombineTuple[12] == Bool.readLittleEndian(little[rp..]))
        rp += 1
        @Expect(testTypeCombineTuple[13] == Bool.readLittleEndian(little[rp..]))
    }

    @TestCase
    func testSwapBytes(): Unit {
        let n = 0x1234567890123456u64
        let m = n.swapBytes()
        @Expect(m == 0x5634129078563412)
    }

    @TestCase
    func test_f32_to_be_bytes(): Unit {
        let n = 12.5f32
        let m = Array<Byte>(4, repeat: 0)
        n.writeBigEndian(m)
        @Expect(m == [0x41, 0x48, 0x00, 0x00])
    }

    @TestCase
    func test_f32_from_be_bytes(): Unit {
        let n = [0x41u8, 0x48u8, 0x00u8, 0x00u8]
        let value = Float32.readBigEndian(n)
        @Expect(value == 12.5f32)
    }

    @TestCase
    func test_f32_to_le_bytes(): Unit {
        let n = 12.5f32
        let m = Array<Byte>(4, repeat: 0)
        n.writeLittleEndian(m)
        @Expect(m == [0x00, 0x00, 0x48, 0x41])
    }

    @TestCase
    func test_f32_from_le_bytes(): Unit {
        let n = [0x00u8, 0x00u8, 0x48u8, 0x41u8]
        let value = Float32.readLittleEndian(n)
        @Expect(value == 12.5f32)
    }

    @TestCase
    func test_f64_to_be_bytes(): Unit {
        let n = 12.5f64
        let m = Array<Byte>(8, repeat: 0)
        n.writeBigEndian(m)
        @Expect(m == [0x40, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
    }

    @TestCase
    func test_f64_to_be_bytes_without_enough_space_big(): Unit {
        try {
            let n = 12.5f64
            let m = Array<Byte>(4, repeat: 0)
            n.writeBigEndian(m)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_f64_to_be_bytes_without_enough_space_little(): Unit {
        try {
            let n = 12.5f64
            let m = Array<Byte>(4, repeat: 0)
            n.writeLittleEndian(m)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_f64_from_be_bytes(): Unit {
        let n = [0x40u8, 0x29u8, 0x00u8, 0x00u8, 0x00u8, 0x00u8, 0x00u8, 0x00u8]
        let value = Float64.readBigEndian(n)
        @Expect(value == 12.5f64)
    }

    @TestCase
    func test_f64_to_le_bytes(): Unit {
        let n = 12.5f64
        let m = Array<Byte>(8, repeat: 0)
        n.writeLittleEndian(m)
        @Expect(m == [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x40])
    }

    @TestCase
    func test_f64_from_le_bytes(): Unit {
        let n = [0x00u8, 0x00u8, 0x00u8, 0x00u8, 0x00u8, 0x00u8, 0x29u8, 0x40u8]
        let value = Float64.readLittleEndian(n)
        @Expect(value == 12.5f64)
    }
}
