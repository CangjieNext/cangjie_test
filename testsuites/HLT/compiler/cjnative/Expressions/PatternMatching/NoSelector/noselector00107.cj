/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



func test(): Int64 {
    let i = ("Allen", 90)
    match {
        case i in ("Bob", 90) => "Bob got 90"
        case _ => "default"
    }
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan parse_expected_double_arrow_in_case
