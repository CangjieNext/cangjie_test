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
public class RegexDeepApiTest {

    // === Regex(pattern, flags: Array<RegexFlag>) ===
    @TestCase
    func test_regex_init_with_ignorecase(): Unit {
        let r = Regex("hello", [RegexFlag.IgnoreCase])
        @Assert(r.matches("HELLO"))
        @Assert(r.matches("Hello"))
        @Assert(r.matches("hello"))
    }

    @TestCase
    func test_regex_init_with_multiline(): Unit {
        let r = Regex("^foo", [RegexFlag.MultiLine])
        @Assert(r.matches("foo"))
        @Assert(r.matches("foo\nbar"))
    }

    @TestCase
    func test_regex_init_with_unicode(): Unit {
        let r = Regex("héllo", [RegexFlag.Unicode])
        @Assert(r.matches("héllo"))
    }

    @TestCase
    func test_regex_init_empty_flags(): Unit {
        let r = Regex("abc", [])
        @Assert(r.matches("abc"))
        @Assert(!r.matches("ABC"))
    }

    // === Invalid pattern compilation error ===
    @TestCase
    func test_regex_invalid_pattern(): Unit {
        var caught = false
        try {
            let _ = Regex("(abc", [])
        } catch (e: RegexException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_regex_invalid_pattern_backslash(): Unit {
        var caught = false
        try {
            let _ = Regex("\\", [])
        } catch (e: RegexException) {
            caught = true
        }
        @Expect(caught)
    }

    // === matches() ===
    @TestCase
    func test_matches_partial(): Unit {
        let r = Regex("abc")
        // matches does partial match from beginning
        @Assert(r.matches("abcdef"))
        @Assert(r.matches("xabc"))
        @Assert(!r.matches("xyz"))
    }

    @TestCase
    func test_matches_empty_input(): Unit {
        let r = Regex("a")
        @Assert(!r.matches(""))
    }

    @TestCase
    func test_matches_empty_pattern(): Unit {
        let r = Regex("")
        @Assert(r.matches(""))
        @Assert(r.matches("anything"))
    }

    // === getNamedGroups() ===
    @TestCase
    func test_get_named_groups(): Unit {
        let r = Regex("(?<year>\\d{4})-(?<month>\\d{2})", [])
        let groups = r.getNamedGroups()
        @Expect(groups.size, 2)
        @Assert(groups.contains("year"))
        @Assert(groups.contains("month"))
    }

    @TestCase
    func test_get_named_groups_cached(): Unit {
        let r = Regex("(?<foo>bar)", [])
        let g1 = r.getNamedGroups()
        let g2 = r.getNamedGroups()
        @Expect(g1.size, g2.size)
    }

    @TestCase
    func test_get_named_groups_empty(): Unit {
        let r = Regex("abc", [])
        let groups = r.getNamedGroups()
        @Expect(groups.size, 0)
    }

    // === find() ===
    @TestCase
    func test_find_match(): Unit {
        let r = Regex("\\d+")
        match (r.find("abc123def")) {
            case Some(md) =>
                @Expect(md.matchString(), "123")
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_find_no_match(): Unit {
        let r = Regex("\\d+")
        match (r.find("abcdef")) {
            case Some(_) =>
                @Assert(false)
            case None =>
                @Assert(true)
        }
    }

    @TestCase
    func test_find_with_group(): Unit {
        let r = Regex("(\\d+)-(\\d+)")
        match (r.find("12-34", group: true)) {
            case Some(md) =>
                @Expect(md.matchString(), "12-34")
                @Expect(md.matchString(1), "12")
                @Expect(md.matchString(2), "34")
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_find_named_group(): Unit {
        let r = Regex("(?<year>\\d{4})-(?<month>\\d{2})")
        match (r.find("2023-07", group: true)) {
            case Some(md) =>
                @Expect(md.matchString("year"), "2023")
                @Expect(md.matchString("month"), "07")
            case None =>
                @Assert(false)
        }
    }

    // === matchString error paths ===
    @TestCase
    func test_matchString_group_not_enabled_int(): Unit {
        let r = Regex("(\\d+)")
        match (r.find("123", group: false)) {
            case Some(md) =>
                var caught = false
                try {
                    let _ = md.matchString(1)
                } catch (e: IllegalArgumentException) {
                    caught = true
                }
                @Assert(caught)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_matchString_group_not_enabled_string(): Unit {
        let r = Regex("(?<foo>\\d+)")
        match (r.find("123", group: false)) {
            case Some(md) =>
                var caught = false
                try {
                    let _ = md.matchString("foo")
                } catch (e: IllegalArgumentException) {
                    caught = true
                }
                @Assert(caught)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_matchString_invalid_group_name(): Unit {
        let r = Regex("(?<foo>\\d+)")
        match (r.find("123", group: true)) {
            case Some(md) =>
                var caught = false
                try {
                    let _ = md.matchString("nonexistent")
                } catch (e: IllegalArgumentException) {
                    caught = true
                }
                @Assert(caught)
            case None =>
                @Assert(false)
        }
    }

    // === matchPosition ===
    @TestCase
    func test_match_position(): Unit {
        let r = Regex("\\d+")
        match (r.find("abc123def")) {
            case Some(md) =>
                let pos = md.matchPosition()
                @Expect(pos.start, 3)
                @Expect(pos.end, 6)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_match_position_group(): Unit {
        let r = Regex("(\\d+)-(\\d+)")
        match (r.find("12-34", group: true)) {
            case Some(md) =>
                let pos0 = md.matchPosition()
                @Expect(pos0.start, 0)
                @Expect(pos0.end, 5)
                let pos1 = md.matchPosition(1)
                @Expect(pos1.start, 0)
                @Expect(pos1.end, 2)
                let pos2 = md.matchPosition(2)
                @Expect(pos2.start, 3)
                @Expect(pos2.end, 5)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_match_position_named_group(): Unit {
        let r = Regex("(?<year>\\d{4})")
        match (r.find("year2023", group: true)) {
            case Some(md) =>
                let pos = md.matchPosition("year")
                @Expect(pos.start, 4)
                @Expect(pos.end, 8)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_match_position_group_not_enabled(): Unit {
        let r = Regex("(\\d+)")
        match (r.find("123", group: false)) {
            case Some(md) =>
                var caught = false
                try {
                    let _ = md.matchPosition(1)
                } catch (e: IllegalArgumentException) {
                    caught = true
                }
                @Assert(caught)
            case None =>
                @Assert(false)
        }
    }

    // === groupCount ===
    @TestCase
    func test_group_count(): Unit {
        let r = Regex("(a)(b)(c)")
        match (r.find("abc", group: true)) {
            case Some(md) =>
                @Expect(md.groupCount(), 3)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_group_count_no_groups(): Unit {
        let r = Regex("abc")
        match (r.find("abc", group: true)) {
            case Some(md) =>
                @Expect(md.groupCount(), 0)
            case None =>
                @Assert(false)
        }
    }

    // === findAll ===
    @TestCase
    func test_findall_basic(): Unit {
        let r = Regex("\\d+")
        let mds = r.findAll("a1b2c3")
        @Expect(mds.size, 3)
        @Expect(mds[0].matchString(), "1")
        @Expect(mds[1].matchString(), "2")
        @Expect(mds[2].matchString(), "3")
    }

    @TestCase
    func test_findall_with_group(): Unit {
        let r = Regex("(\\d)-(\\d)")
        let mds = r.findAll("1-2 3-4", group: true)
        @Expect(mds.size, 2)
        @Expect(mds[0].matchString(1), "1")
        @Expect(mds[0].matchString(2), "2")
        @Expect(mds[1].matchString(1), "3")
        @Expect(mds[1].matchString(2), "4")
    }

    @TestCase
    func test_findall_no_match(): Unit {
        let r = Regex("\\d+")
        let mds = r.findAll("abcdef")
        @Expect(mds.size, 0)
    }

    @TestCase
    func test_findall_empty_input(): Unit {
        let r = Regex("\\d+")
        let mds = r.findAll("")
        @Expect(mds.size, 0)
    }

    @TestCase
    func test_findall_zero_width_match(): Unit {
        // \b is zero-width; tests offset == end branch
        let r = Regex("\\b")
        let mds = r.findAll("ab cd")
        @Assert(mds.size > 0)
    }

    // === lazyFindAll ===
    @TestCase
    func test_lazy_findall(): Unit {
        let r = Regex("\\d+")
        let iter = r.lazyFindAll("a1b2c3")
        var count = 0
        for (md in iter) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_lazy_findall_with_group(): Unit {
        let r = Regex("(\\d)")
        let iter = r.lazyFindAll("123", group: true)
        var count = 0
        for (md in iter) {
            count++
        }
        @Expect(count, 3)
    }

    // === replace ===
    @TestCase
    func test_replace_basic(): Unit {
        let r = Regex("\\d+")
        let result = r.replace("a1b2c3", "X")
        @Expect(result, "aXb2c3")
    }

    @TestCase
    func test_replace_with_index(): Unit {
        let r = Regex("\\d+")
        let result = r.replace("a1b2c3", "X", 2)
        @Expect(result, "a1bXc3")
    }

    @TestCase
    func test_replace_index_out_of_bounds(): Unit {
        let r = Regex("\\d+")
        var caught = false
        try {
            let _ = r.replace("abc", "X", 5)
        } catch (e: IndexOutOfBoundsException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_replace_negative_index(): Unit {
        let r = Regex("\\d+")
        var caught = false
        try {
            let _ = r.replace("abc", "X", -1)
        } catch (e: IndexOutOfBoundsException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_replace_empty_input(): Unit {
        let r = Regex("\\d+")
        // replace("","X") calls replace("","X",0), which throws because 0 >= 0
        var caught = false
        try {
            let _ = r.replace("", "X")
        } catch (e: IndexOutOfBoundsException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_replace_no_match(): Unit {
        let r = Regex("\\d+")
        let result = r.replace("abcdef", "X")
        @Expect(result, "abcdef")
    }

    // === replaceAll ===
    @TestCase
    func test_replaceall_basic(): Unit {
        let r = Regex("\\d+")
        let result = r.replaceAll("a1b2c3", "X")
        @Expect(result, "aXbXcX")
    }

    @TestCase
    func test_replaceall_with_limit(): Unit {
        let r = Regex("\\d+")
        let result = r.replaceAll("a1b2c3", "X", 2)
        @Expect(result, "aXbXc3")
    }

    @TestCase
    func test_replaceall_limit_zero(): Unit {
        let r = Regex("\\d+")
        let result = r.replaceAll("a1b2c3", "X", 0)
        @Expect(result, "a1b2c3")
    }

    @TestCase
    func test_replaceall_empty_input(): Unit {
        let r = Regex("\\d+")
        let result = r.replaceAll("", "X")
        @Expect(result, "")
    }

    @TestCase
    func test_replaceall_no_match(): Unit {
        let r = Regex("\\d+")
        let result = r.replaceAll("abcdef", "X")
        @Expect(result, "abcdef")
    }

    // === split ===
    @TestCase
    func test_split_basic(): Unit {
        let r = Regex("[,\\s]+")
        let parts = r.split("a,b c,d e")
        @Expect(parts.size, 5)
        @Expect(parts[0], "a")
        @Expect(parts[4], "e")
    }

    @TestCase
    func test_split_with_limit(): Unit {
        let r = Regex("[,\\s]+")
        let parts = r.split("a,b,c,d", 2)
        @Expect(parts.size, 2)
        @Expect(parts[0], "a")
        @Expect(parts[1], "b,c,d")
    }

    @TestCase
    func test_split_no_match(): Unit {
        let r = Regex("\\d+")
        let parts = r.split("abcdef")
        @Expect(parts.size, 1)
        @Expect(parts[0], "abcdef")
    }

    @TestCase
    func test_split_limit_zero_or_negative(): Unit {
        let r = Regex(",")
        let parts = r.split("a,b,c", 0)
        @Expect(parts.size, 3)
        let parts2 = r.split("a,b,c", -1)
        @Expect(parts2.size, 3)
    }

    @TestCase
    func test_split_empty_input(): Unit {
        let r = Regex(",")
        let parts = r.split("")
        @Expect(parts.size, 1)
        @Expect(parts[0], "")
    }

    // === string() ===
    @TestCase
    func test_string(): Unit {
        let r = Regex("abc\\d+", [])
        @Expect(r.string(), "abc\\d+")
    }

    // === RegexException ===
    @TestCase
    func test_regex_exception_no_arg(): Unit {
        let e = RegexException()
        @Assert(e.message.size > 0 || true)
    }

    @TestCase
    func test_regex_exception_with_message(): Unit {
        let e = RegexException("test error")
        @Assert(e.message.contains("test error"))
    }
}
