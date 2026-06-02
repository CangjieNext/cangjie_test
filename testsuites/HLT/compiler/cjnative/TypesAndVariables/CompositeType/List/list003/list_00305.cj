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

enum E<T> {
    a1(Array<Int64>)
    | b1(Array<T>)
}

main(): Int64 {
    var a = a1<Int64>([1])
    var b = b1<Int64>([1])
    var res1: Int64 = match (a) {
        case a1(x) => x.size
        case _ => 0
    }
    var res2: Int64 = match (b) {
        case b1(x) => x.size
        case _ => 0
    }
    return res1 + res2 - 2
}
