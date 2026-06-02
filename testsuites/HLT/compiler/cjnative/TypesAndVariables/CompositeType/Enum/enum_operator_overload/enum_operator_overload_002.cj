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

enum Table<T> {
    | Arr(Array<T>)
    | Map(HashMap<Int64, T>)
}

extend<T> Table<T> {
    operator func [](index: Int64): T {
        match (this) {
            case Arr(arr) => arr[index]
            case Map(map) => map[index]
        }
    }

    operator func [](index: Int64, value!: T) {
        match (this) {
            case Arr(arr) => arr[index] = value
            case Map(map) => map[index] = value
        }
    }
}

main() {
    let table1 = Table<String>.Arr(["hello", "world"])
    let table2 = Table<String>.Map(HashMap([(0, "hello"), (1, "world")]))
    table1[0] = "cangjie"
    table1[1] = "hello"
    table2[0] = "cangjie"
    table2[1] = "hello"
    if (table1[0] + table1[1] == "cangjiehello" && table2[0] + table2[1] == "cangjiehello") {
        return 0
    }
    return 1
}
