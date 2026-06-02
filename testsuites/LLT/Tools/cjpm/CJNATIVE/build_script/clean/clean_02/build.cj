// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*
import std.fs.*

func stagePreClean(): Int64 {
    var output: String = "pre-clean"
    File.appendTo("src/pre-clean.info", output.toArray())
    1
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-clean" => stagePreClean()
        case _ => 0
    }
}
