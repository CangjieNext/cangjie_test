// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    let x = match ((0, 0)) {
        case (0, 0) => 0
        case (0, _) => 1
        case (_, 0) => 2
        case (_, _) => 3
        case (1, 1) => 4
        case _ => 5
    }
    x
}
