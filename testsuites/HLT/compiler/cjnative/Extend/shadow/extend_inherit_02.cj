/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class B <: A {
    public func foo2(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

open class A {}

extend A {
    public func foo2(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

extend A {
    public static func foo3() {
        return 1
    }
}

extend A {
    public func foo4() {
        3
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_extend_function_cannot_overridden
