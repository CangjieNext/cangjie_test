/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*
import std.convert.*
import std.regex.*

/*
   Divide the StringSize length into times blocks. Each block consists of origin content and fixed content.
   params:
   times:Matching times
   stringSize:Length of the matched character string
   origin:string that can be matched once
   content:placeholder character
 */
func stringBlock(times: Int64, stringSize: Int64, origin: String, content: String): String {
    var blockLength: Int64 = stringSize / times
    var targetString = StringBuilder()
    for (i in 0..times) {
        targetString.append(origin)
        for (j in 0..(blockLength - origin.size)) {
            targetString.append(content)
        }
    }
    while (targetString.size < stringSize) {
        targetString.append(content)
    }
    return targetString.toString()
}

func generateString(regex: String, times: Int64, stringSize: Int64): (String,String) {
    return ("x|y", stringBlock(times, stringSize, "y", "z"))
}

var reps = 10000
var counts: ArrayList<Int64> = ArrayList<Int64>([1, 4, 32, 128])
var stringSizes: ArrayList<Int64> = ArrayList<Int64>([32, 256, 2 * 1024, 16 * 1024])
var repTimes: ArrayList<Int64> = ArrayList<Int64>(
    [
        100_0000,
        50_0000,
        8_0000,
        150_0000,
        50_0000,
        8_0000,
        2_5000,
        70_0000,
        50_0000,
        8_0000,
        2_0000,
        26_0000,
        20_0000,
        5_5000,
        1_5000
    ]
)

func benchmarkRegex_AllCount(mark: String, name: String, times: Int64, stringSize: Int64) {
    var (regexString, matchString) = generateString(mark, times, stringSize)
    var regex = Regex(regexString).matcher(matchString)
    var startTime = DateTime.now()

    for (i in 0..reps) {
        regex.allCount()
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkAllCount${name}_MatchCnt_${times.toString()}_${stringSize.toString()} ms: ${(perTime / Float64(1000000)).toString()}")
}

func benchmarkRegexAllCount(mark: String, name: String) {
    var i = 0
    for (stringSize in stringSizes) {
        for (times in counts) {
            if (stringSize >= times) {
                reps = repTimes[i]
                i++
                benchmarkRegex_AllCount(mark, name, times, stringSize)
            }
        }
    }
}

main(): Int64 {
    benchmarkRegexAllCount("|", "VerticalBar")
    return 0
}
