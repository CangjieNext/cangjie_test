/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    if (test() != 1) {
        return 1
    }
    return 0
}

func test() {
    var a: HashMap<Int8, String> = HashMap<Int8, String>(3, {x: Int64 => (Int8(x), x.toString())})
    var b = a.foo()
    return b
}

extend<K, V> HashMap<K, V> where K <: Hashable & Equatable<K> {
    public func foo():Int64 {
        return 1
    }
}
