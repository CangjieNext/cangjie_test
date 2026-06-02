/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regstr = "[0-9][a-z]"
    var matstr = ""
    var str = "5d"

    var regex1 = Regex(regstr)
    var matcher1 = Matcher(regex1, str)
    var matchesresult2 = matcher1.replace(matstr) //replace(replacement: String) : String--->matstr

    var matcher2 = Matcher(regex1, str)
    var matchesresult3 = matcher2.replace(matstr, 0) //replace(replacement: String, index: int64): String--->matstr

    var matcher3 = Matcher(regex1, str)
    var matchesresult4 = matcher3.replaceAll(matstr) //replaceAll(replacement: String) : String--->matstr

    var matcher4 = Matcher(regex1, str)
    var matchesresult5 = matcher4.replaceAll(matstr, 1) //replaceAll(replacement: String, limit :int64 ) : String--->matstr

    var matcher5 = Matcher(regex1, str)
    var matchesresult6 = matcher5.resetString(matstr).getString() //resetString(input: String): Matcher--->matstr
    if (matchesresult2 != matstr || matchesresult3 != matstr || matchesresult4 != matstr || matchesresult5 != matstr ||
        matchesresult6 != matstr) {
        print("${matchesresult2}+${matchesresult3}+${matchesresult4}+${matchesresult5}+${matchesresult6}\n")
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
