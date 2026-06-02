// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.fs.*

func stagePreBuild(): Int64 {
    var output: String = "pre-build-main\n"
    File.appendTo("pre-build-main.info", output.toArray())
    0
}

func stagePostBuild(): Int64 {
    var output: String = "post-build-main\n"
    File.appendTo("post-build-main.info", output.toArray())
    0
}

func stagePreRun(): Int64 {
    var output: String = "pre-run-main\n"
    File.appendTo("pre-run-main.info", output.toArray())
    0
}

func stagePostRun(): Int64 {
    var output: String = "post-run-main\n"
    File.appendTo("post-run-main.info", output.toArray())
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case "pre-run" => stagePreRun()
        case "post-run" => stagePostRun()
        case _ => 0
    }
}
