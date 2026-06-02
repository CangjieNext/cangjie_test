/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base {
    public init() {
    }
}

class Test <: Base {
    // only one error message, same as java
    public init() {
        this(true)
    }

    public init(a: Bool) {
        this(true, true)
    }

    public init(a: Bool, b: Bool) {
        this(true, true, true)
    }

    public init(a: Bool, b: Bool, c: Bool) {
        this(true, true, true, true)
    }

    public init(a: Bool, b: Bool, c: Bool, d: Bool) {
        this(true, true, true, true, true)
    }

    public init(a: Bool, b: Bool, c: Bool, d: Bool, e: Bool) {
        this(true, true, true, true, true, true)
    }

    public init(a: Bool, b: Bool, c: Bool, d: Bool, e: Bool, f: Bool) {
        this()
    }
}

main(): Int64 {
    var test: Test = Test()
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
