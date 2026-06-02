// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

main() {
    var a = (2, 'a')
    match (a) {
        case (1, 'a') | (2, 'c') => return 1
        case (1, _) | (_, 'a') => return 0
        case _ => return 3
    }
}
