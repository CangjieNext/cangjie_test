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
    // .
    var regexstr5 = "."
    var matcherstr3 = "d%z4\t"
    var matcher5 = Regex(regexstr5).matcher(matcherstr3)
    var result51 = matcher5.find().getOrThrow().matchString()
    var result52 = matcher5.find().getOrThrow().matchString()
    var result53 = matcher5.find().getOrThrow().matchString()
    var result54 = matcher5.find().getOrThrow().matchString()
    var result55 = matcher5.find().getOrThrow().matchString()
    if (result51 != "d" || result52 != "%" || result53 != "z" || result54 != "4" || result55 != "\t") {
        print("Part4+${result51}+${result52}+${result53}+${result54}+${result55}")
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
