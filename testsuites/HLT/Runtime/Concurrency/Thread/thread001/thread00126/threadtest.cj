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


var sum: Float64 = 0.0

func add(a: Float64, b: Float64): Float64 {
    sum = a + b
    return sum
}

main(): Int64 {
    print("This is main\n")
    let fut1: Future<Float64> = spawn {
        return add(1.1, 2.2)
        return add(3.3, 4.4)
    }
    sleep(Duration.second);
    if (sum >= 3.30000000000001 || sum <= 3.29999999999999) {
        return 1
    }
    return 0
}
