/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Base {
    public static func foo() {
        return 1
    }
}

class Data <: Base {
    public static func foo(a!: Int64 = 0, b!: Bool = true) {
        return a
    }

    public static func foo(a: Int64, b: Bool, c!: Bool = true) {
        if (b) {
            return 1
        } else {
            return a
        }
    }

    public static func foo(a: Int64, b: Bool, c!: Float32 = 0.0) {
        if (b) {
            return 1
        } else {
            return a
        }
    }

    public static func inside() {
        return foo()
            + foo(0, true)
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan parse_nl_warning
// ASSERT: scan sema_ambiguous_match
