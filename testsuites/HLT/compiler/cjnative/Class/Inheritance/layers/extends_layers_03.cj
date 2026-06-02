/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base3 {
    public func foo3(): Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    public func foo2(): Int32 {
        return 2
    }
}

class Data <: Base2 {
    public var one: Int32 = foo3() + foo2()
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.one
    if (res != 5) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
