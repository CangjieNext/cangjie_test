/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt -Woff unused
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * Branch-focused coverage for std.core string.cj search/split/trim/pad APIs.
 */
@Test
class CoreStringCoverageTest {
    @TestCase
    func testIndexOfAndLastIndexOfBranches(): Unit {
        let s = "abcabcabc"
        @Expect(s.indexOf("bc"), Some(1))
        @Expect(s.indexOf("bc", 3), Some(4))
        @Expect(s.indexOf("zzz"), None)
        @Expect(s.lastIndexOf("bc"), Some(7))
        @Expect(s.indexOf(97), Some(0))
        @Expect(s.lastIndexOf(99), Some(8))
        @Expect(s.count("abc"), 3)
    }

    @TestCase
    func testSplitReplaceAndContains(): Unit {
        let s = "a,,b,c"
        @Expect(s.split(",").size, 4)
        @Expect(s.split(",", 2).size, 2)
        @Expect(s.split(",", removeEmpty: true).size, 3)
        @Expect(s.replace("a", "z").startsWith("z"), true)
        @Expect(s.contains("b"), true)
        @Expect(s.startsWith("a"), true)
        @Expect(s.endsWith("c"), true)
        @Expect("hello".removePrefix("he"), "llo")
        @Expect("hello".removeSuffix("lo"), "hel")
    }

    @TestCase
    func testTrimPadAndAsciiCase(): Unit {
        let s = "  Hi  "
        @Expect(s.trimAscii(), "Hi")
        @Expect(s.trimAsciiStart(), "Hi  ")
        @Expect(s.trimAsciiEnd(), "  Hi")
        @Expect("ab".padStart(5, padding: "0"), "000ab")
        @Expect("ab".padEnd(5, padding: "-"), "ab---")
        @Expect("AbC".toAsciiLower(), "abc")
        @Expect("AbC".toAsciiUpper(), "ABC")
        @Expect("hello world".toAsciiTitle().startsWith("Hello"), true)
        @Expect("AbC".equalsIgnoreAsciiCase("aBc"), true)
    }

    @TestCase
    func testCompareHashAndRunes(): Unit {
        let a = "alpha"
        let b = "beta"
        @Expect(a.compare(b), Ordering.LT)
        @Expect(a < b, true)
        @Expect(a.hashCode() != b.hashCode(), true)
        @Expect(a.isAscii(), true)
        @Expect(a.isAsciiBlank(), false)
        @Expect("   ".isAsciiBlank(), true)
        @Expect(a.toRuneArray().size > 0, true)
        @Expect(a.clone() == a, true)
    }

    @TestCase
    func testLinesAndLazySplit(): Unit {
        let s = "one\ntwo\nthree"
        var lineCount: Int64 = 0
        for (_ in s.lines()) {
            lineCount++
        }
        @Expect(lineCount, 3)
        var splitCount: Int64 = 0
        for (_ in s.lazySplit("\n")) {
            splitCount++
        }
        @Expect(splitCount, 3)
        @Expect(String.empty.isEmpty(), true)
    }
}
