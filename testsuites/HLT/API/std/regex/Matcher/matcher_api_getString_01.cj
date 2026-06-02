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
    var regexString = "[0-9][a-z]"
    var resetStr = ""
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var resetStr1 = Matcher(regex1, resetStr).getString()
    var resetStr2 = Matcher(regex2, resetStr).getString()
    var resetStr3 = regex1.matcher(resetStr).getString()
    var resetStr4 = regex2.matcher(resetStr).getString()

    if (resetStr1 != resetStr) {
        print("${resetStr1}\n")
        return 1
    } else if (resetStr2 != resetStr) {
        print("${resetStr2}\n")
        return 2
    } else if (resetStr3 != resetStr) {
        print("${resetStr3}\n")
        return 3
    } else if (resetStr4 != resetStr) {
        print("${resetStr4}\n")
        return 4
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
