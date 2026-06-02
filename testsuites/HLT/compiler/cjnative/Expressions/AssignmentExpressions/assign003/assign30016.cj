/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1| compare %f

class A {
    public var a: Array<(Int32, Int32)>
    public init(input: Int32) {
        this.a = [(input, input)]
    }
}

open class B {
    public var b: A
    public init(input: Int32) {
        this.b = A(input)
    }
    public func test_b(): Int32 {
        this.b.a[0][0]++
        if (this.b.a[0][0] != Int32(5)) {
            return 1
        }
        this.b.a[0][0]--
        if (this.b.a[0][0] != Int32(4)) {
            return 2
        }
        return 0
    }
}

class C <: B {
    public init(input: Int32) {
        super(input)
    }
    public func test_c(): Int32 {
        super.b.a[0][1]++
        if (this.b.a[0][1] != Int32(5)) {
            return 1
        }
        this.b.a[0][1]--
        if (this.b.a[0][1] != Int32(4)) {
            return 2
        }
        return super.test_b()
    }
}

main(): Int64 {
    var c = C(4)
    return c.test_c()
}
// ASSERT: scan sema_unqualified_left_value_assigned
// ASSERT: scan sema_mismatched_types
