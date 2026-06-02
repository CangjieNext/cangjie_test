/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base<T> {
    public var i: Int32 = 2
    public open func foo(x: Int32): Int32 {
        return 3
    }
}

class Test <: Base<Int32> {
    public var i: Int32
    public Test() {
        i = foo(super.i)
    }
    public override func foo(x: Int32): Int32 {
        return 3 + x
    }
}

class Data<T> <: Base<T> {
    public var i: Int32
    public Data() {
        i = foo(super.i)
    }
    public override func foo(x: Int32): Int32 {
        return 4 + x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_illegal_usage_of_member
