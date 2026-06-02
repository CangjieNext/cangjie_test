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
    return 0
}

extend (Int32, Int64) {
    public mut static prop ms: Int64 {
        get() {
            return 4
        }
        set(v) {}
    }
    public static prop ns: Int64 {
        get() {
            return 3
        }
    }
}
// ASSERT: scan sema_illegal_extended_type
// ASSERT: scan sema_immutable_type_illegal_property
