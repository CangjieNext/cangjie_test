/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.sort.*
import std.collection.*

// Companion of test_sort_float_nan.cj covering the descending Comparable paths
// and the std.collection sort copies.
//
// Before the descending fix, `sort(a, descending: true)` built the reversed
// comparator `{l, r => r.compare(l)}` and routed through the comparator
// overloads, whose isAscending/isDescending short-circuit checks were fooled
// by NaN (Float64.compare reports EQ for NaN against anything), e.g.
// sort([2.0, NaN, 1.0, 0.5], descending: true) silently returned the input
// unchanged. After the fix, NaN is treated as the largest value: under
// descending order all NaN values are placed at the head of the array and the
// non-NaN suffix is sorted descending. Stable sorting preserves the relative
// order of the NaN values themselves.
//
// The std.collection sort copies (ArrayList member APIs) previously lacked
// the timSort gallop run-exhaustion guards, so ArrayList.sort(stable: true)
// with a NaN-carrying Float array of size > 64 could throw
// IndexOutOfBoundsException.

// returns the length of the leading run of NaN values
func nonNaNHeadStart(a: Array<Float64>): Int64 {
    var i = 0
    while (i < a.size && a[i] != a[i]) {
        i++
    }
    return i
}

// under descending order: all NaN at the head, non-NaN suffix strictly descending
func assertNaNHeadSortedDesc(a: Array<Float64>, tag: String): Unit {
    let head = nonNaNHeadStart(a)
    for (i in head..a.size) {
        if (a[i] != a[i]) {
            throw Exception("[${tag}] NaN found in body at index ${i}")
        }
        if (i > head && a[i - 1] < a[i]) {
            throw Exception("[${tag}] non-NaN suffix not descending at index ${i}")
        }
    }
}

func countNaN64(a: Array<Float64>): Int64 {
    var c = 0
    for (i in 0..a.size) {
        if (a[i] != a[i]) {
            c++
        }
    }
    return c
}

func countNaNList(a: ArrayList<Float64>): Int64 {
    var c = 0
    for (i in 0..a.size) {
        if (a[i] != a[i]) {
            c++
        }
    }
    return c
}

func fillNaNPattern(a: Array<Float64>): Unit {
    let n = a.size
    for (i in 0..n) {
        a[i] = if (i % 7 == 0) { Float64.NaN } else { Float64(i % 97) }
    }
}

// The two silent-non-sorting examples from the review comment
func assertExactReviewCases(): Unit {
    let a: Array<Float64> = [2.0, Float64.NaN, 1.0, 0.5]
    sort(a, descending: true)
    if (!(a[0] != a[0]) || a[1] != 2.0 || a[2] != 1.0 || a[3] != 0.5) {
        throw Exception("review case 1: expected [NaN, 2.0, 1.0, 0.5], got ${a}")
    }
    let b: Array<Float64> = [1.0, 2.0, Float64.NaN, 3.0]
    sort(b, descending: true)
    if (!(b[0] != b[0]) || b[1] != 3.0 || b[2] != 2.0 || b[3] != 1.0) {
        throw Exception("review case 2: expected [NaN, 3.0, 2.0, 1.0], got ${b}")
    }
}

@Test
class sortFloatNaNDescendingTest {
    // The silent non-sorting examples: NaN must not fool the descending path
    @TestCase
    func descendingReviewCases(): Unit {
        assertExactReviewCases()
    }

    // All sizes on the unstable descending path
    @TestCase
    func descendingUnstableAllSizes(): Unit {
        for (n in 17..600) {
            let a = Array<Float64>(n, {i => Float64(0)})
            fillNaNPattern(a)
            sort(a, descending: true)
            assertNaNHeadSortedDesc(a, "desc.unstable/n=${n}")
        }
    }

    // All sizes on the stable descending path
    @TestCase
    func descendingStableAllSizes(): Unit {
        for (n in 17..600) {
            let a = Array<Float64>(n, {i => Float64(0)})
            fillNaNPattern(a)
            sort(a, stable: true, descending: true)
            assertNaNHeadSortedDesc(a, "desc.stable/n=${n}")
        }
    }

    // Edge distributions on both descending paths
    @TestCase
    func descendingEdgeDistributions(): Unit {
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
            sort(a, descending: true)
            assertNaNHeadSortedDesc(a, "edge.desc.unstable.${name}")
            let b = Array<Float64>(n, gen)
            sort(b, stable: true, descending: true)
            assertNaNHeadSortedDesc(b, "edge.desc.stable.${name}")
        }
    }

    // Float16 / Float32 descending paths
    @TestCase
    func descendingFloat16AndFloat32(): Unit {
        let n = 500
        let a16 = Array<Float16>(n, {i => if (i % 7 == 0) { Float16.NaN } else { Float16(i % 97) }})
        sort(a16, descending: true)
        var nn = 0
        while (nn < n && a16[nn] != a16[nn]) {
            nn++
        }
        for (i in 1..nn) {
            if (a16[i - 1] < a16[i]) {
                throw Exception("Float16 descending not sorted at index ${i}")
            }
        }
        for (i in nn..n) {
            if (a16[i] != a16[i]) {
                throw Exception("Float16 NaN found in body at index ${i}")
            }
        }

        let a32 = Array<Float32>(n, {i => if (i % 7 == 0) { Float32.NaN } else { Float32(i % 97) }})
        sort(a32, stable: true, descending: true)
        nn = 0
        while (nn < n && a32[nn] != a32[nn]) {
            nn++
        }
        for (i in 1..nn) {
            if (a32[i - 1] < a32[i]) {
                throw Exception("Float32 descending not sorted at index ${i}")
            }
        }
        for (i in nn..n) {
            if (a32[i] != a32[i]) {
                throw Exception("Float32 NaN found in body at index ${i}")
            }
        }
    }

    // Deprecated member APIs must share the descending semantics
    @TestCase
    func arraySortDescendingMember(): Unit {
        let a: Array<Float64> = [2.0, Float64.NaN, 1.0, 0.5]
        a.sortDescending()
        if (!(a[0] != a[0]) || a[1] != 2.0 || a[2] != 1.0 || a[3] != 0.5) {
            throw Exception("Array.sortDescending: got ${a}")
        }
        let b: Array<Float64> = [2.0, Float64.NaN, 1.0, 0.5]
        b.sortDescending(stable: true)
        if (!(b[0] != b[0]) || b[1] != 2.0 || b[2] != 1.0 || b[3] != 0.5) {
            throw Exception("Array.sortDescending(stable): got ${b}")
        }
    }

    // ArrayList member APIs route through the std.collection copies
    @TestCase
    func arrayListSortDescending(): Unit {
        let l1 = ArrayList<Float64>([2.0, Float64.NaN, 1.0, 0.5])
        l1.sortDescending()
        if (!(l1[0] != l1[0]) || l1[1] != 2.0 || l1[2] != 1.0 || l1[3] != 0.5) {
            throw Exception("ArrayList.sortDescending: got ${l1}")
        }
        let l2 = ArrayList<Float64>([1.0, 2.0, Float64.NaN, 3.0])
        l2.sortDescending(stable: true)
        if (!(l2[0] != l2[0]) || l2[1] != 3.0 || l2[2] != 2.0 || l2[3] != 1.0) {
            throw Exception("ArrayList.sortDescending(stable): got ${l2}")
        }
        let l3 = ArrayList<Float64>([2.0, Float64.NaN, 1.0, 0.5])
        sort(l3, descending: true)
        if (!(l3[0] != l3[0]) || l3[1] != 2.0 || l3[2] != 1.0 || l3[3] != 0.5) {
            throw Exception("global sort(ArrayList, descending): got ${l3}")
        }
    }

    // The std.collection timSort copies must not run off the buffer when the
    // gallop phase exhausts a run on degenerate (NaN -> EQ) comparators.
    // Before the fix ArrayList.sort(stable: true) with a NaN-carrying Float
    // array of size > 64 could throw IndexOutOfBoundsException.
    @TestCase
    func collectionCopiesTerminateWithNaN(): Unit {
        for (n in 65..400) {
            let nanCount = (n - 1) / 5 + 1
            let l4 = ArrayList<Float64>()
            for (i in 0..n) {
                l4.add(if (i % 5 == 0) { Float64.NaN } else { Float64((i * 31) % 17) })
            }
            l4.sort(stable: true)
            if (l4.size != n || countNaNList(l4) != nanCount) {
                throw Exception("collection stable asc lost elements at n=${n}")
            }
            let l5 = ArrayList<Float64>()
            for (i in 0..n) {
                l5.add(if (i % 5 == 0) { Float64.NaN } else { Float64((i * 31) % 17) })
            }
            l5.sortBy(stable: true) {l: Float64, r: Float64 => l.compare(r)}
            if (l5.size != n || countNaNList(l5) != nanCount) {
                throw Exception("collection comparator stable lost elements at n=${n}")
            }
            let l6 = ArrayList<Float64>()
            for (i in 0..n) {
                l6.add(if (i % 5 == 0) { Float64.NaN } else { Float64((i * 31) % 17) })
            }
            l6.sort()
            if (l6.size != n || countNaNList(l6) != nanCount) {
                throw Exception("collection unstable asc lost elements at n=${n}")
            }
        }
    }

    // Arrays without NaN must keep the original descending behavior
    @TestCase
    func descendingNoNaNRegression(): Unit {
        let a: Array<Float64> = [3.0, 1.0, 4.0, 2.0]
        sort(a, descending: true)
        if (a != [4.0, 3.0, 2.0, 1.0]) {
            throw Exception("no-NaN descending unstable: got ${a}")
        }
        let b: Array<Float64> = [3.0, 1.0, 4.0, 2.0]
        sort(b, stable: true, descending: true)
        if (b != [4.0, 3.0, 2.0, 1.0]) {
            throw Exception("no-NaN descending stable: got ${b}")
        }
        let c: Array<Int64> = [3, 1, 2]
        sort(c, descending: true)
        if (c != [3, 2, 1]) {
            throw Exception("no-NaN Int descending: got ${c}")
        }
    }
}
