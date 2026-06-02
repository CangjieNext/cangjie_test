/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: Int64 = 1
    if (a.n != 1) {
        return 1
    }
    a.m = 10
    if (a.m != 2) {
        return 2
    }
    return 0
}

type I = Int64

extend I {
    private mut prop m: Int32 {
        get() {
            return 2
        }
        set(v) {}
    }
    public prop n: Int32 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan sema_invalid_access_control
// ASSERT: scan sema_invalid_mut_modifier_extend_of_struct
