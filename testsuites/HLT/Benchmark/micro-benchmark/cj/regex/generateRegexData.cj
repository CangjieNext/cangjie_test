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

var charsRegex = ["*", ".", "+", "?", "^", "$", "|", "{}", "[]", "\\d", "\\w", "\\s"]

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
    if (regex == charsRegex[0]) {
        return ("zo*", stringBlock(times, stringSize, "zo", "X"))
    } else if (regex == charsRegex[1]) {
        return ("zo.", stringBlock(times, stringSize, "zo", "f"))
    } else if (regex == charsRegex[2]) {
        return ("zo+", stringBlock(times, stringSize, "zo", "z"))
    } else if (regex == charsRegex[3]) {
        return ("zo?", stringBlock(times, stringSize, "zo", "f"))
    } else if (regex == charsRegex[4]) {
        var targetString = "zo"

        // The initial targetString is 2, the length of the constructed string is equal to stringSize, and the number of iterators is equal to stringSize-2.
        for (i in 0..(stringSize - 2)) {
            targetString = targetString + "n"
        }
        return ("^zo", targetString)
    } else if (regex == charsRegex[5]) {
        var targetString = ""

        // The initial targetString is 2, the length of the constructed string is equal to stringSize, and the number of iterators is equal to stringSize-2.
        for (i in 0..(stringSize - 2)) {
            targetString = targetString + "n"
        }
        return ("zo$", "${targetString}zo")
    } else if (regex == charsRegex[6]) {
        return ("x|y", stringBlock(times, stringSize, "y", "z"))
    } else if (regex == charsRegex[7]) {
        return ("y{2}", stringBlock(times, stringSize, "yy", "z"))
    } else if (regex == charsRegex[8]) {
        return ("[x|y]", stringBlock(times, stringSize, "xa", "z"))
    } else if (regex == charsRegex[9]) {
        return (charsRegex[9], stringBlock(times, stringSize, "1", "X"))
    } else if (regex == charsRegex[10]) {
        return (charsRegex[10], stringBlock(times, stringSize, "_", "X"))
    } else if (regex == charsRegex[11]) {
        return (charsRegex[11], stringBlock(times, stringSize, " ", "X"))
    } else {
        return ("null", "null")
    }
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

func benchmarkRegexMark(mark: String, name: String, times: Int64, stringSize: Int64) {
    var (regexString, matchString) = generateString(mark, times, stringSize)
    var regex = Regex(regexString).matcher(matchString)
    var startTime = DateTime.now()

    for (i in 0..(reps/10)) {
        regex.findAll()
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64((reps/10))
    println("BenchmarkRegex${name}_MatchCnt_${times.toString()}_${stringSize.toString()}: ${perTime.format(".2")} ns/op")
}

func benchmarkRegex(mark: String, name: String) {
    var i = 0
    for (stringSize in stringSizes) {
        for (times in counts) {
            if (stringSize >= times) {
                reps = repTimes[i]
                i++
                benchmarkRegexMark(mark, name, times, stringSize)
            }
        }
    }
}

func benchmarkRegex_AllCount(mark: String, name: String, times: Int64, stringSize: Int64) {
    var (regexString, matchString) = generateString(mark, times, stringSize)
    var regex = Regex(regexString).matcher(matchString)
    var startTime = DateTime.now()

    for (i in 0..reps) {
        regex.allCount()
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkAllCount${name}_MatchCnt_${times.toString()}_${stringSize.toString()}: ${perTime.format(".2")} ns/op")
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

func benchmarkRegex_ReplaceAll(mark: String, name: String, times: Int64, stringSize: Int64) {
    var (regexString, matchString) = generateString(mark, times, stringSize)
    var regex = Regex(regexString).matcher(matchString)
    var startTime = DateTime.now()

    for (i in 0..reps) {
        regex.replaceAll("ZO")
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkReplaceAll${name}_MatchCnt_${times.toString()}_${stringSize.toString()}: ${perTime.format(".2")} ns/op")
}

func benchmarkRegexReplaceAll(mark: String, name: String) {
    var i = 0
    for (stringSize in stringSizes) {
        for (times in counts) {
            if (stringSize >= times) {
                reps = repTimes[i]
                i++
                benchmarkRegex_ReplaceAll(mark, name, times, stringSize)
            }
        }
    }
}
