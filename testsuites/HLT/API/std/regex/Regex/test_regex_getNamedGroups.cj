/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*

@Test
public class RegexTest {
    func printMatchData(r: Regex, md: MatchData, group!: Bool = false) {
        println("found: `${md.matchString()}`")
        if (!group) {
            return
        }
        let groupCount = md.groupCount()
        for (i in 0..=groupCount) {
            let position = md.matchPosition(i)
            println("[${i}]\t@(${position.start}, ${position.end}) \t= ${md.matchString(i)} ")
        }
        for ((name, _) in r.getNamedGroups()) {
            let position = md.matchPosition(name)
            println("${name}\t@(${position.start}, ${position.end}) \t= ${md.matchString(name)} ")
        }
    }

    @TestCase
    func regex_init_01(): Unit {
        var input = "[A-Z0-9_-]+"
        var regex = Regex(input)

        input = "^[a-z1-9]+$\n^[B-Z0-9]+$"
        regex = Regex(input, [RegexFlag.MultiLine, RegexFlag.IgnoreCase, RegexFlag.Unicode])
    }

    @TestCase
    func regex_find_01(): Unit {
        let pattern = #"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})"#
        let subject = """
Days: 
2024-10-24
2024-12-25
2025-01-01      
...
"""
        let r = Regex(pattern)
        let matchdata = r.find(subject).getOrThrow()
        let matchdataAll = r.findAll(subject)
        let matchdataAll2 = r.findAll(subject, group: true)

        if (let Some(md) <- r.find(subject, group: true)) {
            printMatchData(r, md, group: true)
        }
        @Expect(matchdata.groupCount(),3)
        @Expect(matchdata.matchString(),"2024-10-24")
        @Expect(matchdataAll.size,3)


        //     }
        // }
        for (data in matchdataAll2) {
            try {
                data.matchPosition(4)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("Invalid group index"))
            }
        }
    }

    @TestCase
    func regex_find_02(): Unit {
        let pattern = #"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})"#
        let subject = """
Days: 
2024-10-24
2024-12-25
2025-01-01      
...
"""
        let r = Regex(pattern)
        let groups = r.getNamedGroups()
        let matchdata = r.find(subject).getOrThrow()
        let matchdata2 = r.find(subject, group: true).getOrThrow()
        for ((k, v) in groups) {
            matchdata2.matchPosition(k)
            try {
                matchdata2.matchPosition("")
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("not found"))
            }
            try {
                matchdata.matchPosition(k)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("Capture group not enabled"))
            }
        }
    }

    @TestCase
    func regex_matches_01(): Unit {
        let pattern = #"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})"#
        let subject = """
Days: 
2024-10-24
2024-12-25
2025-01-01      
...
"""
        let r = Regex(pattern)
        @Expect(r.matches(subject))
        @Expect(r.matches(""),false)
        @Expect(r.matches("2012-1-"),false)
        @Expect(r.matches("2012-1-1"),false)
        @Expect(r.matches("2012-01-30"),true)
    }

    @TestCase
    func regex_repalce_01(): Unit {
        let r = Regex("\\d")
        @Expect(r.replace("a1b1c2d3f4","X"),"aXb1c2d3f4")
        @Expect(r.replace("a1b1c2d3f4","X", 2),"a1bXc2d3f4")
        @Expect(r.replaceAll("a1b1c2d3f4","X"),"aXbXcXdXfX")
        @Expect(r.replaceAll("a1b1c2d3f4","X", 2),"aXbXc2d3f4")
        @Expect(r.replaceAll("a1b1c2d3f4","X", -1),"aXbXcXdXfX")
    }

    @TestCase
    func regex_split_01(): Unit {
        let r = Regex("\\d")
        @Expect(r.split("a1b1c2d3f4"),["a","b","c","d","f",""])
        @Expect(r.split("a1b1c2d3f4",7),["a","b","c","d","f",""])
        @Expect(r.split("a1b1c2d3f4",6),["a","b","c","d","f",""])
        @Expect(r.split("a1b1c2d3f4",5),["a","b","c","d","f4"])
        @Expect(r.split("a1b1c2d3f4",4),["a","b","c","d3f4"])
        @Expect(r.split("a1b1c2d3f4",3),["a","b","c2d3f4"])
        @Expect(r.split("a1b1c2d3f4",2),["a","b1c2d3f4"])
        @Expect(r.split("a1b1c2d3f4",1),["a1b1c2d3f4"])
        @Expect(r.split("a1b1c2d3f4",0),["a","b","c","d","f",""])
        @Expect(r.split("a1b1c2d3f4",-1),["a","b","c","d","f",""])
    }

    @TestCase
    func regex_split_02(): Unit {
        let subject = "0"
        let r = Regex("\\d")
        @Expect(r.split(subject),["",""])
        @Expect(r.split(subject,1),["0"])
    }

    @TestCase
    func regex_split_03(): Unit {
        let subject = "add"
        let r = Regex("\\d")
        @Expect(r.split(subject),["add"])
        @Expect(r.split(subject,1),["add"])
        @Expect(r.split(subject,0),["add"])
        @Expect(r.split(subject,-1),["add"])
    }
}
