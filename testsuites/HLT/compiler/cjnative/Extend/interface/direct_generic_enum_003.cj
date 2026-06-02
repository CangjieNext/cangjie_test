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

var a: Int64 = 5

enum A<T> {
    EA(T)
}

extend<T> A<T> <: I<T> {}

interface I<T> {
    static prop pa: Int64 {
        get() {
            a
        }
    }
}

main() {
    return A<Int64>.pa - 5
}
