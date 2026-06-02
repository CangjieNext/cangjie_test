/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_var_in_or_condition

main() {
    var a = 0
    if (let a1 <- 1 || let a2 <- 1 || (a < 0 && a == 0)) {
        return 0
    }
    return 1
}
