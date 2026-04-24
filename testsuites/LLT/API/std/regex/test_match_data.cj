/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE-0: %compiler %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*
import std.regex.*
import asan.*

@Test
public class MatcheDataTest {
    @TestCase
    func findAllWithGroup(): Unit {
        let regex = Regex("((((((k?))))))").matcher("sskkk")
        var matchData = regex.findAll().getOrThrow()
        var retStr = StringBuilder()
        for (i in matchData) {
            retStr.append(i.matchString())
            retStr.append(',')
            retStr.append(i.groupNumber().toString())
            retStr.append(' ')
        }
        @Expect(retStr.toString(),",6 ,6 k,6 k,6 k,6 ,6 ")
    }

    @TestCase
    func findWithGroup(): Unit {
        var regex = Regex("(a+c)(a?b)()(()?c+((e|s([a-h]*))))")
        var result = [
            ["aacbcsdedd", "[0, 10)"],
            ["aac", "[0, 3)"],
            ["b", "[3, 4)"],
            ["", "[4, 4)"],
            ["csdedd", "[4, 10)"],
            ["", "[4, 4)"],
            ["sdedd", "[5, 10)"],
            ["sdedd", "[5, 10)"],
            ["dedd", "[6, 10)"]
        ]
        var matcher = regex.matcher("aacbcsdedd")
        var matchData = matcher.find()
        match (matchData) {
            case Some(s) =>
                @Expect(s.groupNumber(), 8)

                for (i in 0..=s.groupNumber()) {
                    let matchStr = result[i][0]
                    let positionStr = result[i][1]
                    @Expect(s.matchString(i), matchStr)
                    var position = s.matchPosition(i)
                    @Expect("[${position.start}, ${position.end})", positionStr)
                }

            case None =>
                @Assert(false)
                ()
        }
        asanGC()
    }

    @TestCase
    func testGroupCountShouldBeFixed() {
        let str = "ab"
        let r = Regex("(?<x>a)|(?<y>b)")
        let results = r.findAll(str, group: true)
        @Assert(results.size, 2)
        let md1 = results[0]
        @Assert(md1.matchString(), "a")
        @Assert(md1.groupCount(), 2)
        let pos0 = md1.matchPosition(0)
        let pos1 = md1.matchPosition(1)
        @Assert(md1.matchString(2), "")
        let pos2 = md1.matchPosition(2)
        let posX = md1.matchPosition("x")
        @Assert(md1.matchString("y"), "")
        let posY = md1.matchPosition("y")
        let md2 = results[1]
        @Assert(md2.matchString(), "b")
        @Assert(md2.groupCount(), 2)
        let pos0_b = md2.matchPosition(0)
        @Assert(md2.matchString(1), "")
        let pos1_b = md2.matchPosition(1)
        @Assert(md2.matchString(2), "b")
        let pos2_b = md2.matchPosition(2)
        @Assert(md2.matchString("x"), "")
        let posX_b = md2.matchPosition("x")
        @Assert(md2.matchString("y"), "b")
        let posY_b = md2.matchPosition("y")
    }
}
