/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) ERRCHECK: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base<T> {
    protected var base: T
    init(x: T) {
        base = x
    }
}

class Data<T> <: Base<Int32> {
    var d: Int32 = base
    init(input: T) {
        super(3)
    }
}

main(): Int64 {
    var i1: Int32 = 5
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = data.base
    if (res == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_illegal_usage_of_super_member
