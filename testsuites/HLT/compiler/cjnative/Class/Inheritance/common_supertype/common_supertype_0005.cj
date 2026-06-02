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

interface I1 {}

interface I2 <: I1 {}

struct C1 <: I1 & I2 {}

struct C2 <: I1 {}

struct C3 <: I2 {}

main() {
    var a = [C1(), C2(), C3()]
    if (a is Array<I1>) {
        return 0
    }
    return 1
}
