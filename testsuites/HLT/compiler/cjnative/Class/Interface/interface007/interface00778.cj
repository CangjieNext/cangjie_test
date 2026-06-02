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

interface I1 {
    mut static prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

interface I2 <: I1 {
    mut static prop a: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface I3 <: I1 {
    mut static prop a: Int64 {
        get() {
            2
        }
        set(v) {}
    }
}

func test<T>(): Int64 where T <: I1 {
    T.a
}

main(): Int64 {
    return test<I3>() + test<I2>() + test<I1>() - 3
}
