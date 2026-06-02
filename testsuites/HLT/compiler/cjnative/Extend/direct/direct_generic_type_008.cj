/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

struct B <: A {
    B(var b: Int64) {
    }
}

struct C<T> where T <: A {
    func foo<T>(a: T) {
        return a
    }

    static func foos<T>(a: T) {
        return a
    }
}

extend<T> C<T> where T <: B {
    func foo<T>(a: T) {
        return a
    }

    static func foos<T>(a: T) {
        return a
    }
}

main() {
    return 1
}
// ASSERT: scan sema_extend_member_cannot_shadow
