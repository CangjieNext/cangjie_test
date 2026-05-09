/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: unset LD_LIBRARY_PATH && %output %run_args | compare %f
// ASSERT:scan 0

main(): Int64 {
    expectEquals(4, opt_TestLostCopy())
    expectEquals(-10, opt_TestTwoLive())
    expectEquals(-20, opt_TestThreeLive())
    expectEquals(5, opt_TestFourLive())
    expectEquals(10, opt_TestMultipleLive())
    expectEquals(1, opt_TestWithBreakAndContinue())
    expectEquals(-15, opt_testSpillInIf(5, 6, 7))
    expectEquals(-567, opt_TestAgressiveLive1(1, 2, 3, 4, 5, 6, 7))
    expectEquals(-77, opt_TestAgressiveLive2(1, 2, 3, 4, 5, 6, 7))

    expectEquals(-55834574850, opt_testSpillInIf(5, 6 << 32, 7 << 32))
    expectEquals(-73014444553, opt_TestAgressiveLive1(1 << 32, (1 << 32) + 1, 3 << 32, 4 << 32, 5 << 32, 6 << 32,
        (1 << 32) + 2))
    expectEquals(-124554051632, opt_TestAgressiveLive2(1 << 32, (1 << 32) + 1, 3 << 32, 4 << 32, 5 << 32, 6 << 32,
        7 << 32))

    print((0).toString())
    return 0
}

func opt_TestLostCopy(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    do {
        b = a
        a++
    } while (a != 5)
    return b
}

func opt_TestTwoLive(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    do {
        a++
        b += 3
    } while (a != 5)
    return a - b
}

func opt_TestThreeLive(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    var c: Int64 = 0
    do {
        a++
        b += 3
        c += 2
    } while (a != 5)
    return a - b - c
}

func opt_TestFourLive(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    var c: Int64 = 0
    var d: Int64 = 0
    do {
        a++
        b += 3
        c += 2
        d++
    } while (a != 5)
    return d
}

func opt_TestMultipleLive(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    var c: Int64 = 0
    var d: Int64 = 0
    var e: Int64 = 0
    var f: Int64 = 0
    var g: Int64 = 0
    do {
        a++
        b++
        c++
        d++
        e += 3
        f += 2
        g += 2
    } while (a != 5)
    return f
}

func opt_TestWithBreakAndContinue(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 0
    do {
        a++
        if (a == 2) {
            continue
        }
        b++
        if (a == 5) {
            break
        }
    } while (true)
    return a - b
}

func opt_testSpillInIf(a: Int64, b: Int64, c: Int64): Int64 {
    var d: Int64 = 0
    var e: Int64 = 0
    var m: Int64 = b
    var n: Int64 = c
    if (a == 5) {
        m++
        n++
        d += 2
        e += 3
    }

    return a - m - n - d - e
}

func opt_TestAgressiveLive1(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64): Int64 {
    var h: Int64 = a - b
    var i: Int64 = c - d
    var j: Int64 = e - f
    var k: Int64 = 42 + g - a
    var m: Int64 = b
    do {
        m++
        while (k != 1) {
            k--
            i++
            if (i == 9) {
                i++
            }
            j += 5
        }
        k = 9
        h++
    } while (h != 5)
    return a - m - c - d - e - f - g - h - i - j - k
}

func opt_TestAgressiveLive2(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64): Int64 {
    var h: Int64 = a - b
    var i: Int64 = c - d
    var j: Int64 = e - f
    var k: Int64 = 42 + g - a
    do {
        h++
    } while (h != 5)
    return a - b - c - d - e - f - g - h - i - j - k
}

func expectEquals(expected: Int64, value: Int64) {
    if (expected != value) {
        throw Exception("Expected: " + expected.toString() + ", got: " + value.toString())
    }
}
