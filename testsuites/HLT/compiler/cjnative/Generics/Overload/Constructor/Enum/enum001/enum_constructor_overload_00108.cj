/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum B {
    a
}

enum A {
    a(Int64)
}

main(): Int64 {
    var i = a
    var res: Int64 = match (i) {
        case _: B => 0
        case _ => 1
    }
    return res
}
