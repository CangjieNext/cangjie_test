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
    Aa(Array<Int64>)
    | Bb(Array<T>)
}

main(): Int64 {
    var a = E<Int64>.Aa([1])
    var b = E<Int64>.Bb([1])
    var res1 = match (a) {
        case Aa(x) => x.size - 1
        case _ => 1
    }
    var res2 = match (b) {
        case Bb(x) => x.size - 1
        case _ => 1
    }
    return res2 + res1
}
