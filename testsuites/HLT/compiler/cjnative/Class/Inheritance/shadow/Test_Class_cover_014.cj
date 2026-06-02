/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class C1 {
    public static let f1 = "new"
}

class C2 <: C1 {
    public static var x1 = 1
    public static func f1() {
        return x1
    }
}

main(): Int64 {
    var v1 = C2.f1()

    var v2 = C1.f1

    if (v1 != 1 || v2 != "new") {
        return 1
    }

    return 0
}
// ASSERT: scan sema_inherit_member_kind_inconsistent
