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
    // \d匹配任何十进制数字
    var regexstr10 = "\\d"
    var matcherstr8 = "d%*^4\t0b10o300x18"
    var matcher10 = Regex(regexstr10).matcher(matcherstr8)
    var result101 = matcher10.find().getOrThrow().matchString()
    var result102 = matcher10.find().getOrThrow().matchString()
    var result103 = matcher10.find().getOrThrow().matchString()
    var result104 = matcher10.find().getOrThrow().matchString()
    var result105 = matcher10.find().getOrThrow().matchString()
    var result106 = matcher10.find().getOrThrow().matchString()
    var result107 = matcher10.find().getOrThrow().matchString()
    var result108 = matcher10.find().getOrThrow().matchString()
    var result109 = matcher10.find().getOrThrow().matchString()
    if (result101 != "4" || result102 != "0" || result103 != "1" || result104 != "0" || result105 != "3" || result106 !=
        "0" || result107 != "0" || result108 != "1" || result109 != "8") {
        print(
            "Part9+${result101}+${result102}+${result103}+${result104}+${result105}+${result106}+${result107}+${result108}+${result109}\n")
        return 1
    }
    // \D匹配不是十进制数字的字符
    var regexstr11 = "\\D"
    var matcherstr9 = "d%*^4\t0b10o300x18"
    var matcher11 = Regex(regexstr11).matcher(matcherstr9)
    var result111 = matcher11.find().getOrThrow().matchString()
    var result112 = matcher11.find().getOrThrow().matchString()
    var result113 = matcher11.find().getOrThrow().matchString()
    var result114 = matcher11.find().getOrThrow().matchString()
    var result115 = matcher11.find().getOrThrow().matchString()
    var result116 = matcher11.find().getOrThrow().matchString()
    var result117 = matcher11.find().getOrThrow().matchString()
    var result118 = matcher11.find().getOrThrow().matchString()
    if (result111 != "d" || result112 != "%" || result113 != "*" || result114 != "^" || result115 != "\t" ||
        result116 != "b" || result117 != "o" || result118 != "x") {
        print(
            "Part11+${result111}+${result112}+${result113}+${result114}+${result115}+${result116}+${result117}+${result118}\n")
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
