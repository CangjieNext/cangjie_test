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

interface I {}

type TI = I

type TA = A

extend TA <: TI {}

func foo(a: TI) {
    return 1
}

func foo(a: TA) {
    return 2
}

main(): Int64 {
    return foo(TA()) - 2
}
