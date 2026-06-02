/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface I1 {
    static func f(): Int32 {
        return 1
    }
}

class C2 <: I1 {
    public static var f: Int32 = 2
}

main(): Int64 {
    var r = C2.f

    if (r != 2 || I1.f() != 1) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_inherit_member_kind_inconsistent
