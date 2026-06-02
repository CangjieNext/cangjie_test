/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

class TZifBuilder {
    private var transtime2_1: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 255, 255, 116, 224, 112, 190])
    private var transtime2_2: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 255, 255, 187, 5, 67, 72])
    private var transtime2_3: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 0, 127, 232, 23, 128])

    public func setTransitionOrder(first: Array<UInt8>, second: Array<UInt8>, third: Array<UInt8>): Unit {
        transtime2_1 = ArrayList<UInt8>(first)
        transtime2_2 = ArrayList<UInt8>(second)
        transtime2_3 = ArrayList<UInt8>(third)
    }

    public func build(): Array<UInt8> {
        var tzif = ArrayList<UInt8>()

        tzif.add(all: [84, 90, 105, 102])
        tzif.add(50)
        tzif.add(all: Array<UInt8>(15, repeat: 0))
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 0])
        tzif.add(all: [0, 0, 0, 3])
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 8])
        tzif.add(all: [128, 0, 0, 0])
        tzif.add(all: [187, 5, 67, 72])
        tzif.add(all: [127, 232, 23, 128])
        tzif.add(all: [0])
        tzif.add(all: [1])
        tzif.add(all: [0])
        tzif.add(all: [255, 255, 108, 88, 0, 0])
        tzif.add(all: [255, 255, 122, 104, 0, 4])
        tzif.add(all: "LMT\0".toArray())
        tzif.add(all: "HST\0".toArray())
        tzif.add(all: [1])
        tzif.add(all: [0])
        tzif.add(all: [1])
        tzif.add(all: [0])

        tzif.add(all: [84, 90, 105, 102])
        tzif.add(50)
        tzif.add(all: Array<UInt8>(15, repeat: 0))
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 0])
        tzif.add(all: [0, 0, 0, 3])
        tzif.add(all: [0, 0, 0, 2])
        tzif.add(all: [0, 0, 0, 8])
        tzif.add(all: transtime2_1)
        tzif.add(all: transtime2_2)
        tzif.add(all: transtime2_3)
        tzif.add(all: [0])
        tzif.add(all: [1])
        tzif.add(all: [0])
        tzif.add(all: [255, 255, 108, 88, 0, 0])
        tzif.add(all: [255, 255, 122, 104, 0, 4])
        tzif.add(all: "LMT\0".toArray())
        tzif.add(all: "HST\0".toArray())
        tzif.add(all: [0])
        tzif.add(all: [0])
        tzif.add(all: [0])
        tzif.add(all: [0])
        tzif.add(all: "\nHST10\n".toArray())

        return tzif.toArray()
    }
}

@Test
class TimeReportReproTest {
    // Covers: std.time MEDIUM-01
    @TestCase
    func malformedTzifWithDescendingTransitionsShouldBeRejected(): Unit {
        let builder = TZifBuilder()
        builder.setTransitionOrder(
            [0, 0, 0, 0, 127, 232, 23, 128],
            [255, 255, 255, 255, 187, 5, 67, 72],
            [255, 255, 255, 255, 116, 224, 112, 190]
        )

        @ExpectThrows[InvalidDataException](TimeZone.loadFromTZData("Descending/Test", builder.build()))
    }

    // Covers: std.time MEDIUM-HIGH-01
    @TestCase
    func timezoneIdWithBackslashShouldBeRejectedImmediately(): Unit {
        @ExpectThrows[IllegalArgumentException](TimeZone.load("Asia\\Urumqi"))
    }
}
