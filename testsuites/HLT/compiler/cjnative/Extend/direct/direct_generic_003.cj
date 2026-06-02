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

class A<T> {
    static var a: Int64 = 1
}

extend<T> A<T> {
    mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main() {
    A<Int64>.pa = 1
    return A<Int64>.pa - 1
}
