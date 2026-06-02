/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output 

open class B<T> {
    var c = 0

    func bbb(a: T) {
    }
}

class A<T> <: B<T> {
    public A(let b!: Int32 = 0) {
    }
}

extend<T> A<T> {
    public static func me(a: T) {
        super.c
        super.bbb(a)
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_extend_use_super
