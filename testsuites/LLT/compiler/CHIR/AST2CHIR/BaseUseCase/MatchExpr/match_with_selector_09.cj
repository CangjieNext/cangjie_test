// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-3: %run %run_opt %output

main() {
    var a = (1, (2, (3, 4)))
    let ret = match (a) {
        case (1, (2, (v, 4))) => v
        case _ => 0
    }
    return ret
}
