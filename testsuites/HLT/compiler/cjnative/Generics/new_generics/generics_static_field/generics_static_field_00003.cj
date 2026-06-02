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


struct A<T> {
    static var a = 1
    mut static prop p: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main() {
    A<Int64>.p = 0
    return A<Bool>.p
}
