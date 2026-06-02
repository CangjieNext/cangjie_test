/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base<T> {
    public var i: Int32

    public Base() {
        foo()
    }

    public open func foo(): Int32 {
        return 3
    }
}

class Test <: Base<Int32> {
    public var i: Int32
    public init() {
        foo()
    }
    public init(x: Int32) {
        i = x
    }

    public override func foo(): Int32 {
        return 4
    }
}

main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.i
    print(res1.toString())
    return Int64(res1 - 2)
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_illegal_member_used_in_open_constructor
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_illegal_usage_of_member
