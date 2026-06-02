// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.process.*

func stagePreBuild(): Int64 {
    println("PRE-BUILD")
    0
}

func stagePostBuild(): Int64 {
    println("POST-BUILD")
    0
}

func stagePreInstall(): Int64 {
    println("PRE-INSTALL")
    0
}

func stagePostInstall(): Int64 {
    println("POST-INSTALL")
    0
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case "post-build" => stagePostBuild()
        case "pre-install" => stagePreInstall()
        case "post-install" => stagePostInstall()
        case _ => 0
    }
}
