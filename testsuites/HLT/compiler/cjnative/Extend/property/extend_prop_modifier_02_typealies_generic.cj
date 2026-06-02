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

main(): Int64 {
    return Int64(A<Int8>().m - 2)
}

class int<T> {}

type A<T> = int<T>

extend<T> A<T> {
    protected mut prop m: Int32 {
        get() {
            return 2
        }
        set(v) {}
    }
}
