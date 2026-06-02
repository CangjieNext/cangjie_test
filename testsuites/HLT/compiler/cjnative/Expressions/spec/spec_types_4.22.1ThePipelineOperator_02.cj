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

// PIPELINE with operator `()`
class A {
    public operator func ()(x: Int32) {
        x
    }
}

main(): Int64 {
    let obj = A()
    let a: Int32 = 1
    let res = a |> obj // Equivalence：obj.operator()(a)   

    return 0
}
