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

extend A <: I {}

main(): Int64 {
    if (A13() is I && A12() is I && A11() is I && A10() is I && A9() is I && A8() is I && A7() is I && A6() is I &&
        A5() is I && A4() is I && A3() is I && A2() is I && A1() is I && A() is I) {
        return 0
    }
    return 2
}
