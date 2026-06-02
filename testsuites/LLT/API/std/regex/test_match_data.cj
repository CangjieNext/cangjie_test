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
}
