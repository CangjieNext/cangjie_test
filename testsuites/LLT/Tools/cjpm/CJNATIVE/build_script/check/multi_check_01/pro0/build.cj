// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.fs.*

func stagePreCheck(): Int64 {
    var output: String = "pre-check-pro0\n"
    File.appendTo("pre-check-pro0.info", output.toArray())
    0
}

func stagePostCheck(): Int64 {
    var output: String = "post-check-pro0\n"
    File.appendTo("post-check-pro0.info", output.toArray())
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-check" => stagePreCheck()
        case "post-check" => stagePostCheck()
        case _ => 0
    }
}
