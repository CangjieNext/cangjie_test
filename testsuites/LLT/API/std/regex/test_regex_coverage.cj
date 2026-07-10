/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt -Woff unused
// EXEC: %run %run_opt %output %run_utest_opt

import std.regex.*
import std.collection.*

/*
 * Branch-focused coverage for std.regex regex.cj match/find/replace paths.
 */
@Test
class RegexCoverageTest {
    @TestCase
    func testFindAndMatches(): Unit {
        let re = Regex("a(b+)c")
        @Expect(re.find("xxabcyy").isSome(), true)
        @Expect(re.find("no-match").isNone(), true)
        @Expect(re.matches("abc"), true)
        @Expect(re.matches("abbbc"), true)
        @Expect(re.matches("acb"), false)
    }

    @TestCase
    func testFindAllAndLazyFindAll(): Unit {
        let re = Regex("\\d+")
        let input = "a1b22c333"
        @Expect(re.findAll(input).size, 3)
        var count: Int64 = 0
        for (_ in re.lazyFindAll(input)) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testReplaceAndSplit(): Unit {
        let re = Regex("\\s+")
        @Expect(re.replaceAll("a  b   c", " "), "a b c")
        @Expect(re.split("a  b   c").size, 3)
    }

    @TestCase
    func testRegexOptionsAndGroups(): Unit {
        let re = Regex("(?i)abc")
        @Expect(re.matches("ABC"), true)
        let grouped = Regex("(a)(b*)")
        if (let Some(m) <- grouped.find("abbb")) {
            @Expect(m.groupCount() >= 2, true)
        }
    }

    @TestCase
    func testWholeLineAndAnchors(): Unit {
        let re = Regex("^start.*end$")
        @Expect(re.matches("start-middle-end"), true)
        @Expect(re.matches("start-middle"), false)
        let word = Regex("\\bword\\b")
        @Expect(word.find("a word here").isSome(), true)
    }
}
