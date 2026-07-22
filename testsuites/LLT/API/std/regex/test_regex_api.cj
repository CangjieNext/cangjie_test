/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.regex.*
import std.collection.*

@Test
public class RegexApiTest {
    @TestCase
    func test_regex_matches(): Unit {
        let regex = Regex("hello")
        @Expect(regex.matches("hello"))
        @Expect(!regex.matches("world"))
        // matches does a partial match from the beginning
        @Expect(regex.matches("hello world"))
        @Expect(!regex.matches(""))
    }

    @TestCase
    func test_regex_find(): Unit {
        let regex = Regex("world")
        let result = regex.find("hello world")
        match (result) {
            case Some(md) =>
                @Expect(md.matchString(), "world")
            case None =>
                @Assert(false)
        }
        @Expect(regex.find("hello").isNone())
    }

    @TestCase
    func test_regex_find_with_group(): Unit {
        let regex = Regex("([a-z]+)([0-9]+)")
        let result = regex.find("abc123", group: true)
        match (result) {
            case Some(md) =>
                @Expect(md.matchString(), "abc123")
                @Expect(md.groupCount(), 2)
                @Expect(md.matchString(1), "abc")
                @Expect(md.matchString(2), "123")
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_regex_replace(): Unit {
        let regex = Regex("o")
        @Expect(regex.replace("foo bar", "0"), "f0o bar")
        // replace from index 2
        @Expect(regex.replace("foo bar", "0", 2), "fo0 bar")
    }

    @TestCase
    func test_regex_replaceAll(): Unit {
        let regex = Regex("o")
        @Expect(regex.replaceAll("foo bar", "0"), "f00 bar")
        // with limit
        @Expect(regex.replaceAll("foo bar", "0", 1), "f0o bar")
        // limit 0 returns input unchanged
        @Expect(regex.replaceAll("foo bar", "0", 0), "foo bar")
    }

    @TestCase
    func test_regex_split(): Unit {
        let regex = Regex(",")
        let parts = regex.split("a,b,c")
        @Expect(parts.size, 3)
        @Expect(parts[0], "a")
        @Expect(parts[1], "b")
        @Expect(parts[2], "c")
        // split with limit
        let parts2 = regex.split("a,b,c", 2)
        @Expect(parts2.size, 2)
        @Expect(parts2[0], "a")
        @Expect(parts2[1], "b,c")
    }

    @TestCase
    func test_regex_lazyFindAll(): Unit {
        let regex = Regex("o")
        var count = 0
        for (md in regex.lazyFindAll("foo bar")) {
            @Expect(md.matchString(), "o")
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_regex_findAll(): Unit {
        let regex = Regex("[0-9]+")
        let mds = regex.findAll("a1b2c3")
        @Expect(mds.size, 3)
        @Expect(mds[0].matchString(), "1")
        @Expect(mds[1].matchString(), "2")
        @Expect(mds[2].matchString(), "3")
    }

    @TestCase
    func test_regex_getNamedGroups(): Unit {
        let regex = Regex("(?<word>[a-z]+)")
        let groups = regex.getNamedGroups()
        @Expect(groups.get("word").getOrThrow(), 1)
    }

    @TestCase
    func test_regex_string_method(): Unit {
        let pattern = "hello"
        let regex = Regex(pattern)
        @Expect(regex.string(), pattern)
    }
}
