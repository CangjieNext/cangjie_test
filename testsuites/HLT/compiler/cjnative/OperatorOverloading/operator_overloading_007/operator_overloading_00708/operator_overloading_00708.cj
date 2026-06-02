/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: operator_overloading_00708a.cj
// EXEC: %compiler %cmp_opt %f operator_overloading_00708a.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package operator_overloading_00708

main(): Int64 {
    let a = A()
    a * a
    if (!(a * a)) {
        return 1
    }
    let b: D = B()
    if (!(b * b)) {
        return 2
    }
    let c = C()
    if (!(c * c)) {
        return 3
    }
    return 0
}
