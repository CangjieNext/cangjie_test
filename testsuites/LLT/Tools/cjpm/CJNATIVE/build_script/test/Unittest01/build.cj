// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.fs.*

func stagePreBuild(): Int64 {
    var output: String = "pre-build-main\n"
    File.appendTo("pre-build-pro0.info", output.toArray())
    0
}

func stagePostBuild(): Int64 {
    var output: String = "post-build-main\n"
    File.appendTo("post-build-pro0.info", output.toArray())
    0
}

func stagePreTest(): Int64 {
    var output: String = "pre-test-main\n"
    File.appendTo("pre-test-pro0.info", output.toArray())
    0
}

func stagePostTest(): Int64 {
    var output: String = "post-test-main\n"
    File.appendTo("post-test-pro0.info", output.toArray())
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
