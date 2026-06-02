// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: regex-auto matched123456789

enum TimeUnit1_2 {
    Day(TimeUnit1_2)
    | Year(Int64)
}

func foo1() {
    var e = Year(123456789)
    match (e) {
        case Year(v) => println("matched${v}")
        case _ => println("failed")
    }
}

main(): Int64 {
    foo1()
    return 0
}
