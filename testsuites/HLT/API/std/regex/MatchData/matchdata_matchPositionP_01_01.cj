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
    var regexString = "((ab)+?)([0-9]{2})"
    var matchString1 = "dsdabab34234565323dsdabab34234565323"

    var regex1 = Regex(regexString)
    var matcher1 = regex1.matcher(matchString1)
    var find1 = matcher1.find().getOrThrow().matchPosition(1)
    var find2 = matcher1.find().getOrThrow().matchPosition(1)
    if ((find1.start != 3) || (find1.end != 7)) {
        print("${find1.start}+${find1.end}\n")
        return 1
    } else if (find2.start != 21 || find2.end != 25) {
        print("${find2.start}+${find2.end}\n")
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
