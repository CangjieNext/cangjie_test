/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regexString = ""
    var matchString = "ggggg7fgggg"
    var regex1 = Regex(regexString)
    var matchDatalist1 = Matcher(regex1, matchString).split(0) //limit=0
    var matchDatalist2 = regex1.matcher(matchString).split(-1) //limit<0,Split into single characters
    var matchDatalist3 = Matcher(regex1, matchString).split(2) //limit>0,Split into 2 strings
    println(matchDatalist3)

    if (matchDatalist1.size != 13 || matchDatalist2.size != 13 || matchDatalist3.size != 2) {
        print("Part1\n")
        print("${matchDatalist1.size}+${matchDatalist2.size}+${matchDatalist3.size}\n")
        return 1
    }

    for (i in 0..(matchString.size - 1)) {
        if (matchDatalist1[i + 1] != Rune(UInt32(matchString[i])).toString()) {
            print("Part2+${matchDatalist1[i]}\n")
            return 2
        }
    }

    for (i in 0..(matchString.size - 1)) {
        if (matchDatalist2[i + 1] != Rune(UInt32(matchString[i])).toString()) {
            print("Part3+${matchDatalist2[i]}\n")
            return 3
        }
    }
    if (matchDatalist3[0] != "" || matchDatalist3[1] != "ggggg7fgggg") {
        print("Part4+matchDatalist3[0]+${matchDatalist3[1]}\n")
        return 4
    }
    print("success\n")
    asan()
    return 0
}

func asan() {
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.millisecond * 100)
        GC()
        sleep(Duration.millisecond * 100)
    }
}
