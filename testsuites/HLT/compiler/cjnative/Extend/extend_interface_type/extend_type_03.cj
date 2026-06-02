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

class B <: A {}

interface I1 {}

interface I2 {}

extend B <: I1 & I2 {}

main() {
    let ins: I1 = B()
    println(ins is B) // true
    println(ins is A) // 期望结果是true。若只按照基本场景处理结果是false
    println(ins is I2)
    return 0
}
