/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.HashMap
import stdx.encoding.json.*
import std.time.*
import std.runtime.*
import std.argopt.*
import std.process
import cache.*

// From user's complicated case.

main() {
    let de = Duration.minute * 5
    let ci = Duration.minute * 10
    let cache = Cache<Int64>(de, ci)
    cache.Set("1", 1)

    let i = cache.Get("1") ?? 0
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    println("i: ${i}")
}
