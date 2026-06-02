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
    // \s 匹配任何空白字符，空白字符包括（\r \n a\t \f \v）
    var regexstr8 = "\\s"
    var matcherstr6 = "%\r\na\t\f\v"
    var matcher8 = Regex(regexstr8).matcher(matcherstr6)
    var result81 = matcher8.find().getOrThrow().matchString()
    var result82 = matcher8.find().getOrThrow().matchString()
    var result83 = matcher8.find().getOrThrow().matchString()
    var result84 = matcher8.find().getOrThrow().matchString()
    var result85 = matcher8.find().getOrThrow().matchString()
    if (result81 != "\r" || result82 != "\n" || result83 != "\t" || result84 != "\f" || result85 != "\v") {
        print("Part7+${result81}+${result82}+${result83}+${result84}+${result85}\n")
        return 1
    }

    // \S  匹配非空白字符
    var regexstr9 = "\\S"
    var matcherstr7 = "d%*^z4\t\v\n\f\r_"
    var matcher9 = Regex(regexstr9).matcher(matcherstr7)
    var result91 = matcher9.find().getOrThrow().matchString()
    var result92 = matcher9.find().getOrThrow().matchString()
    var result93 = matcher9.find().getOrThrow().matchString()
    var result94 = matcher9.find().getOrThrow().matchString()
    var result95 = matcher9.find().getOrThrow().matchString()
    var result96 = matcher9.find().getOrThrow().matchString()
    var result97 = matcher9.find().getOrThrow().matchString()
    if (result91 != "d" || result92 != "%" || result93 != "*" || result94 != "^" || result96 != "4") {
        print("Part8+${result91}+${result92}+${result93}+${result94}+${result95}+${result96}+${result97}\n")
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
