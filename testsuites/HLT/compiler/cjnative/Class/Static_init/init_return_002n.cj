/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct rec {
    static var a: Int64 = 0
    static init() {
        a = 1
        return a
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_invalid_return_in_static_init
