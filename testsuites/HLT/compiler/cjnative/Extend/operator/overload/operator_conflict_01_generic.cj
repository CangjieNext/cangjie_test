/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f  -o %output

main(): Int64 {
    1
}

interface I {
    operator func ==(right: Int32): Bool {
        if (right == 0) {
            return true
        } else {
            return false
        }
    }
}

extend Int32 <: I {
    public operator func ==(right: Int32): Bool {
        if (right == 0) {
            return true
        } else {
            return false
        }
    }
}
// ASSERT: scan sema_operator_overload_built_in_binary_operator
// ASSERT: scan sema_extend_member_cannot_shadow
