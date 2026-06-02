/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {
    func test(): Unit
}

interface I2 {
    func test(): Int64
}

class A<T> where T <: I1 & I2 {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_inherit_member_type_inconsistent
