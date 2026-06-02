// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TypeBase {
    | I8
    | UI8
}

main() {
    let x = match ((I8, false)) {
        case (I8, false) where false => 3
        case (I8, true) where false => 2
        case (UI8, _) where false => 1
        case _ => 0
    }
    x
}
