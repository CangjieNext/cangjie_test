/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var sum: Int32 = 0

main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int32> = spawn {
        sum = sum + 1
        continue
        print("This is a new thread, sum = ${sum}\n")
        return sum
    }
    sleep(Duration.second);
    if (sum != 10) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_loop_control
