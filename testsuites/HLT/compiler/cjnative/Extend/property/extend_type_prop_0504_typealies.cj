/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1| compare %f

main(): Int64 {
    var a: IntNative = 1
    a.m = 10
    return 0
}

type I = IntNative

extend I {
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
}
// ASSERT: scan sema_invalid_mut_modifier_extend_of_struct
