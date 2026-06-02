/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main(): Int64 {
    let regex = Regex("a*")
    let matcher = regex.matcher("aa")
    match (matcher.fullMatch()) {
        case Some(s) => print("true")
        case None => print("false")
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.second * 2)
        GC()
        sleep(Duration.second * 2)
    }
    0
}
