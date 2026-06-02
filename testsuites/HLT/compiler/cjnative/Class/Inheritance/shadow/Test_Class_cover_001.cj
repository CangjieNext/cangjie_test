/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class C1 {
    public let x = 1
}

class C2 <: C1 {
    public let x = "new"

    public var super_acc_father: Int64

    public let v_c1 = C1()
    public var object_acc_father = v_c1.x
    public init() {
        super_acc_father = super.x
    }
}

main(): Int64 {
    let obj = C2()
    let r = obj.x

    var father1 = obj.super_acc_father
    let father2 = obj.object_acc_father

    if (r != "new" || father1 != 1 || father2 != 1) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
