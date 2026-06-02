// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    let opOmt32_2 = Option<Int32>.None
    let num1 = match (opOmt32_2) {
        case Some(num) => 2
        case None => 0
    }
    if (num1 != 0) {
        return 2
    }
    return 0
}
