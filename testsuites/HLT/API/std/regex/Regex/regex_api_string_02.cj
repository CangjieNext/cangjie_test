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

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var regexString = ""
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchresult1 = regex1.string()
    var matchresult2 = regex2.string()
    if (matchresult1 != regexString || matchresult2 != regexString) {
        print("${matchresult1}+${matchresult2}\n")
        return 1
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
