// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-1: %run %run_opt %output %run_args

main() {
    let x = match ((true, true)) {
        case (true, false) => 0
        case (true, _) => 1
        case (_, _) => 3
        case (_, _) => 3
        case _ => 3
    }
    x
}
