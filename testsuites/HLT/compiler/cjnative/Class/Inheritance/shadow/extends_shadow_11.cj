/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base {
    public func test(): Int32 {
        return 1
    }
}

class Data <: Base {
    public var test: Int32 = 2
}

main(): Int64 {
    var obj1 = Base()
    var obj2 = Data()

    var res1: Int32 = obj1.test()
    var res2: Int32 = obj2.test

    return 0
}
// ASSERT: scan sema_inherit_member_kind_inconsistent
// ASSERT: scan sema_mismatched_types
