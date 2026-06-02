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
    var regexString = "[0-9][a-z]"
    var matchString = "a6Ud879sd4j5Uu"
    var replaceString = "ddd"
    var limit1 = -1 //limit<0
    var limit2 = 2 //limit=n
    var limit3 = 4 //limit=n
    var limit4 = 3 //limit>n
    var limit5 = 5 //limit>n
    var limit6 = -9223372036854775808 //limit为Int64最小值
    var limit7 = 9223372036854775807 //limit为Int64最大值
    var matchresult1 = "a6Ud87ddddddd5Uu"
    var matchresult2 = "adddd87ddddddddddu"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchDatalist1 = Matcher(regex1, matchString).replaceAll(replaceString, limit1)
    var matchDatalist2 = Matcher(regex2, matchString).replaceAll(replaceString, limit1)
    var matchDatalist3 = regex1.matcher(matchString).replaceAll(replaceString, limit1)
    var matchDatalist4 = regex2.matcher(matchString).replaceAll(replaceString, limit1)

    if (matchDatalist1 != matchresult1 || matchDatalist2 != matchresult2 || matchDatalist3 != matchresult1 ||
        matchDatalist4 != matchresult2) {
        print("${matchDatalist1}+${matchDatalist2}+${matchDatalist3}+${matchDatalist4}\n")
        return 1
    }
    var matchDatalist5 = Matcher(regex1, matchString).replaceAll(replaceString, limit2)
    var matchDatalist6 = Matcher(regex2, matchString).replaceAll(replaceString, limit3)
    var matchDatalist7 = regex1.matcher(matchString).replaceAll(replaceString, limit2)
    var matchDatalist8 = regex2.matcher(matchString).replaceAll(replaceString, limit3)

    if (matchDatalist5 != matchresult1 || matchDatalist6 != matchresult2 || matchDatalist7 != matchresult1 ||
        matchDatalist8 != matchresult2) {
        print("${matchDatalist5}+${matchDatalist6}+${matchDatalist7}+${matchDatalist8}\n")
        return 2
    }
    var matchDatalist9 = Matcher(regex1, matchString).replaceAll(replaceString, limit4)
    var matchDatalist10 = Matcher(regex2, matchString).replaceAll(replaceString, limit5)
    var matchDatalist11 = regex1.matcher(matchString).replaceAll(replaceString, limit4)
    var matchDatalist12 = regex2.matcher(matchString).replaceAll(replaceString, limit5)

    if (matchDatalist9 != matchresult1 || matchDatalist10 != matchresult2 || matchDatalist11 != matchresult1 ||
        matchDatalist12 != matchresult2) {
        print("${matchDatalist9}+${matchDatalist10}+${matchDatalist11}+${matchDatalist12}\n")
        return 3
    }
    var matchDatalist13 = Matcher(regex1, matchString).replaceAll(replaceString, limit6)
    var matchDatalist14 = Matcher(regex2, matchString).replaceAll(replaceString, limit6)
    var matchDatalist15 = regex1.matcher(matchString).replaceAll(replaceString, limit6)
    var matchDatalist16 = regex2.matcher(matchString).replaceAll(replaceString, limit6)

    if (matchDatalist13 != matchresult1 || matchDatalist14 != matchresult2 || matchDatalist15 != matchresult1 ||
        matchDatalist16 != matchresult2) {
        print("${matchDatalist13}+${matchDatalist14}+${matchDatalist15}+${matchDatalist16}\n")
        return 4
    }
    var matchDatalist17 = Matcher(regex1, matchString).replaceAll(replaceString, limit7)
    var matchDatalist18 = Matcher(regex2, matchString).replaceAll(replaceString, limit7)
    var matchDatalist19 = regex1.matcher(matchString).replaceAll(replaceString, limit7)
    var matchDatalist20 = regex2.matcher(matchString).replaceAll(replaceString, limit7)

    if (matchDatalist17 != matchresult1 || matchDatalist18 != matchresult2 || matchDatalist19 != matchresult1 ||
        matchDatalist20 != matchresult2) {
        print("${matchDatalist17}+${matchDatalist18}+${matchDatalist19}+${matchDatalist20}\n")
        return 5
    }
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
