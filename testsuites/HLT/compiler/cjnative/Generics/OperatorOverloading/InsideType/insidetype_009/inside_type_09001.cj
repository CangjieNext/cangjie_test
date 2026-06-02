/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class C {
    public let c: Int64 = 1
}

class A<T> <: C {
    public func test(): Int64 {
        1
    }
    public let i: Int64 = 1
    public operator func *(input_b: A<T>): Bool {
        var a = i
        var b = test()
        var c = this()
        var d = super()
        var e = super.c
        var f = this.i
        var g = this.test()
        return true
    }
}

main(): Int64 {
    return 1
}

// ASSERT: regex-not :18:.*-not error
// ASSERT: regex-not no position error occurred
// ASSERT: scan sema_invalid_this_call_outside_ctor
