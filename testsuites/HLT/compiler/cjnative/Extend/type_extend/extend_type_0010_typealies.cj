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

type TI1 = I1

type TI2 = I2

type TI3 = I3

type TI4 = I4

type TI5 = I5

type TI6 = I6

type TI7 = I7

type TI8 = I8

type TI9 = I9

type TA = A

extend TA <: TI1 & TI2 & TI3 & TI4 & TI5 & TI6 & TI7 & TI8 & TI9 {}

main(): Int64 {
    if (TA() is TI1 && TA() is TI2 && TA() is TI3 && TA() is TI4 && TA() is TI5 && TA() is TI6 && TA() is TI7 &&
        TA() is TI8 && TA() is TI9) {
        return 0
    }
    return 2
}
