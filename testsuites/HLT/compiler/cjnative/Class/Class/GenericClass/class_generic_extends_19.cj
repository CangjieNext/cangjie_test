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
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Data<T> <: Base<Int32> {
    public var a: T
    public init(input: T) {
        super(0)
        a = input
    }
}

main(): Int64 {
    var base: Base<Int32> = Base<Int32>(3)
    var data: Data<Int32> = Data<Int32>(5)
    var res: Int32 = data.a
    if (res == 5) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_member_variable_can_not_shadow
