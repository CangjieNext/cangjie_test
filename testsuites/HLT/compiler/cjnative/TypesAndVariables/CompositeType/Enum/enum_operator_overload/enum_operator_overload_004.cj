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

enum Table<T> {
    | A(Table<T>)
    | B(T)

    operator func [](index: T): T {
        match (this) {
            case A(table) => index
            case B(t) => t
        }
    }
}

main() {
    let table1: Table<String> = A(A(A(A(B("Cangjie")))))
    let table2: Table<String> = B("Hello")
    if (table1["0"] + table1["1"] + table1["2"] + table2["Cangjie"] == "012Hello") {
        return 0
    }
    return 1
}
