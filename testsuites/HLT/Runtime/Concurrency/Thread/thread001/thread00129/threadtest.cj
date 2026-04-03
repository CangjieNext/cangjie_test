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

// ASSERT: scan cangjie

var sum: String = ""

func add(a: String, b: String): String {
    sum = a + b
    return sum
}

main(): Int64 {
    let fut1: Future<String> = spawn {
        return add("cang", "jie")
        return add("仓", "颉")
    }
    sleep(Duration.second);
    print(sum)
    return 0
}
