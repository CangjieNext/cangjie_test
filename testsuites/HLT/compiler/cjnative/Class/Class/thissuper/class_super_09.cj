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
    public var i: Int32 = 2
    public open func foo(): Int32 {
        return 3
    }
}

open class Middle<T> <: Base<T> {}

class Test <: Middle<Int32> {
    public var i: Int32
    public init() {
        i = super.foo() + 1
    }
    public override func foo(): Int32 {
        return 4
    }
}

class Data<T> <: Middle<T> {
    public var i: Int32
    public init() {
        i = super.foo() + 2
    }
    public override func foo(): Int32 {
        return 4
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if (res1 == 4 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_illegal_usage_of_member
