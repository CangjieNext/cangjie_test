/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.regex.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Regex {
    @TestCase
    func case1(): Unit {
        // init(s: String), IllegalArgumentException
        var count = 0
        try {
            var rule = Regex(" \0 ")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 0)

        // init(s: String), 无效正则表达式，RegexException
        try {
            var rule = Regex("[ ")
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 1)

        // init(s: String), 无效正则表达式，RegexException
        try {
            var rule = Regex(") ")
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 2)

        // init(s: String, option: RegexOption), IllegalArgumentException
        try {
            var rule = Regex(" \0 ", RegexOption().ignoreCase())
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 2)

        // init(s: String, option: RegexOption), 无效正则表达式，RegexException
        try {
            var rule = Regex("[ ", RegexOption().ignoreCase())
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 3)
    }

    @TestCase
    func case2(): Unit {
        // matcher(input: String): Matcher, IllegalArgumentException
        var count = 0
        try {
            var matcher = Regex("ABC123").matcher("\0")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 0)

        // matcher(input: String): Matcher, RegexException
        try {
            var matcher = Regex("[ ").matcher("ABC123")
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case3(): Unit {
        // matches(input: String): Option<MatchData>, IllegalArgumentException
        var count = 0
        try {
            var matcher = Regex("ABC123").matcher("\0").fullMatch()
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 0)

        // matches(input: String): Option<MatchData>, RegexException
        try {
            var matcher = Regex("[ ").matcher("ABC123").fullMatch()
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case4(): Unit {
        // init(re: Regex, input: String), 空字符
        var count = 0
        try {
            var rule = Regex("ABCabc", RegexOption().ignoreCase())
            var pattern = "abc\0123"
            var matcher = Matcher(rule, pattern)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 0)

        // init(re: Regex, input: String), 语法错误
        try {
            var rule = Regex("ABCabc", RegexOption().ignoreCase())
            var matcher = Matcher(Regex("[", RegexOption().ignoreCase()), "abc")
        } catch (e: RegexException) {
            count += 1
        }
        @Expect(count, 1)
    }

    @TestCase
    func case5(): Unit {
        var count = 0
        // fullMatch(): Option<MatchData>, 全匹配
        var rule = Regex("ab{0,}bc")
        var pattern = "abbbbc"
        var matcher = Matcher(rule, pattern)
        var res1 = matcher.fullMatch().getOrThrow().matchString()
        @Expect(res1, "abbbbc")

        // matchStart(): Option<MatchData>, 全匹配
        var res2 = matcher.matchStart().getOrThrow().matchString()
        @Expect(res2, "abbbbc")

        // func find(index: Int64): Option<MatchData>, index小于0
        let rule2 = "abc[0-9]"
        let pattern2 = "abc1abc2abc3"
        let regex2 = Regex(rule2, RegexOption().multiLine())
        let matcher2 = Matcher(regex2, pattern2)
        try {
            let res2 = matcher2.find(-1).getOrThrow()
        } catch (e: IndexOutOfBoundsException) {
            count += 1
        }
        @Expect(count, 1)

        // func find(index: Int64): Option<MatchData>, index大于pattern.size
        let rule3 = "abca()"
        let pattern3 = "argvsvbb1sfsa"
        let regex3 = Regex(rule3, RegexOption().multiLine())
        let matcher3 = Matcher(regex3, pattern3)
        try {
            let res3 = matcher3.find(13).getOrThrow()
        } catch (e: IndexOutOfBoundsException) {
            count += 1
        }
        @Expect(count, 2)
    }

    // `\0` 不再校验，API文档内已添加描述
    @Skip
    @TestCase
    func case6(): Unit {
        var count = 0
        // func replace(replacement: String): String, 参数为空字符
        let rule1 = "\\Ba\\B"
        let pattern1 = "Bbnaralsfsa"
        let regex1 = Regex(rule1, RegexOption())
        let matcher1 = Matcher(regex1, pattern1)
        try {
            let res1 = matcher1.replace("abc\0123")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 1)

        // func replace(replacement: String， index: Int64): String, 参数为空字符
        let rule2 = "bac$"
        let pattern2 = "bnaralsfsa"
        let regex2 = Regex(rule2, RegexOption().ignoreCase())
        let matcher2 = Matcher(regex2, pattern2)
        try {
            let res2 = matcher2.replace("abc\0123", 0)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 2)

        // func replaceAll(replacement: String): String, 参数为空字符
        let rule3 = "bac$a()"
        let pattern3 = "bnaralsfsa"
        let regex3 = Regex(rule3, RegexOption().ignoreCase())
        let matcher3 = Matcher(regex3, pattern3)
        try {
            let res3 = matcher3.replaceAll("st2\00")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 3)

        // func replaceAll(replacement: String， limit: Int64): String, 参数为空字符
        let rule4 = "bac$a()"
        let pattern4 = "bnaralsfsa"
        let regex4 = Regex(rule4, RegexOption().ignoreCase())
        let matcher4 = Matcher(regex4, pattern4)
        try {
            let res4 = matcher4.replaceAll("st2\00", 0)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 4)

        // func resetString(input: String): Matcher, 参数为空字符
        let rule5 = "bac$a()"
        let pattern5 = "bnaralsfsa"
        let regex5 = Regex(rule5, RegexOption().ignoreCase())
        let matcher5 = Matcher(regex5, pattern5)
        try {
            let res5 = matcher5.resetString(" \0 ")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 5)
    }
}
