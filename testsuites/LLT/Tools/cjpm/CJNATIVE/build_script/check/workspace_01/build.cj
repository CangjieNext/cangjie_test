// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*

func stagePre(): Int64 {
    println("pre-check")
    0
}

func stagePost(): Int64 {
    println("post-check")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-check" => stagePre()
        case "post-check" => stagePost()
        case _ => 0
    }
}
