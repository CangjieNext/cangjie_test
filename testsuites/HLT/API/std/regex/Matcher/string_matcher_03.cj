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
    var str = "re\nre"
    var replacestr = "ty\ndf"

    var regex2 = Regex(str)
    var matchesresult1 = Matcher(regex2, str).getString() //init(Regex: Regex, input: String)--->str

    var regex1 = Regex(str)
    var matcher1 = Matcher(regex1, str)
    var matchesresult2 = matcher1.replace(replacestr) //replace(replacement: String) : String--->replacestr

    var matcher2 = Matcher(regex1, str)
    var matchesresult3 = matcher2.replace(replacestr, 0) //replace(replacement: String, index: int64): String--->replacestr

    var matcher3 = Matcher(regex1, str)
    var matchesresult4 = matcher3.replaceAll(replacestr) //replaceAll(replacement: String) : String--->replacestr

    var matcher4 = Matcher(regex1, str)
    var matchesresult5 = matcher4.replaceAll(replacestr, 1) //replaceAll(replacement: String, limit :int64 ) : String--->replacestr

    var matcher5 = Matcher(regex1, str)
    var matchesresult6 = matcher5.resetString(replacestr).getString() //resetString(input: String): Matcher--->replacestr
    if (matchesresult1 != str || matchesresult2 != replacestr || matchesresult3 != replacestr || matchesresult4 !=
        replacestr || matchesresult5 != replacestr || matchesresult6 != replacestr) {
        print(
            "${matchesresult1}+${matchesresult2}+${matchesresult3}+${matchesresult4}+${matchesresult5}+${matchesresult6}\n")
        return 1
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
