/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type Int = Int32

func add(left: Int, right: Int32): Int {
    left + right
}

func add(left: Int32, right: Int32): Int32 {
    left + right
}

main() {
    let numOne: Int32 = 10
    let numTwo: Int = 20
    let numThree = numOne + numTwo
    add(numTwo, numOne)
    return 0
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_ambiguous_match
