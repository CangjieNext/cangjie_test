/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public var a: Int32 = 2
    protected init(x: Int32) {
        a = x
    }
    public func foo(): Int32 {
        this.a + 1
    }
}

class Data <: Base {
    public var b: Int32
    public init() {
        super(3)
        b = super.foo()
    }
}

main(): Int64 {
    var data1 = Data()
    if (data1.b == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_illegal_usage_of_member
