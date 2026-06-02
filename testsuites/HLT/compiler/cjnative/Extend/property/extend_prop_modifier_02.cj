/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

extend Int64 {
    protected mut prop m: Int32 {
        get() {
            return 2
        }
        set(v) {}
    }
}
// ASSERT: scan sema_invalid_mut_modifier_extend_of_struct
