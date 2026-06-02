// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.HashMap
internal import stdx.encoding.json.*
internal import std.time.*
internal import cache.*

// From user's complicated case.

main() {
    let de = Duration.minute * 5
    let ci = Duration.minute * 10
    let cache = Cache<Int64>(de, ci)
    cache.Set("1", 1)

    let i = cache.Get("1") ?? 0
    println("i: ${i}")
}
