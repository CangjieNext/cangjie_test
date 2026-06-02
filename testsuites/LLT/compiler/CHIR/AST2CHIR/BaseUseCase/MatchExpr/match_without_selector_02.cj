// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

main() {
    var a = 3
    let b = match {
        case a < 3 => return 2
        case a > 2 && a < 4 => return 1
        case _ => return 0
    }
    return b
}
