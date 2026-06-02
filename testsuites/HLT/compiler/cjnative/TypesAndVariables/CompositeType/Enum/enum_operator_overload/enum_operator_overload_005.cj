/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

enum Table<T, K> where T <: Hashable & Equatable<T> {
    | Map(HashMap<T, K>)

    operator func [](index: T): K {
        match (this) {
            case Map(map) => map[index]
        }
    }

    operator func [](index: T, value!: K) {
        match (this) {
            case Map(map) => map[index] = value
        }
    }
}

main() {
    let table: Table<String, Int64> = Table.Map(HashMap([("hello", 0), ("world", 0)]))
    table["hello"] = 1
    table["world"] = 2
    if (table["hello"] + table["world"] == 3) {
        return 0
    }
    return 1
}
