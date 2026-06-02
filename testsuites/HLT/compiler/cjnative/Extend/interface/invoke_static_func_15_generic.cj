/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A<T> {
    public var b: Int32
    public A(b!: Int32 = 0) {
        this.b = b
    }
}

interface I<T> {
    static func foo() {
    }
}

extend<T> A<T> <: I<T> {
    public static func me<T>() {
        return this.b
    }

    static prop c: Int32 {
        get() {
            this.b
        }
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_static_members_cannot_call_members
