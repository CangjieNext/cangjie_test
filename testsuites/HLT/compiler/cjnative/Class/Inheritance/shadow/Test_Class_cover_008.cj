/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class C1 {
    public static func x(): Int64 {
        return 2
    }
}

class C2 <: C1 {
    public static let x = 1
}

main(): Int64 {
    let v_x = C1.x()
    var v_c1_x = C2.x

    if (v_c1_x != 1 || v_x != 2) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_inherit_member_kind_inconsistent
