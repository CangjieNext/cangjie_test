/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A {
    var a = 1
}

main() {
    const temp: (A: A, open: Int64) = (A(), 1)
    return temp[0].a - temp[1]
}
// ASSERT: scan sema_expect_const
