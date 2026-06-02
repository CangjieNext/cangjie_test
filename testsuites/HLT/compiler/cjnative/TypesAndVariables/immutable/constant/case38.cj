/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    const a = [1, 1]
    const b = 1
    var c = 1
    const d = a[0] + b - c
    return a[0] - 1
}
// ASSERT: scan sema_expect_const
