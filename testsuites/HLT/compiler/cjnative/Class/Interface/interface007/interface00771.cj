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

interface I1<T> {
    mut static prop a: Int64
}

interface I2<T> <: I1<Int64> {
    mut static prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

main(): Int64 {
    return I2<Bool>.a
}
