/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

internal import std.collection.HashMap
internal import stdx.encoding.json.*
internal import std.time.*
internal import test.cache.*

main(): Unit {
    println("hello world")

    let de = Duration.minute * 5
    let ci = Duration.second * 10
    let cache = Cache<Int64>(de, ci)
    cache.Add("1", 1)
    cache.Add("1", 1)
    cache.Add("2", 1)
    cache.Set("1", 1)
    cache.Increment("1", 2)

    let i = cache.Get("1") ?? 0
    println("i: ${i}")
    sleep(Duration.microsecond * 1)
}
