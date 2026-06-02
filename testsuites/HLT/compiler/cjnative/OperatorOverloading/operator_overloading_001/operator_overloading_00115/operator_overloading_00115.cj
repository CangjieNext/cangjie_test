/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: operator_overloading_00115a 
// EXEC: %compiler %cmp_opt %compile_lib_opt operator_overloading_00115a/operator_overloading_00115a.cj -o operator_overloading_00115a.%middle
// EXEC: %compiler %cmp_opt %f operator_overloading_00115a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import operator_overloading_00115a

main(): Int64 {
    let a1 = operator_overloading_00115a.A()
    let a2 = operator_overloading_00115a.A()
    let b1 = operator_overloading_00115a.B()
    let b2 = operator_overloading_00115a.B()
    let c1: operator_overloading_00115a.C = operator_overloading_00115a.D()
    let c2: operator_overloading_00115a.C = operator_overloading_00115a.D()
    operator_overloading_00115a.A.test()
    return Int64((a1 + a2) + (b1 + b2) + (c1 + c2))
}
