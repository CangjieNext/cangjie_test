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
    let expr1 = false
    let expr2 = true
    !true // Logical NOT, return false.
    1 > 2 && expr1 // Logical AND, return false without computing the value of expr1.
    1 < 2 || expr2 // Logical OR, return true without computing the value of expr2

    if (!((!true) && (1 > 2 && expr1))) {
        print("false")
    }
    if (1 < 2 || expr2) {
        print("true")
    }
    return 0
}
