/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
import std.ffi.python.*
import std.log.*

@When[os == "Linux" || os == "HarmonyOS"]
let suffixOfDy = "so"
@When[os == "macOS"]
let suffixOfDy = "dylib"

main(): Int64 {
    Python.load("\n  my.${suffixOfDy} \n", loglevel: LogLevel.INFO)
    println("${Python.isLoad()}")
    Python.unload()
    return 0
}
