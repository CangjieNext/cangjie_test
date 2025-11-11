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
    public open func foo(x: T, y: T): T {
        return x
    }
}

class Data<T> <: Base<T> {
    public init(x: T) {}
    public func foo(x: Int32, y: Int32): Int32 {
        var result: Int32 = x + y
        return result
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(3)
    var a = data.foo(3, 4)
    if (a != 7) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
