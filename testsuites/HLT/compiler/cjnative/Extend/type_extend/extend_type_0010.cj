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
class A {}

interface I1 {}

interface I2 {}

interface I3 {}

interface I4 {}

interface I5 {}

interface I6 {}

interface I7 {}

interface I8 {}

interface I9 {}

extend A <: I1 & I2 & I3 & I4 & I5 & I6 & I7 & I8 & I9 {}

main(): Int64 {
    if (A() is I1 && A() is I2 && A() is I3 && A() is I4 && A() is I5 && A() is I6 && A() is I7 && A() is I8 &&
        A() is I9) {
        return 0
    }
    return 2
}
