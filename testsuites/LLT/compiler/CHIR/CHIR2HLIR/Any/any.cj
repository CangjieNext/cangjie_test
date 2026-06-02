// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var b: Any = [1, 2, 3]

    var c: Any = Int64(1)

    let var1: Any = Int8(-1)
    match (var1 as Int8) {
        case Some(x) => x
        case _ => Int8(1)
    }
    return 0
}
