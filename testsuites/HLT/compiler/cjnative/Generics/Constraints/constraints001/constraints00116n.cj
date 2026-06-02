/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {
    func test(): Int
}

interface I2 {
    func test(): UInt
}

class C {}

extend C <: I {
    public func test(): Int {
        1
    }
}

class A<T> where T <: C & I2 {}

func test<T>() where T <: C & I2 {
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_inherit_member_type_inconsistent
