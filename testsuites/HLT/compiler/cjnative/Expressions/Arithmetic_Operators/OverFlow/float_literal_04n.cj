/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    var lit01 = 2.10e-308
    var lit02 = -1.8e308

    if (lit01 != 2.2e-308) {
        return 1
    }
    if (lit02 != -1.8e308) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_float_literal_too_large
