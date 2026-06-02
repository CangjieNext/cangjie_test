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

class Test <: Base<Int32> {
    public var i: Int32 = 3
    public override func foo(): Int32 {
        return 4
    }
    public var i1: Int32
    public var i2: Int32
    public Test() {
        i1 = super.i
        i2 = super.foo()
    }
}

class Data<T> <: Base<T> {
    public var i: Int32 = 3
    public override func foo(): Int32 {
        return 4
    }
    public var i1: Int32
    public var i2: Int32
    public Data() {
        i1 = super.i + 1
        i2 = super.foo() + 1
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i1
    var res2: Int32 = test.i2
    var res3: Int32 = data.i1
    var res4: Int32 = data.i2
    if (res1 == 2 && res2 == 3 && res3 == 3 && res4 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_illegal_usage_of_member
