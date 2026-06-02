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
    public var a: Array<(Int64, Int64)>
    public init(input: Int64) {
        this.a = [(input, input)]
    }
}

open class B {
    public var b: A
    public init(input: Int64) {
        this.b = A(input)
    }
    public func test_b(): Int64 {
        var r_a: Int64 = 2
        this.b.a[0][0] = Int64(r_a)
        return 0
    }
}

class C <: B {
    public init(input: Int64) {
        super(input)
    }
    public func test_c(): Int64 {
        var r_a: Int64 = 2
        super.b.a[0][1] = Int64(r_a)
        super.test_b()
        return super.b.a[0][1] - super.b.a[0][0]
    }
}

main(): Int64 {
    var c = C(4)
    return c.test_c()
}
// ASSERT: scan sema_unqualified_left_value_assigned
