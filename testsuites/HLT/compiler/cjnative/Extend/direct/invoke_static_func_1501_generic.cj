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
    public var b: T
    public A(b!: T) {
        this.b = b
    }
}

extend<T> A<T> {
    public static func me(a: T) {
        b = a
        return 2
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
