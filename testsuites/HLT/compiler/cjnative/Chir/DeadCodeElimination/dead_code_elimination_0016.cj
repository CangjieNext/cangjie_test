/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var a = [1, 2, 3]
    for (i in 0..10) {
        a[break]
    }
    return 0
}
// ASSERT: scan sema_invalid_subscript_expr
