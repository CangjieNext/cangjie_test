/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {}

interface I2 {}

class A <: I1 & I2 {}

class B <: I1 & I2 {}

main(): Int64 {
    var a = A()
    var b = B()
    let myArray = [a, b]
    return 0
}
// ASSERT: scan sema_inconsistency_elemType
