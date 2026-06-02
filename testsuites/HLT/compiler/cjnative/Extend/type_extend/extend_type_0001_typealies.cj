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

extend TA <: TI {}

type TI = I

type TA = A

main(): Int64 {
    let l = {a: TI => a}

    if (l(TA()) is TI && l(TA()) is TA) {
        return 0
    }
    return 1
}
