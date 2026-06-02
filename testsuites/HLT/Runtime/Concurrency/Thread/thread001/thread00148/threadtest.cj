/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan result = 1\n

var result: Int64 = 0

func x(input: Int64): Int64 {
    input
}

main(): Int64 {
    let fut1: Future<Int64> = spawn {
        result = 1 |> ((x ~> x) ~> (x ~> x))
        return result
    }
    sleep(Duration.second);
    if (result != 1) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
