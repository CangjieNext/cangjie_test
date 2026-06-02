/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*

@Test
class BigInitTest {
    @TestCase
    func complementInit(): Unit {
        var bytes: Array<Byte> = [0, 255, 255, 255, 255, 255, 255, 255, 255]
        var i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "FFFFFFFFFFFFFFFF")
        @Expect(i.toBytes(), bytes)

        bytes = [1, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "10000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFF")
        @Expect(i.toBytes(), bytes)

        bytes = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "1000000000000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-1")

        bytes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(), "0")
        @Expect(i.toBytes(), [0u8])

        bytes = Array<Byte>()
        try {
            i = BigInt(bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size of bytes cannot be zero!")
        }
    }

    @TestCase
    func magnitudeInit(): Unit {
        var bytes: Array<Byte> = [0, 255, 255, 255, 255, 255, 255, 255, 255]
        var i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "FFFFFFFFFFFFFFFF")

        bytes = [0, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-FFFFFFFFFFFFFFFF")

        bytes = [1, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "10000000000000000")

        bytes = [1, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-10000000000000000")

        bytes = [0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFF")

        bytes = [0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-FFFFFFFFFFFFFFFFFFFFFFFF")

        bytes = [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "1000000000000000000000000")

        bytes = [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-1000000000000000000000000")

        bytes = [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFFFF")

        bytes = [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-FFFFFFFFFFFFFFFFFFFFFFFFFF")

        bytes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "0")

        bytes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        try {
            i = BigInt(false, bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size or the value of magnitude cannot be zero if sign is true!")
        }

        bytes = Array<Byte>()
        try {
            i = BigInt(false, bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size or the value of magnitude cannot be zero if sign is true!")
        }
        i = BigInt(true, bytes)
        @Expect(i.toString(), "0")
    }
}
