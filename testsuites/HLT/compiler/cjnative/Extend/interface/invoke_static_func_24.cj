/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A {
    A(var a!: Int64 = 5) {
    }
}

interface I {
    static func foo() {
        1
    }
}

extend A <: I {
    public static func me() {
        return 0
    }

    public static func me(): Int64 {
        return a
    }

    public func me(): Int32 {
        return 0
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_function_overload_conflicts
// ASSERT: scan sema_static_function_cannot_access_non_static_member
