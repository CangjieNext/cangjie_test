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
    public var base: T
    public init(x: T) {
        base = x
    }
}

class Data<T> <: Base<Int32> {
    public var a: T
    public var f: T
    public init(input: T) {
        super(0)
        a = input
        f = foo()
    }
    public func foo(): T {
        return a
    }
}

main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if (res1 == 4 && res2 == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_illegal_usage_of_member
