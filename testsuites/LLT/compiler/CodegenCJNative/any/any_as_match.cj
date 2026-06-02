// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

let var1: Any = Int8(-1)

main(): Int64 {
    var result: Int64 = 0

    if (match (var1 as Int8) {
        case Some(x) => x
        case _ => Int8(1)
    } != Int8(-1)) {
        return 1
    }
    return result
}
