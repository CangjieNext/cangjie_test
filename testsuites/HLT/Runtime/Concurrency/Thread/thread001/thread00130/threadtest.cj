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


var sum: (Int64, Int64) = (0, 0)

func add(a: Int64, b: Int64): (Int64, Int64) {
    sum = (a, b)
    return sum
}

main(): Int64 {
    let fut1: Future<(Int64, Int64)> = spawn {
        add(1, 2)
        return (2, 3)
        add(3, 4)
    }
    sleep(Duration.second);
    if (sum != (1, 2)) {
        return 1
    }
    return 0
}
