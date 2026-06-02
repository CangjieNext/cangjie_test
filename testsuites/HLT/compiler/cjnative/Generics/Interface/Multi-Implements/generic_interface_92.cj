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
    if (B<String>().m != 1) {
        return 1
    }
    return 0
}

interface I1<T> {
    func foo(): Int64 {
        return 1
    }
}

interface I2<T> <: I1<T> {}

interface J<T> <: I1<String> & I2<Int64> {
    func foo(): Int64 {
        return 1
    }
    prop m: Int64 {
        get() {
            return foo()
        }
    }
}

class B<T> <: J<T> {}
