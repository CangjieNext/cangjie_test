// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.fs.*

func stagePreBuild(): Int64 {
    var output: String = "pre-build-pro0\n"
    File.appendTo("pre-build-pro0.info", output.toArray())
    0
}

func stagePostBuild(): Int64 {
    var output: String = "post-build-pro0\n"
    File.appendTo("post-build-pro0.info", output.toArray())
    0
}

func stagePreRun(): Int64 {
    var output: String = "pre-run-pro0\n"
    File.appendTo("pre-run-pro0.info", output.toArray())
    0
}

func stagePostRun(): Int64 {
    var output: String = "post-run-pro0\n"
    File.appendTo("post-run-pro0.info", output.toArray())
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
