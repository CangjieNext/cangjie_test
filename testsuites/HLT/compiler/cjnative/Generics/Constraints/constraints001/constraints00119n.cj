/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    func test(): UInt
}

class C {}

extend C {
    public func test(): Int {
        1
    }
}

class A<T> where T <: C & I {}

func test<T>() where T <: C & I {
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_inherit_member_type_inconsistent
