// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
/* SCAN
1
[(3, 3), (4, 4)]
*/

import std.collection.HashMap
main() {
    println(Helper1.v.toString())
    println(Helper2.CACHE.toString())
}
public class Helper1 {
    static func foo<T>(x: T): Int64 where T <: ToString { x.toString().size }
    static let v = foo(1)
}
public class Helper2 {
    static let CACHE = HashMap<String, ToString>()
    static init() {
        register("3", 3)
        register("4", 4)
    }
    public static func register<T>(key: String, value: T) where T <: ToString  {
        CACHE.add(key, value)
    }
}
