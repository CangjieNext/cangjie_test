// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.HashMap
main() {
    println("Hello World")
}
public class Helper1 {
    private static let CACHE = HashMap<String, ToString>()
    static init() {
        register("1", 1)
        register("2", 2)
    }
    public static func register(key: String, value: Int64)  {
        CACHE.add(key, value)
    }
}
public class Helper2 {
    private static let CACHE = HashMap<String, ToString>()
    static init() {
        register("1", 1)
        register("2", 2)
    }
    public static func register<T>(key: String, value: T) where T <: ToString  {
        CACHE.add(key, value)
    }
}