// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    | Year(Int64)
    | Month(Int64, Int64)
}

main() {
    let x = match (Year(2022)) {
        case Month(1, 10) => 1
        case Year(_) => 0
        case Month(1, _) => 2
        case Month(_, 10) => 3
        case Month(_, _) => 4
    }
    x
}
