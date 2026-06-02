/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

sealed class cls {
    var x = 0
    prop sealed: Int64 {
        get() {
            x
        }
    }
}

main(): Int64 {
    if (cls().sealed == 0) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_non_abstract_class_cannot_be_sealed
