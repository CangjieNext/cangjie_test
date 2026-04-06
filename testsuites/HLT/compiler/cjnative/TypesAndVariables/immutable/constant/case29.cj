/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

const func test(a: Int64) {
    const b: Int64 = a
    return b
}

main() {
    return test(1) - 1
}
// ASSERT: scan sema_expect_const
