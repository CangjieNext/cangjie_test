// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// EXEC-PIPE-0: %run %run_opt %output %run_args 

internal import std.random.Random

main() {
    let rnd = Random()
    let counts = [0, 0]
    for (_ in 0..100) {
        counts[rnd.nextInt64(2)] += 1 // counts.[](rnd.next(), counts.[](rnd.next()) + 1)
    }
    println(counts)
    return counts[0] + counts[1] - 100
}
