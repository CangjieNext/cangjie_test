/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_extend_member_cannot_shadow

class A<T> {
    func foo(a: Int32, b!: Int64 = 0) {
    }
}

type C<T> = A<T>

extend<T> C<T> {
    public static func foo(a: Int32, b!: Int64 = 0) {
    }
}

main(): Int64 {
    return 0
}
