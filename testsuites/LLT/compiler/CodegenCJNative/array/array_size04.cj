// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix

main() {
    let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let b = match (true) {
        case true => arr
        case _ => [1, 2]
    }.size

    if (b == 10) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
