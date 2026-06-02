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

main(): Int64 {
    var a = if (false) {
        foo1
    } else {
        foo2
    }
    var res = match (a) {
        case x: (Rune) -> Unit => 0
        case _ => 1
    }
    return res
}

// Rune -> Unit
func foo1(x: Any): Unit {} // Any -> Unit  S1->T1

func foo2(x: Rune): Unit {} // Rune -> Unit S2 ->T2
