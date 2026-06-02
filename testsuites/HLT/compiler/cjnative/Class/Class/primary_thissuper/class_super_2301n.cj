/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

abstract class FaData<T> {
    public var b: Int32 = 1
    public func f(x: T): T
}

class Data<T> <: FaData<T> {
    public var b: T
    public Data(x: T) {
        b = super.f(x)
    }
    public func f(x: T): T {
        return x
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(6)
    var res2: Int32 = data.b
    if (res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_abstract_method_cannot_be_accessed_directly
