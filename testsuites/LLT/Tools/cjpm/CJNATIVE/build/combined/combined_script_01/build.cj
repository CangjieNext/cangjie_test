// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.process.*
import script_dep.*
import script_dep.doo.*

@When[os == "Windows"]
func stagePreBuild(): Int64 {
    if ((scriptDep == "scriptDep") && (dooEnv.endsWith("build-script.exe"))) {
        return 0
    }
    return 1
}

@When[os != "Windows"]
func stagePreBuild(): Int64 {
    if ((scriptDep == "scriptDep") && (dooEnv.endsWith("build-script"))) {
        return 0
    }
    return 1
}

main(): Int64 {
    match (Process.current.arguments[0]) {
        case "pre-build" => stagePreBuild()
        case _ => 0
    }
}
