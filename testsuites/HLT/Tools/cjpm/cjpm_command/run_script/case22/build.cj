/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// build.cj

internal import std.process.*

func stagePreCheck(): Int64 {
    println("PRE-CHECK")
    0
}

func stagePostCheck(): Int64 {
    println("POST-CHECK")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-check" => stagePreCheck()
        case "post-check" => stagePostCheck()
        case _ => 0
    }
}
