/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

const func a() {
    return "abc"
}

const func b() {
    return "ABC"
}

let s1 = a()
var s2 = b()
const r1 = s1 == s2

main() {
    return 0
}
// ASSERT: scan sema_expect_const
