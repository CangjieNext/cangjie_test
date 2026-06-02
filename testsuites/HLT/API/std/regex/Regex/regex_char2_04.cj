/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var count: Int64 = 0
    //  \w  匹配任何非单词字符
    var regexstr6 = "\\w"
    var matcherstr4 = "d%4\t"
    var matcher6 = Regex(regexstr6).matcher(matcherstr4)
    var result61 = matcher6.find().getOrThrow().matchString()
    var result62 = matcher6.find().getOrThrow().matchString()

    try {
        var result63 = matcher6.find().getOrThrow().matchString()
    } catch (e: Exception) {
        count = count + 1
    }
    if (result61 != "d" || count != 1) //
    {
        print("Part5+${result61}+${result62}\n")
        return 1
    }
    //  \W  匹配任何非单词字符
    var regexstr7 = "\\W"
    var matcherstr5 = "d%$4\t_"
    var matcher7 = Regex(regexstr7).matcher(matcherstr5)
    var result71 = matcher7.find().getOrThrow().matchString()
    var result72 = matcher7.find().getOrThrow().matchString()
    var result73 = matcher7.find().getOrThrow().matchString()
    if (result71 != "%") {
        print("Part6+${result71}+${result72}+${result73}\n")
        return 2
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
