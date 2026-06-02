/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public var b: Int32
    public A(b!: Int32 = 0) {
        this.b = b
    }
}

extend<T> A<T> {
    public static func me() {
        return this.b
    }
}

main(): Int64 {
    return Int64(A.me())
}
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_unable_to_infer_generic_func
