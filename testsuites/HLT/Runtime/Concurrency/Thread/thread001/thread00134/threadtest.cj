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


var sum: Int32 = 0

main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int32> = spawn {
        while (sum < 10) {
            sum = sum + 1
        }
        print("This is a new thread, sum = ${sum}\n")
        return sum
    }
    sleep(Duration.second);
    if (sum != 10) {
        return 1
    }
    return 0
}
