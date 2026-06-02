/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {}

interface I<T> {
    static func foo(a: T) {
        return a
    }
}

extend<T> A<T> where T <: String {
    func foo1() {
        foo1()
    }
}

extend<T> A<T> where T <: Int32 {
    func foo2() {
    }
}

main() {
    return A<Int64>.foo(-1) + A<Int64>.foo(1)
}
// ASSERT: scan sema_unable_to_infer_return_type
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
