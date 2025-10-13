/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

internal import std.random.*
internal import std.unittest.prop_test.*
internal import std.collection.*
internal import std.sort.SortExtension

func requireEquals<T>(lhv: T, rhv: T) where T <: Equatable<T> & ToString {
    if (lhv != rhv) {
        eprintln("Expected ${rhv}, got ${lhv}")
        throw Exception()
    }
}

func sorted<T>(arr: Array<T>): Array<T> where T <: Comparable<T> {
    arr.sort()
    return arr
}

func testShrinkNumbers() {
    // shrinking Int8
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(0).shrink())), [])
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(1).shrink())), [0])
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(-1).shrink())), [0, 1])
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(2).shrink())), [0, 1])
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(5).shrink())), [0, 1, 2])
    requireEquals<Array<Int8>>(sorted(collectArray(Int8(-5).shrink())), [-2, 0, 1, 5])

    requireEquals<Array<Int16>>(sorted(collectArray(Int16(0).shrink())), [])
    requireEquals<Array<Int16>>(sorted(collectArray(Int16(1).shrink())), [0])
    requireEquals<Array<Int16>>(sorted(collectArray(Int16(-1).shrink())), [0, 1])
    requireEquals<Array<Int16>>(sorted(collectArray(Int16(2).shrink())), [0, 1])
    requireEquals<Array<Int16>>(sorted(collectArray(Int16(5).shrink())), [0, 1, 2])
    requireEquals<Array<Int16>>(sorted(collectArray(Int16(-5).shrink())), [-2, 0, 1, 5])

    requireEquals<Array<Int32>>(sorted(collectArray(Int32(0).shrink())), [])
    requireEquals<Array<Int32>>(sorted(collectArray(Int32(1).shrink())), [0])
    requireEquals<Array<Int32>>(sorted(collectArray(Int32(-1).shrink())), [0, 1])
    requireEquals<Array<Int32>>(sorted(collectArray(Int32(2).shrink())), [0, 1])
    requireEquals<Array<Int32>>(sorted(collectArray(Int32(5).shrink())), [0, 1, 2])
    requireEquals<Array<Int32>>(sorted(collectArray(Int32(-5).shrink())), [-2, 0, 1, 5])

    requireEquals<Array<Int64>>(sorted(collectArray(Int64(0).shrink())), [])
    requireEquals<Array<Int64>>(sorted(collectArray(Int64(1).shrink())), [0])
    requireEquals<Array<Int64>>(sorted(collectArray(Int64(-1).shrink())), [0, 1])
    requireEquals<Array<Int64>>(sorted(collectArray(Int64(2).shrink())), [0, 1])
    requireEquals<Array<Int64>>(sorted(collectArray(Int64(5).shrink())), [0, 1, 2])
    requireEquals<Array<Int64>>(sorted(collectArray(Int64(-5).shrink())), [-2, 0, 1, 5])

    requireEquals<Array<UInt8>>(sorted(collectArray(UInt8(0).shrink())), [])
    requireEquals<Array<UInt8>>(sorted(collectArray(UInt8(1).shrink())), [0])
    requireEquals<Array<UInt8>>(sorted(collectArray(UInt8(2).shrink())), [0, 1])
    requireEquals<Array<UInt8>>(sorted(collectArray(UInt8(5).shrink())), [0, 1, 2])

    requireEquals<Array<UInt16>>(sorted(collectArray(UInt16(0).shrink())), [])
    requireEquals<Array<UInt16>>(sorted(collectArray(UInt16(1).shrink())), [0])
    requireEquals<Array<UInt16>>(sorted(collectArray(UInt16(2).shrink())), [0, 1])
    requireEquals<Array<UInt16>>(sorted(collectArray(UInt16(5).shrink())), [0, 1, 2])

    requireEquals<Array<UInt32>>(sorted(collectArray(UInt32(0).shrink())), [])
    requireEquals<Array<UInt32>>(sorted(collectArray(UInt32(1).shrink())), [0])
    requireEquals<Array<UInt32>>(sorted(collectArray(UInt32(2).shrink())), [0, 1])
    requireEquals<Array<UInt32>>(sorted(collectArray(UInt32(5).shrink())), [0, 1, 2])

    requireEquals<Array<UInt64>>(sorted(collectArray(UInt64(0).shrink())), [])
    requireEquals<Array<UInt64>>(sorted(collectArray(UInt64(1).shrink())), [0])
    requireEquals<Array<UInt64>>(sorted(collectArray(UInt64(2).shrink())), [0, 1])
    requireEquals<Array<UInt64>>(sorted(collectArray(UInt64(5).shrink())), [0, 1, 2])
}

func testComplex() {
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2, 3, 4, 5].shrink()),
        [
            [],
            [1],
            [1, 2],
            [3, 4, 5],
            [0, 2, 3, 4, 5],
            [1, 0, 3, 4, 5],
            [1, 2, 0, 4, 5],
            [1, 2, 3, 0, 5],
            [1, 2, 3, 4, 0],
            [1, 1, 3, 4, 5],
            [1, 2, 1, 4, 5],
            [1, 2, 3, 1, 5],
            [1, 2, 3, 4, 1],
            [1, 2, 3, 2, 5],
            [1, 2, 3, 4, 2]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1].shrink()),
        [
            [],
            [0]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2].shrink()),
        [
            [],
            [1],
            [2],
            // shrink elements:
            [0, 2],
            [1, 0],
            [1, 1]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2, 3].shrink()),
        [
            [],
            [1],
            [2, 3],
            // shrink elements:
            [0, 2, 3],
            [1, 0, 3],
            [1, 2, 0],
            [1, 1, 3],
            [1, 2, 1]
        ]
    )

    requireEquals<Array<String>>(
        collectArray("a".shrink()),
        [""]
    )
    requireEquals<Array<String>>(
        collectArray("ab".shrink()),
        [
            "",
            "of",
            "a",
            "b"
        ]
    )
    requireEquals<Array<String>>(
        collectArray("abb".shrink()),
        [
            "",
            "the",
            "a",
            "bb"
        ]
    )
    requireEquals<Array<String>>(
        collectArray("abbccde".shrink()),
        [
            "",
            "cangjie",
            "a",
            "abb",
            "ccde"
        ]
    )

    requireEquals<Array<String>>(
        collectArray("!@#$%^&".shrink()),
        [
            "",
            "cangjie",
            "!",
            "!@#",
            "$%^&",
            "x@#$%^&",
            "!2#$%^&",
            "!@z$%^&",
            "!@#A%^&",
            "!@#$B^&",
            "!@#$%w&",
            "!@#$%^C"
        ]
    )

    requireEquals<Array<?Int64>>(
        collectArray(Some(2).shrink()),
        [
            None,
            Some(0),
            Some(1)
        ]
    )
    requireEquals<Array<?Int64>>(
        collectArray(Some(0).shrink()),
        [None]
    )
    requireEquals<Array<?Int64>>(
        collectArray(None<Int64>.shrink()),
        []
    )
}

struct DT <: Equatable<DT> & ToString {
    DT(let value: Int64) {}
    public operator func ==(that: DT): Bool {
        value == that.value
    }
    public operator func !=(that: DT): Bool {
        value != that.value
    }
    public func toString(): String {
        value.toString()
    }
}

func testComplexNonShrinkable() {
    requireEquals<Array<Array<DT>>>(
        collectArray([DT(1), DT(2), DT(3), DT(4), DT(5)].shrink()),
        [
            [],
            [DT(1)],
            [DT(1), DT(2)],
            [DT(3), DT(4), DT(5)]
        ]
    )
    requireEquals<Array<?DT>>(
        collectArray(Some(DT(1)).shrink()),
        [None]
    )
    requireEquals<Array<?DT>>(
        collectArray(None<DT>.shrink()),
        []
    )
}

main() {
    testShrinkNumbers()
    testComplex()
    testComplexNonShrinkable()
}
