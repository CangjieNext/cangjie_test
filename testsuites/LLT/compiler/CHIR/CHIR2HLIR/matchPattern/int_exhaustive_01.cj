// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    let x = match (10) {
        case 10 => 0
        case 10 => 10
        case _ => 1
        case 1 => 2
    }
    x
}
