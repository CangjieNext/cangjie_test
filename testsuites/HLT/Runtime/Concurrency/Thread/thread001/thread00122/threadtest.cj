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


var sum: UInt64 = 0

func add(a: UInt64, b: UInt64): UInt64 {
    sum = a + b
    return sum
}

main(): Int64 {
    let fut1: Future<UInt64> = spawn {
        return add(1, 2)
        return add(3, 4)
    }
    sleep(Duration.second);
    if (sum != 3) {
        return 1
    }
    return 0
}
