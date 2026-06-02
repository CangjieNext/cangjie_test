/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// build.cj

internal import std.process.*

func stagePreTree(): Int64 {
    println("pre tree test")
    0
}

func stagePostTree(): Int64 {
    println("post tree test")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-tree" => stagePreTree()
        case "post-tree" => stagePostTree()
        case "pre-build" => stagePreTree()
        case "post-build" => stagePostTree()
        case _ => 0
    }
}
