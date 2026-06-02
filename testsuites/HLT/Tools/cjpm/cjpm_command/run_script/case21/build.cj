/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// build.cj

internal import std.process.*

func stagePreTest(): Int64 {
    println("PRE-TEST")
    0
}

func stagePostTest(): Int64 {
    println("POST-TEST")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-test" => stagePreTest()
        case "post-test" => stagePostTest()
        case _ => 0
    }
}
