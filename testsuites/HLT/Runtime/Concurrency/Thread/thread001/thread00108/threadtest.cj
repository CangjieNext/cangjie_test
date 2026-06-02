/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// ( not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f

// ASSERT: scan This is main\nThis is a new thread, sum = 3\nThis is a new thread, sum = 7\nsum = 7\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

main(): Int64 {
    print("This is main\n")
    let fut: Future<Unit> = spawn {
        add(1, 2)
        let fut: Future<Int32> = spawn {
            add(3, 4)
        }
    }
    sleep(Duration.millisecond * 2000);
    print("sum = ${sum}\n")
    if (sum != 7) {
        return 1
    }
    return 0
}
