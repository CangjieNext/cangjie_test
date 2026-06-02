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

interface Base3 {
    func foo(): Int64
}

interface Data {
    func foo(): Int64 {
        return 1
    }

    func foo(a: Int64): Int64 {
        return a
    }
}

class Test <: Base3 & Data {}

main(): Int64 {
    return 0
}
