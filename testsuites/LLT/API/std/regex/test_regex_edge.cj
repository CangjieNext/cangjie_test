/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.regex.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class RegexEdgeTest {
    @TestCase
    func test_findall_group(): Unit {
        let regex = Regex("(\\w+)@(\\w+)")
        let results = regex.findAll("a@b c@d", group: true)
        @Expect(results.size == 2)
        let md0 = results[0]
        @Expect(md0.matchString() == "a@b")
        @Expect(md0.matchString(1) == "a")
        @Expect(md0.matchString(2) == "b")
        @Expect(md0.groupCount() == 2)
    }

    @TestCase
    func test_findall_zero_width(): Unit {
        let regex = Regex("a*")
        let results = regex.findAll("aaa")
        @Expect(results.size > 0)
    }

    @TestCase
    func test_replace_invalid_index(): Unit {
        let regex = Regex("hello")
        try {
            regex.replace("hello world", "bye", -1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
        try {
            regex.replace("hello world", "bye", 100)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }


    @TestCase
    func test_replace_no_match(): Unit {
        let regex = Regex("hello")
        let result = regex.replace("world", "bye")
        @Expect(result == "world")
    }

    @TestCase
    func test_replace_empty_input(): Unit {
        let regex = Regex("hello")
        try {
            regex.replace("", "bye")
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_replace_all_empty_input(): Unit {
        let regex = Regex("hello")
        let result = regex.replaceAll("", "bye")
        @Expect(result == "")
    }

    @TestCase
    func test_replace_all_limit(): Unit {
        let regex = Regex("a")
        @Expect(regex.replaceAll("aaa", "b", 0) == "aaa")
        @Expect(regex.replaceAll("aaa", "b", 2) == "bba")
        @Expect(regex.replaceAll("aaa", "b", -1) == "bbb")
    }

    @TestCase
    func test_split_no_match(): Unit {
        let regex = Regex("hello")
        let result = regex.split("world")
        @Expect(result.size == 1)
        @Expect(result[0] == "world")
    }

    @TestCase
    func test_split_limit_zero(): Unit {
        let regex = Regex(",")
        let result = regex.split("a,b,c,d", 0)
        @Expect(result.size == 4)
    }

    @TestCase
    func test_split_limit_negative(): Unit {
        let regex = Regex(",")
        let result = regex.split("a,b,c,d", -1)
        @Expect(result.size == 4)
    }

    @TestCase
    func test_named_groups_empty(): Unit {
        let regex = Regex("hello")
        let groups = regex.getNamedGroups()
        @Expect(groups.isEmpty())
    }

    @TestCase
    func test_named_groups_cache(): Unit {
        let regex = Regex("(?<name>\\w+)")
        let g1 = regex.getNamedGroups()
        let g2 = regex.getNamedGroups()
        @Expect(g1.size == g2.size)
    }

    @TestCase
    func test_named_groups_match(): Unit {
        let regex = Regex("(?<word>\\w+)")
        match (regex.find("hello world", group: true)) {
            case Some(md) =>
                @Expect(md.matchString("word") == "hello")
                let pos = md.matchPosition("word")
                @Expect(pos.start == 0)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_matchstring_invalid_index(): Unit {
        let regex = Regex("(a)(b)")
        match (regex.find("ab", group: true)) {
            case Some(md) =>
                try {
                    md.matchString(-1)
                    @Assert(false)
                } catch (e: IllegalArgumentException) {
                    @Assert(true)
                }
                try {
                    md.matchString(99)
                    @Assert(false)
                } catch (e: IllegalArgumentException) {
                    @Assert(true)
                }
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_matchstring_group_not_enabled(): Unit {
        let regex = Regex("(a)(b)")
        match (regex.find("ab")) {
            case Some(md) =>
                try {
                    md.matchString(1)
                    @Assert(false)
                } catch (e: IllegalArgumentException) {
                    @Assert(true)
                }
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_lazyfindall_zero_width(): Unit {
        let regex = Regex("a*")
        var count = 0
        for (md in regex.lazyFindAll("aaa")) {
            count++
        }
        @Expect(count > 0)
    }
}
