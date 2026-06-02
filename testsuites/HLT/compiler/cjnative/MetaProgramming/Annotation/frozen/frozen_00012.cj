/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A<T> {}

extend<T> A<T> {
    @Frozen
    prop p1: Int64 {
        get() {
            0
        }
    }

    @Frozen
    static prop p2: Int64 {
        get() {
            0
        }
    }
}

main() {
    return A<Int64>().p1 + A<Int64>.p2
}
