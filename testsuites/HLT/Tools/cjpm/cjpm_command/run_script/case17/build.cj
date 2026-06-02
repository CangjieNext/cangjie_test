/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// build.cj

internal import std.process.*

func stagePreRun(): Int64 {
    println("PRE-RUN")
    0
}

func stagePostRun(): Int64 {
    println("POST-RUN")
    1
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-run" => stagePreRun()
        case "post-run" => stagePostRun()
        case _ => 0
    }
}
