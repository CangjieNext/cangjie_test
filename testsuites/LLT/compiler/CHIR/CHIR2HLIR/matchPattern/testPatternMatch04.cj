// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(x: Int64, y: Int64): Int64 {
    var res = match (x) {
        case _: Int32 => 1
        case v0: Int64 => v0 + y
        case v1: Float64 => y
        case _ => 0
    }

    return res
}

main() {
    let res = test(1, 2)
    if (res == 3) {
        return 0
    } else {
        return 1
    }
}
