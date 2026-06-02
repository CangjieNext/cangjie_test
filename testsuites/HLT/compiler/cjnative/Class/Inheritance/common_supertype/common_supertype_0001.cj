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

interface I2 {}

open class C1 <: I1 & I2 {}

class C2 <: C1 {}

class C3 <: I1 & I2 {}

main() {
    var i1: I1 = C1()
    var a = [i1, C1(), C3()]
    if (a is Array<I1>) {
        return 0
    }
    return 1
}
