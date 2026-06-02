/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func foo1(x: (((Any) -> Unit) -> Any) -> Unit): Unit {}

func foo2(x: (((Rune) -> Unit) -> Unit) -> Unit): Unit {}

main(): Int64 {
    var a = if (true) {
        foo1
    } else {
        foo2
    }
    var res = match (a) {
        case x: ((((Any) -> Unit) -> Any) -> Unit) -> Unit => 0
        case _ => 1
    }
    return res
}
