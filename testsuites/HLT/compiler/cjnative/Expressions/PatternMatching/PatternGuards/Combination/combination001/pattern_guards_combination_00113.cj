/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
enum A {
    a(Int64)
}

main() {
    var i: A = A.a(1)
    var a: Int64 = match (i) {
        case a(x) where (false) => 2
        case a(x) where (true) => 1
        case _ => 0
    }
    return (a - 1)
}
