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
    var targetstr: String = #"9"#

    var regex2 = Regex(str)
    var matchesresult1 = Matcher(regex2, targetstr).getString() //init(Regex: Regex, input: String)--->targetstr

    var regex1 = Regex(str)
    var matcher1 = Matcher(regex1, str)
    var matchesresult2 = matcher1.replace(targetstr) //replace(replacement: String) : String--->targetstr

    var matcher2 = Matcher(regex1, str)
    var matchesresult3 = matcher2.replace(targetstr, 0) //replace(replacement: String, index: int64): String--->targetstr

    var matcher3 = Matcher(regex1, str)
    var matchesresult4 = matcher3.replaceAll(targetstr) //replaceAll(replacement: String) : String--->targetstr

    var matcher4 = Matcher(regex1, str)
    var matchesresult5 = matcher4.replaceAll(targetstr, 1) //replaceAll(replacement: String, limit :int64 ) : String--->targetstr

    var matcher5 = Matcher(regex1, str)
    var matchesresult6 = matcher5.resetString(targetstr).getString() //resetString(input: String): Matcher--->targetstr
    if (matchesresult1 != targetstr || matchesresult2 != targetstr || matchesresult3 != targetstr || matchesresult4 !=
        targetstr || matchesresult5 != targetstr || matchesresult6 != targetstr) {
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
