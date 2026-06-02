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
open class A {}

open class A1 <: A {}

open class A2 <: A1 {}

open class A3 <: A2 {}

open class A4 <: A3 {}

open class A5 <: A4 {}

open class A6 <: A5 {}

open class A7 <: A6 {}

open class A8 <: A7 {}

open class A9 <: A8 {}

open class A10 <: A9 {}

open class A11 <: A10 {}

open class A12 <: A11 {}

open class A13 <: A12 {}

interface I {}

type TI = I

type TA = A

type TA1 = A1

type TA2 = A2

type TA3 = A3

type TA4 = A4

type TA5 = A5

type TA6 = A6

type TA7 = A7

type TA8 = A8

type TA9 = A9

type TA10 = A10

type TA11 = A11

type TA12 = A12

type TA13 = A13

extend A <: I {}

main(): Int64 {
    if (TA13() is TI && TA12() is TI && TA11() is TI && TA10() is TI && TA9() is TI && TA8() is TI && TA7() is TI &&
        TA6() is TI && TA5() is TI && TA4() is TI && TA3() is TI && TA2() is TI && TA1() is TI && TA() is TI) {
        return 0
    }
    return 2
}
