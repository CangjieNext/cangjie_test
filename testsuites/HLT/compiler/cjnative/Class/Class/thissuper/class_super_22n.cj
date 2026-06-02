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
    public static func f() {
        super.foo()
        super.i
    }
}

class Data<T> <: Base<T> {
    public static func f() {
        super.foo()
        super.i
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    test.f()
    data.f()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_object_cannot_access_static_member
