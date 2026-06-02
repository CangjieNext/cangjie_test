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
    public var one: Int32 = 1
}

class Data <: Base {
    public var one: Int32 = 2
    public var res: Int32 = one
}

main(): Int64 {
    var obj = Data()
    if (obj.res != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
