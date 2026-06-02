/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base3 {
    public var test: Int32 = 1
}

open class Base2 <: Base3 {
    public var test: Int32 = 2
}

class Data <: Base2 {
    public var test: Int32 = 3
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.test
    if (res != 3) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
