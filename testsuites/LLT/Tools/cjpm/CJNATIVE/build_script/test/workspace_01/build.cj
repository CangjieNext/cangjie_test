// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*

func stagePreBuild(): Int64 {
    println("pre-build")
    0
}

func stagePostBuild(): Int64 {
    println("post-build")
    0
}

func stagePreTest(): Int64 {
    println("pre-test")
    0
}

func stagePostTest(): Int64 {
    println("post-test")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case "pre-test" => stagePreTest()
        case "post-test" => stagePostTest()
        case _ => 0
    }
}
