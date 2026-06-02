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

interface I3 {}

interface I4 <: I3 {}

interface I2 <: I4 {}

interface I1 <: I2 & I3 {}

func f(x: I4): Int64 {
    return 1
}

func f(x: I3): Int64 {
    return 2
}

class C1 <: I1 {}

main() {
    var obj = C1()
    var result = f(obj) // match (f(x: I4)) {...}
    if (result == 1) {
        return 0
    }
    return 1
}
