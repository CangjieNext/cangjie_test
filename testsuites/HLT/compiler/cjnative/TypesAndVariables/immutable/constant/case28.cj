/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
const func a() {
    return "abc"
}

const func b() {
    return "ABC"
}

const s1 = a()
const s2 = b()
const r1 = s1 == s2

main() {
    if (r1) {
        return 1
    }
    return 0
}
