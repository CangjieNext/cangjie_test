/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    if (B<String>("a").a != "a") {
        return 1
    }
    return 0
}

open class A<T> {
    public var x: T
    public init(y: T) {
        x = y
    }
}

class B<V> <: A<V> {
    public init(n: String) {
        super(n)
    }
    public prop a: V {
        get() {
            return x
        }
    }
}
// ASSERT: scan sema_mismatched_types
