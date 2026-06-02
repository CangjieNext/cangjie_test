/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {
    public mut prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class B <: A {
    public mut static redef prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

main(): Int64 {
    if (A.i != 0) {
        return 1
    }
    if (B.i != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_illegal_access_non_static_member
