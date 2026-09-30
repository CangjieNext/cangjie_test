/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.sort.*
import std.random.*

// Before the fix (issue #913), sorting a Float array containing NaN could
// hang forever in the unstable partition loop (n >= 98 at 1/7 NaN density)
// or throw IndexOutOfBoundsException in the timSort merge phase (n = 132).
// After the fix the sort always terminates, and on the Comparable paths all
// NaN values are placed at the tail of the array (like Java's Arrays.sort)
// with the non-NaN prefix sorted ascending. Stable sorting preserves the
// relative order of the NaN values themselves.

// returns the length of the leading run of non-NaN values
func nonNaNPrefixLength(a: Array<Float64>): Int64 {
    var i = 0
    while (i < a.size && !(a[i] != a[i])) {
        i++
    }
    return i
}

func assertNaNTailSorted(a: Array<Float64>, tag: String): Unit {
    let nonNaN = nonNaNPrefixLength(a)
    for (i in 1..nonNaN) {
        if (a[i - 1] > a[i]) {
            throw Exception("[${tag}] non-NaN prefix not sorted at index ${i}")
        }
    }
    for (i in nonNaN..a.size) {
        if (!(a[i] != a[i])) {
            throw Exception("[${tag}] non-NaN value found in tail at index ${i}")
        }
    }
}

func fillNaNPattern(a: Array<Float64>): Unit {
    let n = a.size
    for (i in 0..n) {
        a[i] = if (i % 7 == 0) { Float64.NaN } else { Float64(i % 97) }
    }
}

func countNaN(a: Array<Float64>): Int64 {
    var c = 0
    for (i in 0..a.size) {
        if (a[i] != a[i]) {
            c++
        }
    }
    return c
}

@Test
class sortFloatNaNTest {
    // The original hang reproduced from n = 98 on the unstable path
    @TestCase
    func unstableNaNAllSizes(): Unit {
        for (n in 17..600) {
            let a = Array<Float64>(n, {i => Float64(0)})
            fillNaNPattern(a)
            sort(a)
            assertNaNTailSorted(a, "unstable/n=${n}")
        }
    }

    // The original IndexOutOfBoundsException reproduced at n = 132 on the stable path
    @TestCase
    func stableNaNAllSizes(): Unit {
        for (n in 17..600) {
            let a = Array<Float64>(n, {i => Float64(0)})
            fillNaNPattern(a)
            sort(a, stable: true)
            assertNaNTailSorted(a, "stable/n=${n}")
        }
    }

    // Both comparator paths must terminate and keep every element
    @TestCase
    func comparatorNaNAllSizes(): Unit {
        for (n in 17..400) {
            let src = Array<Float64>(n, {i => Float64(0)})
            fillNaNPattern(src)
            let expectNaN = (n - 1) / 7 + 1
            let a = Array<Float64>(n, {i => src[i]})
            sort(a, by: {l: Float64, r: Float64 => l.compare(r)})
            if (countNaN(a) != expectNaN) {
                throw Exception("comparator unstable changed element count at n=${n}")
            }
            let b = Array<Float64>(n, {i => src[i]})
            sort(b, by: {l: Float64, r: Float64 => l.compare(r)}, stable: true)
            if (countNaN(b) != expectNaN) {
                throw Exception("comparator stable changed element count at n=${n}")
            }
        }
    }

    @TestCase
    func nanEdgeDistributions(): Unit {
        let n = 500
        let cases: Array<(String, (Int64) -> Float64)> = [
            ("allNaN", {_: Int64 => Float64.NaN}),
            ("firstNaN", {i => if (i == 0) { Float64.NaN } else { Float64(i) }}),
            ("lastNaN", {i => if (i == n - 1) { Float64.NaN } else { Float64(i) }}),
            ("nanBlock", {i => if (i % 50 < 10) { Float64.NaN } else { Float64(i) }}),
            ("infMix", {i =>
                if (i % 9 == 0) {
                    Float64.NaN
                } else if (i % 3 == 0) {
                    Float64.Inf
                } else if (i % 5 == 0) {
                    -Float64.Inf
                } else {
                    Float64(i % 111)
                }
            }),
            ("single", {i => if (i == 250) { Float64.NaN } else { Float64(n - i) }}),
        ]
        for ((name, gen) in cases) {
            let a = Array<Float64>(n, gen)
            sort(a)
            assertNaNTailSorted(a, "edge.unstable.${name}")
            let b = Array<Float64>(n, gen)
            sort(b, stable: true)
            assertNaNTailSorted(b, "edge.stable.${name}")
        }
    }

    @TestCase
    func float16AndFloat32NaN(): Unit {
        let r = Random(99)
        for (n in [17, 98, 132, 500, 5000]) {
            let a16 = Array<Float16>(n, {i =>
                if (i % 7 == 0) { Float16.NaN } else { Float16(r.nextInt32(1000)) / 16.0 }
            })
            sort(a16)
            var nn = 0
            while (nn < n && !(a16[nn] != a16[nn])) {
                nn++
            }
            for (i in 1..nn) {
                if (a16[i - 1] > a16[i]) {
                    throw Exception("Float16 not sorted at n=${n}")
                }
            }

            let a32 = Array<Float32>(n, {i =>
                if (i % 7 == 0) { Float32.NaN } else { Float32(r.nextInt32(100000)) / 64.0 }
            })
            sort(a32, stable: true)
            nn = 0
            while (nn < n && !(a32[nn] != a32[nn])) {
                nn++
            }
            for (i in 1..nn) {
                if (a32[i - 1] > a32[i]) {
                    throw Exception("Float32 not sorted at n=${n}")
                }
            }
        }
    }

    @TestCase
    func largeNaNArray(): Unit {
        let n = 1000000
        let a = Array<Float64>(n, {i => if (i % 3 == 0) { Float64.NaN } else { Float64((i * 7919) % 999983) }})
        sort(a)
        assertNaNTailSorted(a, "large.unstable")
        let b = Array<Float64>(n, {i => if (i % 3 == 0) { Float64.NaN } else { Float64((i * 7919) % 999983) }})
        sort(b, stable: true)
        assertNaNTailSorted(b, "large.stable")
    }

    // Arrays without NaN must keep the original behavior
    @TestCase
    func noNaNRegression(): Unit {
        let r = Random(77)
        let n = 100000
        let src = Array<Float64>(n, {_: Int64 => Float64(r.nextInt64(2000000)) / 100.0})
        let a = Array<Float64>(n, {i => src[i]})
        let b = Array<Float64>(n, {i => src[i]})
        sort(a)
        sort(b, by: {l: Float64, r2: Float64 => l.compare(r2)})
        for (i in 1..n) {
            if (a[i - 1] > a[i]) {
                throw Exception("[noNaN.unstable] not sorted at index ${i}")
            }
            if (a[i] != b[i]) {
                throw Exception("[noNaN] mismatch at index ${i}")
            }
        }
    }
}
