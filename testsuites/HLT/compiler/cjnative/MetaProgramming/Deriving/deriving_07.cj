/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
import std.deriving.*

@Derive[Comparable]
enum A {
    TT(Int64)
}

main() {
    var a = A.TT(1)
    var b = A.TT(2)
    if (a < b) {
        return 0
    } else {
        return 1
    }
}
