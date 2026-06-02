/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    public var a: Int32
    public init(a: Int32) {
        this.a = a
    }
}

interface C {}

class B <: C {
    public var b: Int32
    public init(b: Int32) {
        this.b = b
    }
}

main(): Int64 {
    var l: C = B(1)
    var r: A = A(2)
    l = r
    if (l.a == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_not_member_of
